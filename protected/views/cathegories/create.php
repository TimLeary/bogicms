<?php
/* @var $this CathegoriesController */
/* @var $model Cathegories */

$this->breadcrumbs=array(
	'Cathegories'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Cathegories', 'url'=>array('index')),
	array('label'=>'Manage Cathegories', 'url'=>array('admin')),
);
?>

<h1>Create Cathegories</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>