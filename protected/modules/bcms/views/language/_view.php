<div class="view">

	<?php echo GxHtml::encode($data->getAttributeLabel('language_id')); ?>:
	<?php echo GxHtml::link(GxHtml::encode($data->language_id), array('view', 'id' => $data->language_id)); ?>
	<br />

	<?php echo GxHtml::encode($data->getAttributeLabel('language_code')); ?>:
	<?php echo GxHtml::encode($data->language_code); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('is_active')); ?>:
	<?php echo GxHtml::encode($data->is_active); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('is_default')); ?>:
	<?php echo GxHtml::encode($data->is_default); ?>
	<br />

</div>