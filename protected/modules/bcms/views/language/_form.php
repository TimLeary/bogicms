<div class="form">


<?php $form = $this->beginWidget('GxActiveForm', array(
	'id' => 'language-form',
	'enableAjaxValidation' => false,
));
?>

	<p class="note">
		<?php echo Yii::t('app', 'Fields with'); ?> <span class="required">*</span> <?php echo Yii::t('app', 'are required'); ?>.
	</p>

	<?php echo $form->errorSummary($model); ?>

		<div class="row">
		<?php echo $form->labelEx($model,'language_code'); ?>
		<?php echo $form->textField($model, 'language_code', array('maxlength' => 45)); ?>
		<?php echo $form->error($model,'language_code'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'is_active'); ?>
		<?php echo $form->textField($model, 'is_active'); ?>
		<?php echo $form->error($model,'is_active'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'is_default'); ?>
		<?php echo $form->textField($model, 'is_default'); ?>
		<?php echo $form->error($model,'is_default'); ?>
		</div><!-- row -->

		<label><?php echo GxHtml::encode($model->getRelationLabel('pages')); ?></label>
		<?php echo $form->checkBoxList($model, 'pages', GxHtml::encodeEx(GxHtml::listDataEx(Page::model()->findAllAttributes(null, true)), false, true)); ?>

<?php
echo GxHtml::submitButton(Yii::t('app', 'Save'));
$this->endWidget();
?>
</div><!-- form -->