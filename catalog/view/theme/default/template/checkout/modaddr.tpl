<!-- ÐÂµØÖ· -->
<div id="modaddr" >
  <table class="form">
    <tr>
      <td><span class="required">*</span> <?php echo $entry_customer_name; ?></td>
      <td><input type="text" name="firstname" value="<?php echo $address['firstname']; ?>" class="large-field" /></td>
      <td></td>
    </tr>
    <tr>
      <td><span class="required">*</span> <?php echo $entry_address; ?></td>
      <td><input type="text" name="address_1" value="<?php echo $address['address_1']; ?>" class="large-field" /></td>
      <td></td>
    </tr>
    <tr>
      <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
      <td><input type="text" name="telephone" value="<?php echo $address['telephone']; ?>" class="large-field" /></td>
      <td align="right">
      <input type="button" name="save" value="<?php echo $text_save_address; ?>" class="button" id="modaddr-save"/>
      </td>
    </tr>
  </table>
</div>  
