<div class="wide form">

<?php $form = $this->beginWidget('GxActiveForm', array(
	'action' => Yii::app()->createUrl($this->route),
	'method' => 'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model, 'page_id'); ?>
		<?php echo $form->textField($model, 'page_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'page_name'); ?>
		<?php echo $form->textField($model, 'page_name', array('maxlength' => 255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'language_id'); ?>
		<?php echo $form->dropDownList($model, 'language_id', GxHtml::listDataEx(ActiveLanguage::model()->findAllAttributes(null, true)), array('prompt' => Yii::t('app', 'All'))); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'permalink'); ?>
		<?php echo $form->textField($model, 'permalink', array('maxlength' => 255)); ?>
	</div>

	<div class="row">
		<?php //echo $form->label($model, 'menu_id'); ?>
		<?php //echo $form->dropDownList($model, 'menu_id', GxHtml::listDataEx(Cathegories::model()->findAllAttributes(null, true)), array('prompt' => Yii::t('app', 'All'))); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'url'); ?>
		<?php echo $form->textField($model, 'url', array('maxlength' => 255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'is_active'); ?>
		<?php echo $form->textField($model, 'is_active'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'is_url'); ?>
		<?php echo $form->textField($model, 'is_url'); ?>
	</div>

	<div class="row buttons">
		<?php echo GxHtml::submitButton(Yii::t('app', 'Search')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->
