<div class="form">


<?php $form = $this->beginWidget('GxActiveForm', array(
	'id' => 'article-form',
	'enableAjaxValidation' => false,
));
?>

	<p class="note">
		<?php echo Yii::t('app', 'Fields with'); ?> <span class="required">*</span> <?php echo Yii::t('app', 'are required'); ?>.
	</p>

	<?php echo $form->errorSummary($model); ?>

		<div class="row">
		<?php echo $form->labelEx($model,'menu_in_language_id'); ?>
		<?php echo $form->textField($model, 'menu_in_language_id'); ?>
		<?php echo $form->error($model,'menu_in_language_id'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'article_short'); ?>
		<?php echo $form->textArea($model, 'article_short'); ?>
		<?php echo $form->error($model,'article_short'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'article_text'); ?>
		<?php echo $form->textArea($model, 'article_text'); ?>
		<?php echo $form->error($model,'article_text'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'article_title'); ?>
		<?php echo $form->textField($model, 'article_title', array('maxlength' => 255)); ?>
		<?php echo $form->error($model,'article_title'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'article_description'); ?>
		<?php echo $form->textField($model, 'article_description', array('maxlength' => 255)); ?>
		<?php echo $form->error($model,'article_description'); ?>
		</div><!-- row -->

		<label><?php echo GxHtml::encode($model->getRelationLabel('articleToPages')); ?></label>
		<?php echo $form->checkBoxList($model, 'articleToPages', GxHtml::encodeEx(GxHtml::listDataEx(ArticleToPage::model()->findAllAttributes(null, true)), false, true)); ?>

<?php
echo GxHtml::submitButton(Yii::t('app', 'Save'));
$this->endWidget();
?>
</div><!-- form -->