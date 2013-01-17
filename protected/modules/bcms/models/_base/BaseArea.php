<?php

/**
 * This is the model base class for the table "area".
 * DO NOT MODIFY THIS FILE! It is automatically generated by giix.
 * If any changes are necessary, you must set or override the required
 * property or method in class "Area".
 *
 * Columns in table "area" available as properties of the model,
 * and there are no model relations.
 *
 * @property integer $area_id
 * @property string $area_name
 *
 */
abstract class BaseArea extends GxActiveRecord {

	public static function model($className=__CLASS__) {
		return parent::model($className);
	}

	public function tableName() {
		return 'area';
	}

	public static function label($n = 1) {
		return Yii::t('app', 'Area|Areas', $n);
	}

	public static function representingColumn() {
		return 'area_name';
	}

	public function rules() {
		return array(
			array('area_name', 'required'),
			array('area_name', 'length', 'max'=>45),
			array('area_id, area_name', 'safe', 'on'=>'search'),
		);
	}

	public function relations() {
		return array(
		);
	}

	public function pivotModels() {
		return array(
		);
	}

	public function attributeLabels() {
		return array(
			'area_id' => Yii::t('app', 'Area'),
			'area_name' => Yii::t('app', 'Area Name'),
		);
	}

	public function search() {
		$criteria = new CDbCriteria;

		$criteria->compare('area_id', $this->area_id);
		$criteria->compare('area_name', $this->area_name, true);

		return new CActiveDataProvider($this, array(
			'criteria' => $criteria,
		));
	}
}