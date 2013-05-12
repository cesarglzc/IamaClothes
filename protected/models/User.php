<?php

/**
 * This is the model class for table "tbl_user".
 *
 * The followings are the available columns in table 'tbl_user':
 * @property string $id
 * @property string $name
 * @property string $password
 * @property string $email
 * @property string $createTime
 * @property string $lastLogin
 * @property string $id_customer
 * @property integer $activation
 *
 * The followings are the available model relations:
 * @property Customer $idCustomer
 */
class User extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return User the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('createTime, id_customer', 'required'),
			array('activation', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>64),
			array('password', 'length', 'max'=>256),
			array('email', 'length', 'max'=>128),
			array('id_customer', 'length', 'max'=>11),
			array('lastLogin', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, name, password, email, createTime, lastLogin, id_customer, activation', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'idCustomer' => array(self::BELONGS_TO, 'Customer', 'id_customer'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'name' => 'Name',
			'password' => 'Password',
			'email' => 'Email',
			'createTime' => 'Create Time',
			'lastLogin' => 'Last Login',
			'id_customer' => 'Id Customer',
			'activation' => 'Activation',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('createTime',$this->createTime,true);
		$criteria->compare('lastLogin',$this->lastLogin,true);
		$criteria->compare('id_customer',$this->id_customer,true);
		$criteria->compare('activation',$this->activation);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}