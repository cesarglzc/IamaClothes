<?php
/* @var $this OrderController */
/* @var $data Order */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_customer')); ?>:</b>
	<?php echo CHtml::encode($data->id_customer); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('date')); ?>:</b>
	<?php echo CHtml::encode($data->date); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('deliveryStreet')); ?>:</b>
	<?php echo CHtml::encode($data->deliveryStreet); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('deliveryStreet2')); ?>:</b>
	<?php echo CHtml::encode($data->deliveryStreet2); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('deliveryZipcode')); ?>:</b>
	<?php echo CHtml::encode($data->deliveryZipcode); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('deliveryCity')); ?>:</b>
	<?php echo CHtml::encode($data->deliveryCity); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('deliveryState')); ?>:</b>
	<?php echo CHtml::encode($data->deliveryState); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('orderType')); ?>:</b>
	<?php echo CHtml::encode($data->orderType); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('payType')); ?>:</b>
	<?php echo CHtml::encode($data->payType); ?>
	<br />

	*/ ?>

</div>