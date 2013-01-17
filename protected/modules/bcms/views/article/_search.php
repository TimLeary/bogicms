<div class="wide form">

<?php $form = $this->beginWidget('GxActiveForm', array(
	'action' => Yii::app()->createUrl($this->route),
	'method' => 'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model, 'article_id'); ?>
		<?php echo $form->textField($model, 'article_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'menu_in_language_id'); ?>
		<?php echo $form->textField($model, 'menu_in_language_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'article_short'); ?>
		<?php echo $form->textArea($model, 'article_short'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'article_text'); ?>
		<?php echo $form->textArea($model, 'article_text'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'article_title'); ?>
		<?php echo $form->textField($model, 'article_title', array('maxlength' => 255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'article_description'); ?>
		<?php echo $form->textField($model, 'article_description', array('maxlength' => 255)); ?>
	</div>

	<div class="row buttons">
		<?php echo GxHtml::submitButton(Yii::t('app', 'Search')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->
