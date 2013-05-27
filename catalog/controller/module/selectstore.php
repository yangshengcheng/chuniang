<?php 
/*
 * yangshengcheng@gmail.com
 * */ 
class ControllerModuleSelectstore extends Controller {
	protected function index() {
		if (isset($this->request->post['selectstore'])) {
      		$this->store->set($this->request->post['selectstore']);
			
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			
			if (isset($this->request->post['redirect'])) {				
				$this->redirect($this->request->post['redirect']);
			} else {				
				$this->redirect($this->url->link('common/home'));
			}
   		}
		
		$this->language->load('module/selectstore');
		
    	$this->data['text_selectstore'] = $this->language->get('text_selectstore');
		
		$this->data['action'] = $this->url->link('module/selectstore');
		
		$this->data['store_id'] = $this->store->getCode(); 
		
		$this->load->model('localisation/selectstore');
		 
		 $this->data['stores'] = array();
		 
		$results = $this->model_localisation_selectstore->getstores();	
		
		foreach ($results as $result) {
			//if ($result['status']) {
   				$this->data['stores'][] = array(
					'store_id'        => $result['store_id'],
					'name'         => $result['name'],
					'url'  => $result['url'],
					'ssl' => $result['ssl']				
				);
			//}
		}
		//print_r($results);
		
		if (!isset($this->request->get['route'])) {
			$this->data['redirect'] = $this->url->link('common/home');
		} else {
			$data = $this->request->get;
			
			unset($data['_route_']);
			
			$route = $data['route'];
			
			unset($data['route']);
			
			$url = '';
			
			if ($data) {
				$url = '&' . urldecode(http_build_query($data, '', '&'));
			}	
					
			if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
				$connection = 'SSL';
			} else {
				$connection = 'NONSSL';
			}
						
			$this->data['redirect'] = $this->url->link($route, $url, $connection);
		}	

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/selectstore.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/selectstore.tpl';
		} else {
			$this->template = 'default/template/module/selectstore.tpl';
		}
		
		$this->render();
	}
}
?>