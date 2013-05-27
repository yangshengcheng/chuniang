<?php 
class ControllerAccountValidate extends Controller {  
		//private $mobile= '';
	
	public function index() {	

		$mobile= '';
		if($this->request->get['mobile'])
		{
			$mobile = '86'.$this->request->get['mobile'];
		}

		$this->load->model('account/validate');
		
		//prevent repeat submittal
		$repear = $this->model_account_validate->repeatCheck($mobile,5,60);
		if($repear != "")
		{
			echo $repear;
			return;			
		}

		
		$sendValidateCode = $this->model_account_validate->sendValidateCode($mobile);
		return ;	
		//return ;
//		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/validate.tpl')) {
//			$this->template = $this->config->get('config_template') . '/template/account/validate.tpl';
//		} else {
//			$this->template = 'default/template/account/validate.tpl';
//		}
//		
//		$this->children = array(
//			'common/column_left',
//			'common/column_right',
//			'common/content_top',
//			'common/content_bottom',
//			'common/footer',
//			'common/header'	
//		);
//						
//		$this->response->setOutput($this->render());				
  	}
}
?>