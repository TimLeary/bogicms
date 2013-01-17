<?php

class LanguageController extends GxController {


	public function actionView($id) {
		$this->render('view', array(
			'model' => $this->loadModel($id, 'Language'),
		));
	}

	public function actionCreate() {
		$model = new Language;


		if (isset($_POST['Language'])) {
			$model->setAttributes($_POST['Language']);

			if ($model->save()) {
				if (Yii::app()->getRequest()->getIsAjaxRequest())
					Yii::app()->end();
				else
					$this->redirect(array('view', 'id' => $model->language_id));
			}
		}

		$this->render('create', array( 'model' => $model));
	}

	public function actionUpdate($id) {
		$model = $this->loadModel($id, 'Language');


		if (isset($_POST['Language'])) {
			$model->setAttributes($_POST['Language']);

			if ($model->save()) {
				$this->redirect(array('view', 'id' => $model->language_id));
			}
		}

		$this->render('update', array(
				'model' => $model,
				));
	}

	public function actionDelete($id) {
		if (Yii::app()->getRequest()->getIsPostRequest()) {
			$this->loadModel($id, 'Language')->delete();

			if (!Yii::app()->getRequest()->getIsAjaxRequest())
				$this->redirect(array('admin'));
		} else
			throw new CHttpException(400, Yii::t('app', 'Your request is invalid.'));
	}

	public function actionIndex() {
		$dataProvider = new CActiveDataProvider('Language');
		$this->render('index', array(
			'dataProvider' => $dataProvider,
		));
	}

	public function actionAdmin() {
		$model = new Language('search');
		$model->unsetAttributes();

		if (isset($_GET['Language']))
			$model->setAttributes($_GET['Language']);

		$this->render('admin', array(
			'model' => $model,
		));
	}

}