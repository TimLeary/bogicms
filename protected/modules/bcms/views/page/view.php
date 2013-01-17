<?php

$this->breadcrumbs = array(
	$model->label(2) => array('index'),
	GxHtml::valueEx($model),
);

$this->menu=array(
	array('label'=>Yii::t('app', 'List') . ' ' . $model->label(2), 'url'=>array('index')),
	array('label'=>Yii::t('app', 'Create') . ' ' . $model->label(), 'url'=>array('create')),
	array('label'=>Yii::t('app', 'Update') . ' ' . $model->label(), 'url'=>array('update', 'id' => $model->page_id)),
	array('label'=>Yii::t('app', 'Delete') . ' ' . $model->label(), 'url'=>'#', 'linkOptions' => array('submit' => array('delete', 'id' => $model->page_id), 'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>Yii::t('app', 'Manage') . ' ' . $model->label(2), 'url'=>array('admin')),
);
?>

<h1><?php echo Yii::t('app', 'View') . ' ' . GxHtml::encode($model->label()) . ' ' . GxHtml::encode(GxHtml::valueEx($model)); ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data' => $model,
	'attributes' => array(
'page_id',
'page_name',
array(
			'name' => 'language',
			'type' => 'raw',
			'value' => $model->language !== null ? GxHtml::link(GxHtml::encode(GxHtml::valueEx($model->language)), array('language/view', 'id' => GxActiveRecord::extractPkValue($model->language, true))) : null,
			),
'permalink',
array(
			'name' => 'menu',
			'type' => 'raw',
			'value' => $model->menu !== null ? GxHtml::link(GxHtml::encode(GxHtml::valueEx($model->menu)), array('cathegories/view', 'id' => GxActiveRecord::extractPkValue($model->menu, true))) : null,
			),
'url',
'is_active',
'is_url',
	),
)); ?>

<h2><?php echo GxHtml::encode($model->getRelationLabel('articleToPages')); ?></h2>
<?php
	echo GxHtml::openTag('ul');
	foreach($model->articleToPages as $relatedModel) {
		echo GxHtml::openTag('li');
		echo GxHtml::link(GxHtml::encode(GxHtml::valueEx($relatedModel)), array('articleToPage/view', 'id' => GxActiveRecord::extractPkValue($relatedModel, true)));
		echo GxHtml::closeTag('li');
	}
	echo GxHtml::closeTag('ul');
?>