<?php

class AreaController extends GxController {


	public function actionView($id) {
		$this->render('view', array(
			'model' => $this->loadModel($id, 'Area'),
		));
	}

	public function actionCreate() {
		$model = new Area;


		if (isset($_POST['Area'])) {
			$model->setAttributes($_POST['Area']);

			if ($model->save()) {
				if (Yii::app()->getRequest()->getIsAjaxRequest())
					Yii::app()->end();
				else
					$this->redirect(array('view', 'id' => $model->area_id));
			}
		}

		$this->render('create', array( 'model' => $model));
	}

	public function actionUpdate($id) {
		$model = $this->loadModel($id, 'Area');


		if (isset($_POST['Area'])) {
			$model->setAttributes($_POST['Area']);

			if ($model->save()) {
				$this->redirect(array('view', 'id' => $model->area_id));
			}
		}

		$this->render('update', array(
				'model' => $model,
				));
	}

	public function actionDelete($id) {
		if (Yii::app()->getRequest()->getIsPostRequest()) {
			$this->loadModel($id, 'Area')->delete();

			if (!Yii::app()->getRequest()->getIsAjaxRequest())
				$this->redirect(array('admin'));
		} else
			throw new CHttpException(400, Yii::t('app', 'Your request is invalid.'));
	}

	public function actionIndex() {
		$dataProvider = new CActiveDataProvider('Area');
		$this->render('index', array(
			'dataProvider' => $dataProvider,
		));
	}

	public function actionAdmin() {
		$model = new Area('search');
		$model->unsetAttributes();

		if (isset($_GET['Area']))
			$model->setAttributes($_GET['Area']);

		$this->render('admin', array(
			'model' => $model,
		));
	}

}