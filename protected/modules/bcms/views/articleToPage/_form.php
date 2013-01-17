<div class="form">


<?php $form = $this->beginWidget('GxActiveForm', array(
	'id' => 'article-to-page-form',
	'enableAjaxValidation' => false,
));
?>

	<p class="note">
		<?php echo Yii::t('app', 'Fields with'); ?> <span class="required">*</span> <?php echo Yii::t('app', 'are required'); ?>.
	</p>

	<?php echo $form->errorSummary($model); ?>

		<div class="row">
		<?php echo $form->labelEx($model,'menu_in_language_id'); ?>
		<?php echo $form->dropDownList($model, 'menu_in_language_id', GxHtml::listDataEx(Page::model()->findAllAttributes(null, true))); ?>
		<?php echo $form->error($model,'menu_in_language_id'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'article_id'); ?>
		<?php echo $form->dropDownList($model, 'article_id', GxHtml::listDataEx(Article::model()->findAllAttributes(null, true))); ?>
		<?php echo $form->error($model,'article_id'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'priority'); ?>
		<?php echo $form->textField($model, 'priority'); ?>
		<?php echo $form->error($model,'priority'); ?>
		</div><!-- row -->


<?php
echo GxHtml::submitButton(Yii::t('app', 'Save'));
$this->endWidget();
?>
</div><!-- form -->