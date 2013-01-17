<div class="wide form">

<?php $form = $this->beginWidget('GxActiveForm', array(
	'action' => Yii::app()->createUrl($this->route),
	'method' => 'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model, 'language_id'); ?>
		<?php echo $form->textField($model, 'language_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'language_code'); ?>
		<?php echo $form->textField($model, 'language_code', array('maxlength' => 45)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'is_active'); ?>
		<?php echo $form->textField($model, 'is_active'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'is_default'); ?>
		<?php echo $form->textField($model, 'is_default'); ?>
	</div>

	<div class="row buttons">
		<?php echo GxHtml::submitButton(Yii::t('app', 'Search')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->
