<div class="form">


<?php $form = $this->beginWidget('GxActiveForm', array(
	'id' => 'page-form',
	'enableAjaxValidation' => false,
));
?>

	<p class="note">
		<?php echo Yii::t('app', 'Fields with'); ?> <span class="required">*</span> <?php echo Yii::t('app', 'are required'); ?>.
	</p>

	<?php echo $form->errorSummary($model); ?>

		<div class="row">
		<?php echo $form->labelEx($model,'page_name'); ?>
		<?php echo $form->textField($model, 'page_name', array('maxlength' => 255)); ?>
		<?php echo $form->error($model,'page_name'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'language_id'); ?>
		<?php echo $form->dropDownList($model, 'language_id', GxHtml::listDataEx(Language::model()->findAllAttributes(null, true))); ?>
		<?php echo $form->error($model,'language_id'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'permalink'); ?>
		<?php echo $form->textField($model, 'permalink', array('maxlength' => 255)); ?>
		<?php echo $form->error($model,'permalink'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'menu_id'); ?>
		<?php echo $form->dropDownList($model, 'menu_id', GxHtml::listDataEx(Cathegories::model()->findAllAttributes(null, true))); ?>
		<?php echo $form->error($model,'menu_id'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'url'); ?>
		<?php echo $form->textField($model, 'url', array('maxlength' => 255)); ?>
		<?php echo $form->error($model,'url'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'is_active'); ?>
		<?php echo $form->textField($model, 'is_active'); ?>
		<?php echo $form->error($model,'is_active'); ?>
		</div><!-- row -->
		<div class="row">
		<?php echo $form->labelEx($model,'is_url'); ?>
		<?php echo $form->textField($model, 'is_url'); ?>
		<?php echo $form->error($model,'is_url'); ?>
		</div><!-- row -->

		<label><?php echo GxHtml::encode($model->getRelationLabel('articleToPages')); ?></label>
		<?php echo $form->checkBoxList($model, 'articleToPages', GxHtml::encodeEx(GxHtml::listDataEx(ArticleToPage::model()->findAllAttributes(null, true)), false, true)); ?>

<?php
echo GxHtml::submitButton(Yii::t('app', 'Save'));
$this->endWidget();
?>
</div><!-- form -->