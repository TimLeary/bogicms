<?php
/* @var $this CathegoriesController */
/* @var $dataProvider CActiveDataProvider */

?>

<h1>Cathegories</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
<?php
        $this->widget('ext.NestedDynaTree.NestedDynaTree', array(
            'ajaxController' => Yii::app()->createUrl('AXtree',array()).'/',
            //the class name of the model.
            'modelClass' => "Cathegories",
            // action taken on click on item. (default empty)
            'clickAction' => "/Cathegories/update/",
            //if given, AJAX load a result of clickAction to the container (default empty)
            'clickAjaxLoadContainer' => 'content',
            //can insert, delete and ( if enabled)drag&drop (default true) 
            'manipulationEnabled' => !Yii::app()->user->isGuest,
            //can sort items by drag&drop (default true)
            'dndEnabled' => true,
 
            //AJAX controller absolute path if you don`t use controllerMap
            // 'ajaxController'=>'/path/to/controller/' //default('/AXtree/')
        ));
?>