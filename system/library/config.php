<?php
class Config {
	private $data = array();

  	public function getAllData(&$data)
  	{
  		$data = $this->data;	
  	}
  	
	public function get($key, $storeId=0) {
    	return (isset($this->data[$storeId][$key]) ? $this->data[$storeId][$key] : null);
  	}	
  	
  	public function getSuper($key)
  	{
  		$vals = array();
  		foreach ($data as $index => $val)
  		{
  			if (isset($this->data[$index][$key]))
  			{
  				
  			}
  		}
  		
  	}
	
	public function set($key, $value, $storeId=0) {
    	$this->data[$storeId][$key] = $value;
  	}

	public function has($key, $storeId=0) {
    	return isset($this->data[$storeId][$key]);
  	}
  	
  	public function getStoreData($storeId, &$data)
  	{
  		$data = $this->data[$storeId];
  		//var_dump($this->data[$storeId]);  	
  		//var_dump($data);	
  	}

  	public function load($filename, $storeId=0) {
		$file = DIR_CONFIG . $filename . '.php';
		
    	if (file_exists($file)) { 
	  		$_ = array();
	  
	  		require($file);
	  
	  		$this->data[$storeId] = array_merge($this->data[$storeId], $_);
		} else {
			trigger_error('Error: Could not load config ' . $filename . '!');
			exit();
		}
  	}
}
?>