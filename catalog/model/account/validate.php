<?php
/**
 * yangshengcheng@gmail.com
 * date:20130303
 * desc: 用于用户注册时产生验证短信发送到用户填写的手机号码上
 * **/

class ModelAccountValidate extends Model {
	public function repeatCheck($mobile,$maxRepeat,$second)
	{
		
		$query = $this->db->query("select count(*) as count from  ". DB_PREFIX ."sms_verify where phoneNum='". $mobile ."' and TO_DAYS(overdueTime) = TO_DAYS(now()) order by overdueTime desc");

		if(! $query->num_rows)
		{
			return "";
		}
		if($query->row['count'] > $maxRepeat)
		{
			return "maxrepeat";
		}


		$query = $this->db->query("select overdueTime from  ". DB_PREFIX ."sms_verify where phoneNum='". $mobile ."' and TO_DAYS(overdueTime) = TO_DAYS(now()) order by overdueTime desc limit 1");
		
		$dt = strtotime($query->row['overdueTime']);
		if(! $dt)
		{
			return "";
		}
		if((time() - ($dt - 1800)) < $second)
		{
			return "minrepeat";
		}

		return "";

	}

	public function sendValidateCode($mobile) {
		//预定义参数，参数说明见文档
		$spid="5198";
		$spsc="00";
		$sppassword="zscf123";
		$sa="10";
		$da=$mobile;
		$dc="15";
		
		//6位随机码
		$rand_array = array('0','1','2','3','4','5','6','7','8','9');
		$randNum = '';
		for($i=0;$i<6;$i++)
		{
			$randNum =$randNum . $rand_array[rand(0, 9)];
		}
		
		//从configuration表中获取注册验证短信
		$validate_str = '123456';
		$query = $this->db->query("select * from  ". DB_PREFIX . "configuration where paraIndex='3'");
		if($query->num_rows)
		{
			$validate_str = $query->row['paraValue'];
		}	
		//将%s符号替换成随即数字
		$validate_str = str_replace('%s',$randNum,$validate_str);	

		//字符集从UTF-8转换为GB2312,忽略产生的错误
		$sm=iconv("UTF-8", "GB2312//IGNORE", $validate_str);
				
		$host="esms.etonenet.com";
		//发送端口，默认80.
		$port=80;
		//拼接URI
		$request = "/sms/mt";
		$request.="?command=MT_REQUEST&spid=".$spid."&spsc=".$spsc."&sppassword=".$sppassword;
		$request.="&sa=".$sa."&da=".$da."&dc=".$dc."&sm=";
		$request.=self::encodeHexStr($dc,$sm);//下发内容转换HEX编码
		$content = self::doGetRequest($host,$port,$request);//调用发送方法发送
		if($content)
		{
			$overdueTime = time() + 1800;
			$overdueTime = date('Y-m-d H:i:s',$overdueTime);
			$this->addVerify($mobile,$randNum,$overdueTime,1);		
		}
				
		return $content;
	}
	
	
	/**
	 * 将成功的验证信息插入sms_verify表
	 * @param String $phoneNum
	 * @param String $verify
	 * @param String $timestamp
	 * @param tinyint $state
	 * @return query object
	 * 
	 * **/
	public function addVerify($phoneNum , $verify, $overdueTime,$state=1)
	{
		$query = $this->db->query("insert into " . DB_PREFIX . "sms_verify(`phoneNum`,`verify`,`overdueTime`,`state`) values("."'".$phoneNum."',"."'".$verify."',"."'".$overdueTime."',".$state. ")");
		return $query;
	}
	
	public static function doGetRequest($host,$port,$request) {
		$method="GET";
		return self::httpSend($host,$port,$method,$request);
	}
	public static function doPostRequest($host,$port,$request) {
		$method="POST";
		return self::httpSend($host,$port,$method,$request);
	}
	
	/**
	 * 表单提交的验证码和sms_verify表的验证码进行比较
	 * @param String $phoneNum
	 * @return true if match,false if not match
	 * 
	 * **/
	public function compValidate($telephone,$validate_code,$current)
	{
		$telephone = "86".$telephone;
		
		$query  = $this->db->query("select * from ". DB_PREFIX ."sms_verify where phoneNum='".$telephone."'");
		
		if(!$query->num_rows)
		{
			return false;
		}
		
		foreach($query->rows as $result)
		{
			if($current > strtotime($result['overdueTime']))
			{
				continue;
			}
			
			if($validate_code == $result['verify'])
			{
				if($result['state'] == 1)
				{	
					$this->db->query("update ". DB_PREFIX . "sms_verify set state=0 where phoneNum='". $telephone ."' and verify='". $validate_code ."'");
				}
				
				return true;
			}
		}
		
		return false;
	}
	
	
	/**
	 * 使用http协议发送消息
	 *
	 * @param string $host
	 * @param int $port
	 * @param string $method
	 * @param string $request
	 * @return string
	 */
	public static function httpSend($host,$port,$method,$request) {
		$httpHeader  = $method." ". $request. " HTTP/1.1\r\n";
		$httpHeader .= "Host: $host\r\n";
		$httpHeader .= "Connection: Close\r\n";
		//	$httpHeader .= "User-Agent: Mozilla/4.0(compatible;MSIE 7.0;Windows NT 5.1)\r\n";
		$httpHeader .= "Content-type: text/plain\r\n";
		$httpHeader .= "Content-length: " . strlen($request) . "\r\n";
		$httpHeader .= "\r\n";
		$httpHeader .= $request;
		$httpHeader .= "\r\n\r\n";
		$fp = @fsockopen($host, $port,$errno,$errstr,5);
		$result = "";
		if ( $fp ) {
			fwrite($fp, $httpHeader);
			while(! feof($fp)) { //读取get的结果
				$result .= fread($fp, 1024);
			}
			fclose($fp);
		}
		else
		{
			return false;//超时标志
		}
		list($header, $foo)  = explode("\r\n\r\n", $result);
		list($foo, $content) = explode($header, $result);
		$content=str_replace("\r\n","",$content);
		//返回调用结果
		return $content;
	}
	
	/**
	 *  decode Hex String
	 *
	 * @param string $dataCoding       charset
	 * @param string $hexStr      convert a hex string to binary string
	 * @return string binary string
	 */
	public static function decodeHexStr($dataCoding, $hexStr)
	{
		$hexLenght = strlen($hexStr);
		// only hex numbers is allowed
		if ($hexLenght % 2 != 0 || preg_match("/[^\da-fA-F]/",$hexStr)) return FALSE;
	
		unset($binString);
		for ($x = 1; $x <= $hexLenght/2; $x++)
		{
			$binString .= chr(hexdec(substr($hexStr,2 * $x - 2,2)));
		}
	
		return $binString;
	}

	/**
	 * encode Hex String
	 *
	 * @param string $dataCoding
	 * @param string $realStr
	 * @return string hex string
	 */
	public static function encodeHexStr($dataCoding, $realStr) {
		return bin2hex($realStr);
	}

}
?>