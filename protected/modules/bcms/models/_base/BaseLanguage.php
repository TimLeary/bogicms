<?php

/**
 * This is the model base class for the table "language".
 * DO NOT MODIFY THIS FILE! It is automatically generated by giix.
 * If any changes are necessary, you must set or override the required
 * property or method in class "Language".
 *
 * Columns in table "language" available as properties of the model,
 * followed by relations of table "language" available as properties of the model.
 *
 * @property integer $language_id
 * @property string $language_code
 * @property integer $is_active
 * @property integer $is_default
 *
 * @property Page[] $pages
 */
abstract class BaseLanguage extends GxActiveRecord {

	public static function model($className=__CLASS__) {
		return parent::model($className);
	}

	public function tableName() {
		return 'language';
	}

	public static function label($n = 1) {
		return Yii::t('app', 'Language|Languages', $n);
	}

	public static function representingColumn() {
		return 'language_code';
	}

	public function rules() {
		return array(
			array('language_code', 'required'),
			array('is_active, is_default', 'numerical', 'integerOnly'=>true),
			array('language_code', 'length', 'max'=>45),
			array('is_active, is_default', 'default', 'setOnEmpty' => true, 'value' => null),
			array('language_id, language_code, is_active, is_default', 'safe', 'on'=>'search'),
		);
	}

	public function relations() {
		return array(
			'pages' => array(self::HAS_MANY, 'Page', 'language_id'),
		);
	}

	public function pivotModels() {
		return array(
		);
	}

	public function attributeLabels() {
		return array(
			'language_id' => Yii::t('app', 'Language'),
			'language_code' => Yii::t('app', 'Language Code'),
			'is_active' => Yii::t('app', 'Is Active'),
			'is_default' => Yii::t('app', 'Is Default'),
			'pages' => null,
		);
	}

	public function search() {
		$criteria = new CDbCriteria;

		$criteria->compare('language_id', $this->language_id);
		$criteria->compare('language_code', $this->language_code, true);
		$criteria->compare('is_active', $this->is_active);
		$criteria->compare('is_default', $this->is_default);

		return new CActiveDataProvider($this, array(
			'criteria' => $criteria,
		));
	}
        
}