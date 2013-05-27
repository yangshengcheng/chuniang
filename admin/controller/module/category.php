<?php
class ControllerModuleCategory extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			/* ian.kevin.lee@gmail.com */
			if (!isset($this->request->post['store_id']))
			{
				//超级管理员编辑所有分店的该项设置
				$this->model_setting_setting->editStores('category', 'category_module', $this->request->post['category_module']);
			}
			else 
			{
				//分店管理员编辑他所负责分店的该项设置，负责哪个分店由user表的store_id决定
				$this->model_setting_setting->editOneStore('category', 'category_module', $this->request->post['category_module'], $this->request->post['store_id']);
			}			
			//$this->model_setting_setting->editSetting('category', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_count'] = $this->language->get('entry_count');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_store'] = $this->language->get('entry_store');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/category', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/category', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['modules'] = array();
		
		/* ian.kevin.lee@gmail.com */
		if (G_ROOTUSER == $this->user->getId())
		{
			$this->data['root'] = 1;//若是超级管理员则置标志位	
			$this->data['store_id'] = $this->user->getStoreId();		
		}
		else 
		{
			$this->data['store_id'] = $this->user->getStoreId();
		}
		
		/* ian.kevin.lee@gmail.com */
		if (isset($this->request->post['category_module'])) {
			$this->data['modules'] = $this->request->post['category_module'];
		} elseif ($filter_store != NULL && $this->config->get('category_module')) { 
			$this->data['modules'] = $this->config->get('category_module', $filter_store);
		} elseif (G_ROOTUSER != $this->user->getId()){
			//普通管理员
			if ($this->config->has('category_module', $this->user->getStoreId()))
			{
				//从缓存中取
				$this->data['modules'] = $this->config->get('category_module', $this->user->getStoreId());
			}
			else
			{
				//从数据库取
				$this->data['modules'] = $this->config->get('category', 'category_module', $this->user->getStoreId());
			}			
		} else {
			//超级管理员			
			$this->data['modules'] = $this->model_setting_setting->getValsofStores('category', 'category_module');			
		}	
				
		$this->load->model('design/layout');		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		/* ian.kevin.lee@gmail.com */
		$this->load->model('setting/store');
		$stores = $this->model_setting_store->getStores(); 
    	foreach ($stores as $store) {
    		$this->data['stores'][] = array(
				'store_id' => $store['store_id'],
				'name'     => $store['name']
			);
		}

		$this->template = 'module/category.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>