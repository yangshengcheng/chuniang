<?php
class ModelTotalSubTotal extends Model {
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
		
		$this->load->language('total/sub_total');
		
		$sub_total = $this->cart->getSubTotalWithProducts($products);		
		
		if (isset($this->session->data['vouchers']) && $this->session->data['vouchers']) {
			foreach ($this->session->data['vouchers'] as $voucher) {
				$sub_total += $voucher['amount'];
			}
		}
		
		$total_data[] = array( 
			'code'       => 'sub_total',
			'title'      => $this->language->get('text_sub_total'),
			'text'       => $this->currency->format($sub_total),
			'value'      => $sub_total,
			'sort_order' => $this->config->get('sub_total_sort_order')
		);
		
		$total += $sub_total;
	}
}
?>