<?php
/* @var $this OrderController */
/* @var $model Order */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'order-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'id_customer'); ?>
		<?php echo $form->textField($model,'id_customer',array('size'=>11,'maxlength'=>11)); ?>
		<?php echo $form->error($model,'id_customer'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'date'); ?>
		<?php echo $form->textField($model,'date'); ?>
		<?php echo $form->error($model,'date'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'deliveryStreet'); ?>
		<?php echo $form->textField($model,'deliveryStreet',array('size'=>60,'maxlength'=>64)); ?>
		<?php echo $form->error($model,'deliveryStreet'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'deliveryStreet2'); ?>
		<?php echo $form->textField($model,'deliveryStreet2',array('size'=>60,'maxlength'=>64)); ?>
		<?php echo $form->error($model,'deliveryStreet2'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'deliveryZipcode'); ?>
		<?php echo $form->textField($model,'deliveryZipcode',array('size'=>60,'maxlength'=>64)); ?>
		<?php echo $form->error($model,'deliveryZipcode'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'deliveryCity'); ?>
		<?php echo $form->textField($model,'deliveryCity',array('size'=>60,'maxlength'=>64)); ?>
		<?php echo $form->error($model,'deliveryCity'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'deliveryState'); ?>
		<?php echo $form->textField($model,'deliveryState',array('size'=>60,'maxlength'=>64)); ?>
		<?php echo $form->error($model,'deliveryState'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'orderType'); ?>
		<?php echo $form->textField($model,'orderType',array('size'=>60,'maxlength'=>64)); ?>
		<?php echo $form->error($model,'orderType'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'payType'); ?>
		<?php echo $form->textField($model,'payType',array('size'=>60,'maxlength'=>64)); ?>
		<?php echo $form->error($model,'payType'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->