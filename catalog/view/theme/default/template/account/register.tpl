<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <p><?php echo $text_account_already; ?></p>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h2><?php echo $text_your_details; ?></h2>
    <div class="content">
      <table class="form">      
        <tr>
          <td><span class="required">*</span> <?php echo $entry_nickname; ?></td>
          <td><input type="text" name="nickname" value="<?php echo $nickname; ?>" />
            <?php if ($error_nickname) { ?>
            <span class="error"><?php echo $error_nickname; ?></span>
            <?php } ?></td>
        </tr>
        
        <tr>
          <td><span class="required">*</span> <?php echo $entry_password; ?></td>
          <td><input type="password" name="password" value="<?php echo $password; ?>" />
            <?php if ($error_password) { ?>
            <span class="error"><?php echo $error_password; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_confirm; ?></td>
          <td><input type="password" name="confirm" value="<?php echo $confirm; ?>" />
            <?php if ($error_confirm) { ?>
            <span class="error"><?php echo $error_confirm; ?></span>
            <?php } ?></td>
        </tr>  
        
       <tr>
          <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
          <td><input type="text" id="telephone" name="telephone" value="<?php echo $telephone; ?>" /> <a href="javascript:void(0);" onclick="get_validate(document.getElementById('telephone').value)" title="get_validate_sms"><?php echo $text_get_validate; ?></a>
            <?php if ($error_telephone) { ?>
            <span class="error"><?php echo $error_telephone; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span><?php echo $entry_validate_code; ?></td>
          <td><input type="text" name="validate_code" value="<?php echo $validate_code; ?>" />
			<?php if ($error_validate_code) { ?>
            <span class="error"><?php echo $error_validate_code; ?></span>
            <?php } ?>
          </td>
        </tr>
      </table>
    </div>
   
    <h2><?php echo $text_entry_recommend; ?></h2>
    <div class="content">
      <table class="form">
        <tr>
          <td> <?php echo $entry_recommend; ?></td>
          <td><input type="text" name="recommend" value="<?php echo $recommend; ?>" />
            <?php if ($error_recommend) { ?>
            <span class="error"><?php echo $error_recommend; ?></span>
            <?php } ?></td>
        </tr>
      </table>
    </div>  

    <?php if ($text_agree) { ?>
    <div class="buttons">
      <div class="right"><?php echo $text_agree; ?>
        <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
        <?php } ?>
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
    </div>
    <?php } else { ?>
    <div class="buttons">
      <div class="right">
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
    </div>
    <?php } ?>
  </form>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('select[name=\'customer_group_id\']').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('select[name=\'customer_group_id\']').trigger('change');
//--></script>   
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: 640,
	height: 480
});
//--></script> 

<script type="text/javascript">
<!--
function get_validate(mobile)
{
	//验证手机号码合法性
	if (mobile=="")
	{
		alert("请填写手机号码！");
		return false;
	}
	if(mobile.length!=11)
	{
		alert("手机号码为11位数字！请正确填写！");
		return false;
     }
        
	var reg =/^(13[0-9]|147|15[0|1|2|3|4|5|6|7|8|9]|18[0|5|6|7|8|9])\d{8}$/;
	if(!reg.test(mobile))
	{
		alert("您的手机号码不正确，请重新输入");           
		return false;
	}

	//ajax 异步调用短信接口
	var xmlhttp;
	var repeat = "";
	if (window.XMLHttpRequest)
  	{// code for IE7+, Firefox, Chrome, Opera, Safari
  		xmlhttp=new XMLHttpRequest();
 	}
	else
  	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			repeat=xmlhttp.responseText;
			if(repeat != "")
			{
				if(repeat == "maxrepeat")
				{
					alert("每手机当日限制验证5次");
					return ;
				}

				if(repeat == "minrepeat")
				{
					alert("验证码已发送，若未收到请50秒后再尝试");
					return ;
				}

				return ;
			}
		}
	}

	xmlhttp.open("GET","index.php?route=account/validate&mobile=" + mobile,true);
	xmlhttp.send();
}
//-->
</script>


<?php echo $footer; ?>