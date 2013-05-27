<?php
class ModelLocalisationSelectstore extends Model {
	public function getStoreByCode($id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "store WHERE id = '" . $this->db->escape(id) . "'");
	
		return $query->row;
	}
	
	public function getstores() {
		$stores_data = $this->cache->get('store');

		if (!$stores_data) {
			$stores_data = array();
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "store ORDER BY store_id ASC");
	
			foreach ($query->rows as $result) {
      			$stores_data[$result['store_id']] = array(
      				'store_id' =>$result['store_id'],
        			'name'   => $result['name'],
        			'url'         => $result['url'],
        			'ssl'          => $result['ssl']
      			);
    		}	
			
			$this->cache->set('store', $stores_data);
		}
			
		return $stores_data;	
	}	
}
?>