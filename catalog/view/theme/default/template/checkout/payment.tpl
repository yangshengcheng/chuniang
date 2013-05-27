<!-- ÅäËÍÐÅÏ¢ -->
<div id="checkout-uinfo">
	<div class="checkout-header">
		<div class="update"><input type="button" value="<?php echo $text_confirm_address; ?>" id="button-payment-user" class="button" /></div>
		<div class="heading"><?php echo $text_payment_info; ?></div>
	</div>
	<div id="checkout-address">
		<?php foreach ($addresses as $address) { ?>
		<div>
		<?php if ($address['address_id'] == $address_id) { ?>	
		  <input type="radio" name="address_id" value = "<?php echo $address['address_id']; ?>" checked="checked">
		  <span><?php echo $address['zone']; ?></span><span>&nbsp</span>
			<span><?php echo $address['address_1']; ?></span><span>&nbsp</span>
			<span><?php echo $address['firstname']; ?></span><span>&nbsp</span>
			<span><?php echo $address['telephone']; ?></span><span>&nbsp</span>		
			<span>Default</span>
			<a><?php echo $text_mod_address; ?></a>	
		<?php } else {?>
			<input type="radio" name="address_id" value = "<?php echo $address['address_id']; ?>" >			
			<span><?php echo $address['zone']; ?></span><span>&nbsp</span>
			<span><?php echo $address['address_1']; ?></span><span>&nbsp</span>
			<span><?php echo $address['firstname']; ?></span><span>&nbsp</span>
			<span><?php echo $address['telephone']; ?></span><span>&nbsp</span>
			<span><a><?php echo $text_mod_address; ?></a></span>		
		<?php } ?>
		</div>
		<?php } ?>
		
		
	</div>
	
	<div id="modify-address">
		
	</div>
</div>

<div id="checkout-modaddr">
	
</div>

<label for="payment-address-existing"><?php echo $text_address_existing; ?></label>
<div id="payment-existing">
  <select name="address_id" style="width: 100%; margin-bottom: 15px;" size="5">
    <?php foreach ($addresses as $address) { ?>
    <?php if ($address['address_id'] == $address_id) { ?>
    <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
    <?php } else { ?>
    <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
    <?php } ?>
    <?php } ?>
  </select>
</div>



