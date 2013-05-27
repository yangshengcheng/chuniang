<?php
/*
 * yangshengcheng@gmail.com
 * 
 * */
class Store {
  	private $store_id;
  	private $stores = array();
  
  	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->db = $registry->get('db');
		$this->language = $registry->get('language');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "store");

    	foreach ($query->rows as $result) {
      		$this->stores[$result['store_id']] = array(
        		'store_id'   => $result['store_id'],
        		'name'         => $result['name'],
        		'url'   => $result['url'],
        		'ssl'  => $result['ssl']
      		); 
    	}
		
		if (isset($this->request->get['store_id']) && (array_key_exists($this->request->get['store_id'], $this->stores))) {
			$this->set($this->request->get['store_id']);
    	} elseif ((isset($this->session->data['store_id'])) && (array_key_exists($this->session->data['store_id'], $this->stores))) {
      		$this->set($this->session->data['store_id']);
    	} elseif ((isset($this->request->cookie['store_id'])) && (array_key_exists($this->request->cookie['store_id'], $this->stores))) {
      		$this->set($this->request->cookie['store_id']);
    	} else {
      		$this->set('0');
    	}
  	}
	
  	public function set($store_id) {
    	$this->store_id = $store_id;

    	if (!isset($this->session->data['store_id']) || ($this->session->data['store_id'] != $store_id)) {
      		$this->session->data['store_id'] = $store_id;
    	}

    	if (!isset($this->request->cookie['store_id']) || ($this->request->cookie['store_id'] != $store_id)) {
	  		setcookie('store_id', $store_id, time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
    	}
  	}
	
  	public function getId($store_id = '') {
		if (!$store_id) {
			return $this->stores[$this->store_id]['store_id'];
		} elseif ($stores && isset($this->stores[$store_id])) {
			return $this->stores[$store_id]['store_id'];
		} else {
			return 0;
		}
  	}
	
  	public function getCode() {
    	return $this->store_id;
  	}
  
  	public function getValue($store_id = '') {
		if (!$store_id) {
			return $this->store_id[$this->store_id]['name'];
		} elseif ($store_id && isset($this->stores[$store_id])) {
			return $this->stores[$store_id]['name'];
		} else {
			return 0;
		}
  	}
    
  	public function has($store_id) {
    	return isset($this->stores[$store_id]);
  	}
}
?>