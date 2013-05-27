<?php if (count($stores) > 1) { ?>
<form name="store" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  <div id="selectstore">
  <select name="selectstore" onchange="document.store.submit();">
    <?php foreach ($stores as $store) { ?>
    <?php if ($store['store_id'] == $store_id) { ?>
    	<option value="<?php echo $store['store_id'];?>" selected><?php echo  $store['name'];?></option>
    <?php } else {?>    
    	<option value="<?php echo $store['store_id'];?>"><?php echo  $store['name'];?></option>
    <?php }?>
	<?php }?>
	</select>	
    <input type="hidden" name="store_id" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </div>
</form>
<?php } ?>



