<?php 
class ModelSettingSetting extends Model {
	public function getSetting($group, $store_id = 0) {
		$data = array(); 
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
		
		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$data[$result['key']] = $result['value'];
			} else {
				$data[$result['key']] = unserialize($result['value']);
			}
		}
		return $data;
	}
	
	public function editSetting($group, $data, $store_id = 0) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
		
		foreach ($data as $key => $value) {
			if (!is_array($value)) {
				//$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `group` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
			} else {
				echo " on setting...else ...";
				foreach ($value as $tkey => $tval)
				{
					echo "__".$tkey;
				}
				//if (isset($value['store_id']))
				//{
				//	echo " on setting...store_id ...";
				//	$this->db->query("INSERT INTO " . DB_PREFIX . "logtest SET store_id = '" . (int)$store_id . "', `key` = 'store', `value` = '" . $value['store_id'] . "'");
				//}
				//$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `group` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(serialize($value)) . "', serialized = '1'");
			}
		}
	}
	
	public function editSettingTest($group, $data)
	{
		echo " on editSettingTest...";
		foreach ($data as $key => $storeArray)
		{
			if (is_array($storeArray))
			{
				foreach ($storeArray as $index => $vals)
				{
					if (is_array($vals))
					{
						foreach ($vals as $name => $val)
						{
							//echo "__".$name;
						}
						echo "ssss..".$vals['store_id'];
						//echo "ssss..".$vals['position'];
					}
				}
			}
		}
		
	}
	
	public function editSettingTest2($group, $storeArray)
	{
		echo " on editSettingTest2...";
		if (is_array($storeArray))
		{
			foreach ($storeArray as $index => $vals)
			{
				if (is_array($vals))
				{
					foreach ($vals as $name => $val)
					{
						//echo "__".$name;
					}
					echo "ssssdsss..".$vals['store_id'];
					//echo "ssss..".$vals['position'];
				}
			}
		}		
	}
	
	public function editOneStore($group, $key, $rows, $store_id)
	{
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `key` = '" . $this->db->escape($key) . "' AND `group` = '" . $this->db->escape($group) . "' AND `store_id` = '". (int)$store_id ."'");
		
		$data = array();
		foreach ($rows as $index => $vals)
		{
			if (isset($vals['store_id']) && isset($data[$vals['store_id']]))
			{
				array_push($data[$vals['store_id']], $vals);
			}
			elseif (isset($vals['store_id']))
			{
				//$data[$vals['store_id']][0] = $vals;
				//array_push($data[$vals['store_id']], $vals);
				$data[$vals['store_id']][0] = $vals;
			}			
		}

		foreach ($data as $store_id => $value)
		{
			echo "my storeid is ". $store_id;
			//echo "vals is ". $vals;
			$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `store_id` = '" . (int)$store_id . "', `group` = '". $this->db->escape($group) ."', `key` = '". $this->db->escape($key) ."', `value` = '" . $this->db->escape(serialize($value)) . "', serialized = '1'");
		}
	}
	
	public function editStores($group, $key, $rows)
	{
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `key` = '" . $this->db->escape($key) . "' AND `group` = '" . $this->db->escape($group) . "'");
		
		$data = array();
		foreach ($rows as $index => $vals)
		{
			if (isset($vals['store_id']) && isset($data[$vals['store_id']]))
			{
				array_push($data[$vals['store_id']], $vals);
			}
			elseif (isset($vals['store_id']))
			{
				//$data[$vals['store_id']][0] = $vals;
				//array_push($data[$vals['store_id']], $vals);
				$data[$vals['store_id']][0] = $vals;
			}
			
			//if (in_array($stores[$index], $data))
			//{
			//	array_push($data[$stores[$index]], $vals);
			//}
			//else
			//{
			//	$data[$stores[$index]][0] = $vals;
			//}
		}
		
		foreach ($data as $store_id => $value)
		{
			echo "my storeid is ". $store_id;
			//echo "vals is ". $vals;
			$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `store_id` = '" . (int)$store_id . "', `group` = '". $this->db->escape($group) ."', `key` = '". $this->db->escape($key) ."', `value` = '" . $this->db->escape(serialize($value)) . "', serialized = '1'");
		}
				
	}
	
	public function deleteSetting($group, $store_id = 0) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
	}
	
	public function getValsofStores($group, $key)
	{
		$data = array(); 
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `key` = '" . $this->db->escape($key) . "' AND `group` = '" . $this->db->escape($group) . "'");
		
		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				array_push($data, $result['value']);
			} else {
				$temp = unserialize($result['value']);
				foreach ($temp as $index => $vals)
				{
					array_push($data, $vals);
				}
			}
		}
		return $data;
	}
	
	public function getValsofOneStore($group, $key, $store_id)
	{
		$data = array(); 
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `key` = '" . $this->db->escape($key) . "' AND `group` = '" . $this->db->escape($group) . "'  AND `store_id` ='" . (int)$store_id . "'");
		
		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				array_push($data, $result['value']);
			} else {
				$temp = unserialize($result['value']);
				foreach ($temp as $index => $vals)
				{
					array_push($data, $vals);
				}
			}
		}
		return $data;
		
	}
}
?>