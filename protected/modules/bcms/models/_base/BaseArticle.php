<?php

/**
 * This is the model base class for the table "article".
 * DO NOT MODIFY THIS FILE! It is automatically generated by giix.
 * If any changes are necessary, you must set or override the required
 * property or method in class "Article".
 *
 * Columns in table "article" available as properties of the model,
 * followed by relations of table "article" available as properties of the model.
 *
 * @property integer $article_id
 * @property integer $menu_in_language_id
 * @property string $article_short
 * @property string $article_text
 * @property string $article_title
 * @property string $article_description
 *
 * @property ArticleToPage[] $articleToPages
 */
abstract class BaseArticle extends GxActiveRecord {

	public static function model($className=__CLASS__) {
		return parent::model($className);
	}

	public function tableName() {
		return 'article';
	}

	public static function label($n = 1) {
		return Yii::t('app', 'Article|Articles', $n);
	}

	public static function representingColumn() {
		return 'article_short';
	}

	public function rules() {
		return array(
			array('menu_in_language_id', 'required'),
			array('menu_in_language_id', 'numerical', 'integerOnly'=>true),
			array('article_title, article_description', 'length', 'max'=>255),
			array('article_short, article_text', 'safe'),
			array('article_short, article_text, article_title, article_description', 'default', 'setOnEmpty' => true, 'value' => null),
			array('article_id, menu_in_language_id, article_short, article_text, article_title, article_description', 'safe', 'on'=>'search'),
		);
	}

	public function relations() {
		return array(
			'articleToPages' => array(self::HAS_MANY, 'ArticleToPage', 'article_id'),
		);
	}

	public function pivotModels() {
		return array(
		);
	}

	public function attributeLabels() {
		return array(
			'article_id' => Yii::t('app', 'Article'),
			'menu_in_language_id' => Yii::t('app', 'Menu In Language'),
			'article_short' => Yii::t('app', 'Article Short'),
			'article_text' => Yii::t('app', 'Article Text'),
			'article_title' => Yii::t('app', 'Article Title'),
			'article_description' => Yii::t('app', 'Article Description'),
			'articleToPages' => null,
		);
	}

	public function search() {
		$criteria = new CDbCriteria;

		$criteria->compare('article_id', $this->article_id);
		$criteria->compare('menu_in_language_id', $this->menu_in_language_id);
		$criteria->compare('article_short', $this->article_short, true);
		$criteria->compare('article_text', $this->article_text, true);
		$criteria->compare('article_title', $this->article_title, true);
		$criteria->compare('article_description', $this->article_description, true);

		return new CActiveDataProvider($this, array(
			'criteria' => $criteria,
		));
	}
}