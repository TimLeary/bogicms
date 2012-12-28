<?php
/* @var $this CathegoriesController */
/* @var $model Cathegories */

$this->breadcrumbs=array(
	'Cathegories'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Cathegories', 'url'=>array('index')),
	array('label'=>'Create Cathegories', 'url'=>array('create')),
	array('label'=>'View Cathegories', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Cathegories', 'url'=>array('admin')),
);
?>

<h1>Update Cathegories <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>