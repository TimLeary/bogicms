<?php
/* @var $this CathegoriesController */
/* @var $model Cathegories */

$this->breadcrumbs=array(
	'Cathegories'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Cathegories', 'url'=>array('index')),
	array('label'=>'Create Cathegories', 'url'=>array('create')),
	array('label'=>'Update Cathegories', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Cathegories', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Cathegories', 'url'=>array('admin')),
);
?>

<h1>View Cathegories #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'lft',
		'rgt',
		'level',
	),
)); ?>
