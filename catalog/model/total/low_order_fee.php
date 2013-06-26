<?php
class ModelTotalLowOrderFee extends Model {
	public function getTotal(&$total_data, &$total, &$taxes, $type=AllProduct) {		
		if (CommonProduct == $type)
		{
			$products = $this->cart->getCommonProducts();
		}
		else if (GroupProduct == $type)
		{
			$products = $this->cart->getGroupProducts();
		}
		else
		{
			$products = $this->cart->getProducts();
		}
			
		if ($this->cart->getSubTotalWithProducts($products) 
		&& ($this->cart->getSubTotalWithProducts($products) < $this->config->get('low_order_fee_total'))) 
		{
			$this->load->language('total/low_order_fee');		 	
			$total_data[] = array( 
				'code'       => 'low_order_fee',
        		'title'      => $this->language->get('text_low_order_fee'),
        		'text'       => $this->currency->format($this->config->get('low_order_fee_fee')),
        		'value'      => $this->config->get('low_order_fee_fee'),
				'sort_order' => $this->config->get('low_order_fee_sort_order')
			);
			
			if ($this->config->get('low_order_fee_tax_class_id')) {
				$tax_rates = $this->tax->getRates($this->config->get('low_order_fee_fee'), $this->config->get('low_order_fee_tax_class_id'));
				
				foreach ($tax_rates as $tax_rate) {
					if (!isset($taxes[$tax_rate['tax_rate_id']])) {
						$taxes[$tax_rate['tax_rate_id']] = $tax_rate['amount'];
					} else {
						$taxes[$tax_rate['tax_rate_id']] += $tax_rate['amount'];
					}
				}
			}
			
			$total += $this->config->get('low_order_fee_fee');
		}
	}
}
?>