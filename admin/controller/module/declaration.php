<?php
class ControllerModuleDeclaration extends Controller {
	private $error = array();
	private $store_id;
	
  	public function index() { 

  		$store_id = $this->user->getStoreId();

		$this->load->language('module/declaration');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		//echo ".... heading_title is ".$this->language->get('heading_title').",,,";
				
		$this->getList();
	}
	
	private function getList() {
		
		if (isset($this->request->get['filter_store'])) {
			$filter_store = $this->request->get['filter_store'];
		} else {
			$filter_store = null;
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
						
		$url = '';
		
		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$postData = $this->request->post;
			$ss_store = 0;
			
			if (!isset($postData['store_id']))
			{
				//超级管理员编辑所有分店的该项设置
				$this->model_setting_setting->editStores('declaration', 'declaration_module', $this->request->post['declaration_module']);
			}
			else 
			{
				//分店管理员编辑他所负责分店的该项设置，负责哪个分店由user表的store_id决定
				$this->model_setting_setting->editOneStore('declaration', 'declaration_module', $this->request->post['declaration_module'], $postData['store_id']);
			}
			
			if ($postData['declaration_module'])
			{
				//echo "ddd...".$data1['declaration_module'][0]['store_id'];
				//$ss_store = $data1['declaration_module'];
			} 
			
			
			
			//for ($i=0; $i<sizeof($postData['declaration_module']); $i++)
			//{
			//	echo "post: " . $i . " ";
			//	for ($j=0; $j<sizeof($postData['declaration_module'][$i]); $j++)
			//	{
			//		echo " " . $postData['declaration_module'][$i][$j];
			//	}				
			//}
			//echo " before setting... ";
			//$this->model_setting_setting->editStores('declaration', 'declaration_module', $this->request->post['declaration_module']);		
					 
			//$this->session->data['success'] = $this->language->get('text_success');
						
			//$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'] . '&&store_id=' . $ss_store, 'SSL'));
		}
		
		
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_admin'] = $this->language->get('entry_admin');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_store'] = $this->language->get('entry_store');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_filter'] = $this->language->get('button_filter');
		
		$this->data['token'] = $this->session->data['token'];
		
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
			'href'      => $this->url->link('module/declaration', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/declaration', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['declaration_admin'])) {
			$this->data['declaration_admin'] = $this->request->post['declaration_admin'];
		} else {
			$this->data['declaration_admin'] = $this->config->get('declaration_admin');
		}	
			
		$this->data['modules'] = array();
		//echo "filter_store is ".$filter_store;
		
		//是否是超级用户
		if (G_ROOTUSER == $this->user->getId())
		{
			$this->data['root'] = 1;//若是超级管理员则置标志位	
			$this->data['store_id'] = $this->user->getStoreId();		
		}
		else 
		{
			$this->data['store_id'] = $this->user->getStoreId();
		}
		//echo "XXXXXXXXX is " . $this->data['store_id'];
		
		if (isset($this->request->post['declaration_module'])) {
			$this->data['modules'] = $this->request->post['declaration_module'];
		} elseif ($filter_store != NULL && $this->config->get('declaration_module')) { 
			$this->data['modules'] = $this->config->get('declaration_module', $filter_store);
		} elseif (G_ROOTUSER != $this->user->getId()){
			//分店管理员
			if ($this->config->has('declaration_module', $this->user->getStoreId()))
			{
				//从缓存中取
				$this->data['modules'] = $this->config->get('declaration_module', $this->user->getStoreId());
			}
			else
			{
				//从数据库取
				$this->data['modules'] = $this->config->get('declaration', 'declaration_module', $this->user->getStoreId());
			}			
		} else {
			//超级管理员			
			$this->data['modules'] = $this->model_setting_setting->getValsofStores('declaration', 'declaration_module');			
		}
		
		//echo "module size is".sizeof($this->data['modules']);		
		
		
		$this->load->model('design/layout');		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();		
		
		$this->load->model('setting/store');
		$stores = $this->model_setting_store->getStores(); 
    	foreach ($stores as $store) {
    		$this->data['stores'][] = array(
				'store_id' => $store['store_id'],
				'name'     => $store['name']
			);
		}
		
				
		$this->template = 'module/declaration.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
			
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/declaration')) {
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