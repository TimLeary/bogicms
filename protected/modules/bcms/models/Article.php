<?php

Yii::import('application.modules.bcms.models._base.BaseArticle');

class Article extends BaseArticle
{
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
}