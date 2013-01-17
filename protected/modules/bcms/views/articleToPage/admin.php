<?php

$this->breadcrumbs = array(
	$model->label(2) => array('index'),
	Yii::t('app', 'Manage'),
);

$this->menu = array(
		array('label'=>Yii::t('app', 'List') . ' ' . $model->label(2), 'url'=>array('index')),
		array('label'=>Yii::t('app', 'Create') . ' ' . $model->label(), 'url'=>array('create')),
	);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('article-to-page-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1><?php echo Yii::t('app', 'Manage') . ' ' . GxHtml::encode($model->label(2)); ?></h1>

<p>
You may optionally enter a comparison operator (&lt;, &lt;=, &gt;, &gt;=, &lt;&gt; or =) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo GxHtml::link(Yii::t('app', 'Advanced Search'), '#', array('class' => 'search-button')); ?>
<div class="search-form">
<?php $this->renderPartial('_search', array(
	'model' => $model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id' => 'article-to-page-grid',
	'dataProvider' => $model->search(),
	'filter' => $model,
	'columns' => array(
		'article_to_menu_id',
		array(
				'name'=>'menu_in_language_id',
				'value'=>'GxHtml::valueEx($data->menuInLanguage)',
				'filter'=>GxHtml::listDataEx(Page::model()->findAllAttributes(null, true)),
				),
		array(
				'name'=>'article_id',
				'value'=>'GxHtml::valueEx($data->article)',
				'filter'=>GxHtml::listDataEx(Article::model()->findAllAttributes(null, true)),
				),
		'priority',
		array(
			'class' => 'CButtonColumn',
		),
	),
)); ?>