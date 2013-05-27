<?php   
class ControllerModuleDeclaration extends Controller {
	protected function index() {
		//echo "ControllerModuleDeclaration";
		$this->language->load('module/declaration');
		//echo "ControllerModuleDeclaration";
		$this->data['heading_title'] = $this->language->get('heading_title');
		//echo "ControllerModuleDeclaration";
    	$this->data['store_id'] = $this->config->get('config_store_id');
    	//echo "ControllerModuleDeclaration";
    	$this->load->model('catalog/information');		
    	//echo "ControllerModuleDeclaration";	
    	$information_id = 4;
		//$results = $this->model_catalog_information->getInformationDescriptions(4);
		
		$information_info = $this->model_catalog_information->getInformation($information_id);
		if ($information_info) {
			$this->data['message'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
		}
			
		//echo "ControllerModuleDeclaration";
		//foreach ($results as $result) {
		//	$this->data['message'] = $result['description'];		
		//}
		
    	//$this->data['message'] = "for test.....";
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/declaration.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/declaration.tpl';
		} else {
			$this->template = 'default/template/module/declaration.tpl';
		}
		
		$this->render();
		
		
	}
}
?>