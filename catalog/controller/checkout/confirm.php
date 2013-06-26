<?php 
class ControllerCheckoutConfirm extends Controller { 
	public function index() {
		

		if (!isset($this->session->data['payment_method']['code']))
		{
			$this->session->data['payment_method']['code'] = 'cod';			
		}
		$this->data['payment'] = $this->getChild('payment/' . $this->session->data['payment_method']['code']);
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/confirm.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/confirm.tpl';
		} else {
			$this->template = 'default/template/checkout/confirm.tpl';
		}
		
		$this->response->setOutput($this->render());	
  	}
  	
  public function confirm()
  {
  	
  }
}
?>