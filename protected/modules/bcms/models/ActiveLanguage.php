<?php

Yii::import('application.modules.bcms.models._base.BaseLanguage');

class ActiveLanguage extends BaseLanguage
{
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
        
        public function defaultScope(){
            return array(
                'condition'=>"is_active=1",
            );
        }
}