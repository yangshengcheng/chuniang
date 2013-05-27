<?php
class ControllerModuleFeatured extends Controller {
	protected function index($setting) {
		$this->language->load('module/featured'); 

      	//$this->data['heading_title'] = $this->language->get('heading_title');
      	//yangshengcheng@gmail.com
      	$this->data['heading_title'] = $setting['title'];
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');

		$this->data['products'] = array();

		$products = explode(',', $this->config->get('featured_product'));

		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		//yangshengcheng@gmail.com filter category product
		$filter = array();
		$category_id;
		if(isset($this->request->get['route']))
		{
			if($this->request->get['route'] == 'product/category')
			{
				if(isset($this->request->get['path']))
				{
					$category_id = $this->request->get['path'];
				}
			}
		}
		
		if(!isset($category_id))
		{
			if(!empty($setting['category']))
			{
				$category_id = $setting['category'];
			}
		}
		
		if(isset($category_id))
		{
			if(preg_match("/^.*_(\\d+)$/i", $category_id,$matches))
			{
				$category_id = $matches[1];
			}
		}
		
		if(isset($category_id) && is_numeric($category_id))
		{
			$product_category = $this->db->query("select * from " . DB_PREFIX . "product_to_category pc where pc.category_id=" . $category_id);
			if ($product_category->num_rows) 
			{
				foreach($product_category->rows as $item)
				{
					foreach($products as $product_id)
					{
						if($product_id == $item['product_id'])
						{
							$filter[] = $product_id;
							break;
						}
					}

				}			
			}
			
			$products = $filter;
		}
		
		//end of yangshengcheng@gmail.com
		
		
		$products = array_slice($products, 0, (int)$setting['limit']);
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
					
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
				);
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/featured.tpl';
		} else {
			$this->template = 'default/template/module/featured.tpl';
		}

		$this->render();
	}
}
?>