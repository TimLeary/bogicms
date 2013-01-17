<div class="view">

	<?php echo GxHtml::encode($data->getAttributeLabel('page_id')); ?>:
	<?php echo GxHtml::link(GxHtml::encode($data->page_id), array('view', 'id' => $data->page_id)); ?>
	<br />

	<?php echo GxHtml::encode($data->getAttributeLabel('page_name')); ?>:
	<?php echo GxHtml::encode($data->page_name); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('language_id')); ?>:
		<?php echo GxHtml::encode(GxHtml::valueEx($data->language)); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('permalink')); ?>:
	<?php echo GxHtml::encode($data->permalink); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('menu_id')); ?>:
		<?php echo GxHtml::encode(GxHtml::valueEx($data->menu)); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('url')); ?>:
	<?php echo GxHtml::encode($data->url); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('is_active')); ?>:
	<?php echo GxHtml::encode($data->is_active); ?>
	<br />
	<?php /*
	<?php echo GxHtml::encode($data->getAttributeLabel('is_url')); ?>:
	<?php echo GxHtml::encode($data->is_url); ?>
	<br />
	*/ ?>

</div>