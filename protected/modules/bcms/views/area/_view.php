<div class="view">

	<?php echo GxHtml::encode($data->getAttributeLabel('area_id')); ?>:
	<?php echo GxHtml::link(GxHtml::encode($data->area_id), array('view', 'id' => $data->area_id)); ?>
	<br />

	<?php echo GxHtml::encode($data->getAttributeLabel('area_name')); ?>:
	<?php echo GxHtml::encode($data->area_name); ?>
	<br />

</div>