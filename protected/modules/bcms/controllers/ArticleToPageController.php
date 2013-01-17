<?php

class ArticleToPageController extends GxController {


	public function actionView($id) {
		$this->render('view', array(
			'model' => $this->loadModel($id, 'ArticleToPage'),
		));
	}

	public function actionCreate() {
		$model = new ArticleToPage;


		if (isset($_POST['ArticleToPage'])) {
			$model->setAttributes($_POST['ArticleToPage']);

			if ($model->save()) {
				if (Yii::app()->getRequest()->getIsAjaxRequest())
					Yii::app()->end();
				else
					$this->redirect(array('view', 'id' => $model->article_to_menu_id));
			}
		}

		$this->render('create', array( 'model' => $model));
	}

	public function actionUpdate($id) {
		$model = $this->loadModel($id, 'ArticleToPage');


		if (isset($_POST['ArticleToPage'])) {
			$model->setAttributes($_POST['ArticleToPage']);

			if ($model->save()) {
				$this->redirect(array('view', 'id' => $model->article_to_menu_id));
			}
		}

		$this->render('update', array(
				'model' => $model,
				));
	}

	public function actionDelete($id) {
		if (Yii::app()->getRequest()->getIsPostRequest()) {
			$this->loadModel($id, 'ArticleToPage')->delete();

			if (!Yii::app()->getRequest()->getIsAjaxRequest())
				$this->redirect(array('admin'));
		} else
			throw new CHttpException(400, Yii::t('app', 'Your request is invalid.'));
	}

	public function actionIndex() {
		$dataProvider = new CActiveDataProvider('ArticleToPage');
		$this->render('index', array(
			'dataProvider' => $dataProvider,
		));
	}

	public function actionAdmin() {
		$model = new ArticleToPage('search');
		$model->unsetAttributes();

		if (isset($_GET['ArticleToPage']))
			$model->setAttributes($_GET['ArticleToPage']);

		$this->render('admin', array(
			'model' => $model,
		));
	}

}