<?php 
class ModelPaymentCOD extends Model {
	
// 	public function getMethod($address, $total) {
	public function getMethod() {
		$this->load->language('payment/cod');

//by lee: 货到付款 方式不需要任何前置条件
/*
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('cod_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
	
		if ($this->config->get('cod_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('cod_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}
*/		
		$status = true;		
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'code'       => 'cod',
        		'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('cod_sort_order')
      		);
    	}
   
    	return $method_data;
  	}
}
?>