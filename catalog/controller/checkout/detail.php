<?php 
class ControllerCheckoutDetail extends Controller { 
	public function index() {
		$redirect = '';		
				
		// Validate cart has products
		if (!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) {
			$redirect = $this->url->link('checkout/cart');				
		}	
		
		// Validate minimum quantity requirments.			
		//$products = $this->cart->getProducts();	
		
		//普通商品
		$products = $this->cart->getCommonProducts();
		//$products = array();
		
		// 团购商品
		$groupProducts = $this->cart->getGroupProducts();
		//$this->log->write('product size: ' . sizeof($products));
		//$this->log->write('groupProducts size: ' . sizeof($groupProducts));
				
		foreach ($products as $product) {
			$product_total = 0;
				
			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}		
			
			if ($product['minimum'] > $product_total) {
				$redirect = $this->url->link('checkout/cart');				
				break;
			}				
		}
			
		if (!$redirect) {
			$total_data = array();
			$total = 0;
			$taxes = $this->cart->getTaxes();
			
			$grou_total_data =  array();
			$grou_total = 0;
			 
			$this->load->model('setting/extension');
			
			$sort_order = array(); 
			
			$results = $this->model_setting_extension->getExtensions('total');
			
			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}
			
			array_multisort($sort_order, SORT_ASC, $results);
			
			foreach ($results as $result) {
				$this->log->write('resultcode: ' . $result['code']);
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);
		
					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes, CommonProduct);
					$this->{'model_total_' . $result['code']}->getTotal($grou_total_data, $grou_total, $taxes, GroupProduct);
				}
			}
			
			$sort_order = array(); 
			$group_sort_order = array(); 
		  
			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
			foreach ($grou_total_data as $key => $value) {
				$group_sort_order[$key] = $value['sort_order'];
			}
	
			array_multisort($sort_order, SORT_ASC, $total_data);
			array_multisort($group_sort_order, SORT_ASC, $grou_total_data);
	
			$this->language->load('checkout/checkout');
			
			$data = array();
			
			$product_data = array();
			$tuanProduct_data = array();
			
			
			//foreach ($this->cart->getProducts() as $product) {
			foreach ($products as $product) {
				$option_data = array();
	
				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];	
					} else {
						$value = $this->encryption->decrypt($option['option_value']);
					}	
					
					$option_data[] = array(
						'product_option_id'       => $option['product_option_id'],
						'product_option_value_id' => $option['product_option_value_id'],
						'option_id'               => $option['option_id'],
						'option_value_id'         => $option['option_value_id'],								   
						'name'                    => $option['name'],
						'value'                   => $value,
						'type'                    => $option['type']
					);					
				}
	 
				$product_data[] = array(
					'product_id' => $product['product_id'],
					'name'       => $product['name'],
					'model'      => $product['model'],
					'option'     => $option_data,
					'download'   => $product['download'],
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'price'      => $product['price'],
					'total'      => $product['total'],
					'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
					'reward'     => $product['reward']
				); 
			}
			
			foreach ($groupProducts as $product) {
				$option_data = array();
	
				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];	
					} else {
						$value = $this->encryption->decrypt($option['option_value']);
					}	
					
					$option_data[] = array(
						'product_option_id'       => $option['product_option_id'],
						'product_option_value_id' => $option['product_option_value_id'],
						'option_id'               => $option['option_id'],
						'option_value_id'         => $option['option_value_id'],								   
						'name'                    => $option['name'],
						'value'                   => $value,
						'type'                    => $option['type']
					);					
				}
	 
				$tuanProduct_data[] = array(
					'product_id' => $product['product_id'],
					'name'       => $product['name'],
					'model'      => $product['model'],
					'option'     => $option_data,
					'download'   => $product['download'],
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'price'      => $product['price'],
					'total'      => $product['total'],
					'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
					'reward'     => $product['reward']
				); 
			}
			
			// Gift Voucher
			$voucher_data = array();
			
			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $voucher) {
					$voucher_data[] = array(
						'description'      => $voucher['description'],
						'code'             => substr(md5(mt_rand()), 0, 10),
						'to_name'          => $voucher['to_name'],
						'to_email'         => $voucher['to_email'],
						'from_name'        => $voucher['from_name'],
						'from_email'       => $voucher['from_email'],
						'voucher_theme_id' => $voucher['voucher_theme_id'],
						'message'          => $voucher['message'],						
						'amount'           => $voucher['amount']
					);
				}
			}  
						
			$this->data['products'] = $product_data;
			$this->data['vouchers'] = $voucher_data;
			$this->data['totals'] = $total_data;
			$this->data['total'] = $total;
			
			$this->data['tuanProducts'] = $tuanProduct_data;
			$this->data['groupTotals'] = $grou_total_data;
			
			if (isset($this->request->cookie['tracking'])) {
				$this->load->model('affiliate/affiliate');
				
				$affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);
				
				if ($affiliate_info) {
					$data['affiliate_id'] = $affiliate_info['affiliate_id']; 
					$data['commission'] = ($total / 100) * $affiliate_info['commission']; 
				} else {
					$data['affiliate_id'] = 0;
					$data['commission'] = 0;
				}
			} else {
				$data['affiliate_id'] = 0;
				$data['commission'] = 0;
			}
			
			$this->data['column_commodity'] = $this->language->get('column_commodity');					
			$this->data['column_common_commodity'] = $this->language->get('column_common_commodity');
			$this->data['column_tuan_commodity'] = $this->language->get('column_tuan_commodity');
			$this->data['column_name'] = $this->language->get('column_name');
			$this->data['column_model'] = $this->language->get('column_model');
			$this->data['column_quantity'] = $this->language->get('column_quantity');
			$this->data['column_price'] = $this->language->get('column_price');
			$this->data['column_total'] = $this->language->get('column_total');			

		} else {
			$this->data['redirect'] = $redirect;
		}			
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/detail.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/detail.tpl';
		} else {
			$this->template = 'default/template/checkout/detail.tpl';
		}
		
		$this->response->setOutput($this->render());	
  	}
  	
  public function confirm()
  {
  	
  }
}
?>