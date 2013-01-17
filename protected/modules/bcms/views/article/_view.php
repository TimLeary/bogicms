<div class="view">

	<?php echo GxHtml::encode($data->getAttributeLabel('article_id')); ?>:
	<?php echo GxHtml::link(GxHtml::encode($data->article_id), array('view', 'id' => $data->article_id)); ?>
	<br />

	<?php echo GxHtml::encode($data->getAttributeLabel('menu_in_language_id')); ?>:
	<?php echo GxHtml::encode($data->menu_in_language_id); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('article_short')); ?>:
	<?php echo GxHtml::encode($data->article_short); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('article_text')); ?>:
	<?php echo GxHtml::encode($data->article_text); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('article_title')); ?>:
	<?php echo GxHtml::encode($data->article_title); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('article_description')); ?>:
	<?php echo GxHtml::encode($data->article_description); ?>
	<br />

</div>