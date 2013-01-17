<?php

$this->breadcrumbs = array(
	$model->label(2) => array('index'),
	GxHtml::valueEx($model),
);

$this->menu=array(
	array('label'=>Yii::t('app', 'List') . ' ' . $model->label(2), 'url'=>array('index')),
	array('label'=>Yii::t('app', 'Create') . ' ' . $model->label(), 'url'=>array('create')),
	array('label'=>Yii::t('app', 'Update') . ' ' . $model->label(), 'url'=>array('update', 'id' => $model->article_to_menu_id)),
	array('label'=>Yii::t('app', 'Delete') . ' ' . $model->label(), 'url'=>'#', 'linkOptions' => array('submit' => array('delete', 'id' => $model->article_to_menu_id), 'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>Yii::t('app', 'Manage') . ' ' . $model->label(2), 'url'=>array('admin')),
);
?>

<h1><?php echo Yii::t('app', 'View') . ' ' . GxHtml::encode($model->label()) . ' ' . GxHtml::encode(GxHtml::valueEx($model)); ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data' => $model,
	'attributes' => array(
'article_to_menu_id',
array(
			'name' => 'menuInLanguage',
			'type' => 'raw',
			'value' => $model->menuInLanguage !== null ? GxHtml::link(GxHtml::encode(GxHtml::valueEx($model->menuInLanguage)), array('page/view', 'id' => GxActiveRecord::extractPkValue($model->menuInLanguage, true))) : null,
			),
array(
			'name' => 'article',
			'type' => 'raw',
			'value' => $model->article !== null ? GxHtml::link(GxHtml::encode(GxHtml::valueEx($model->article)), array('article/view', 'id' => GxActiveRecord::extractPkValue($model->article, true))) : null,
			),
'priority',
	),
)); ?>

