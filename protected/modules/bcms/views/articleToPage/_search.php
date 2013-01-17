<div class="wide form">

<?php $form = $this->beginWidget('GxActiveForm', array(
	'action' => Yii::app()->createUrl($this->route),
	'method' => 'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model, 'article_to_menu_id'); ?>
		<?php echo $form->textField($model, 'article_to_menu_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'menu_in_language_id'); ?>
		<?php echo $form->dropDownList($model, 'menu_in_language_id', GxHtml::listDataEx(Page::model()->findAllAttributes(null, true)), array('prompt' => Yii::t('app', 'All'))); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'article_id'); ?>
		<?php echo $form->dropDownList($model, 'article_id', GxHtml::listDataEx(Article::model()->findAllAttributes(null, true)), array('prompt' => Yii::t('app', 'All'))); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model, 'priority'); ?>
		<?php echo $form->textField($model, 'priority'); ?>
	</div>

	<div class="row buttons">
		<?php echo GxHtml::submitButton(Yii::t('app', 'Search')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->
