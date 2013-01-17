<?php

Yii::import('application.modules.bcms.models._base.BaseArticleToPage');

class ArticleToPage extends BaseArticleToPage
{
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
}