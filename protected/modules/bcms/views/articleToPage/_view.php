<div class="view">

	<?php echo GxHtml::encode($data->getAttributeLabel('article_to_menu_id')); ?>:
	<?php echo GxHtml::link(GxHtml::encode($data->article_to_menu_id), array('view', 'id' => $data->article_to_menu_id)); ?>
	<br />

	<?php echo GxHtml::encode($data->getAttributeLabel('menu_in_language_id')); ?>:
		<?php echo GxHtml::encode(GxHtml::valueEx($data->menuInLanguage)); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('article_id')); ?>:
		<?php echo GxHtml::encode(GxHtml::valueEx($data->article)); ?>
	<br />
	<?php echo GxHtml::encode($data->getAttributeLabel('priority')); ?>:
	<?php echo GxHtml::encode($data->priority); ?>
	<br />

</div>