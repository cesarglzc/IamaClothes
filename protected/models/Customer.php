<?php

/**
 * This is the model class for table "tbl_customer".
 *
 * The followings are the available columns in table 'tbl_customer':
 * @property string $id
 * @property integer $rfc
 * @property string $name
 * @property string $lastName
 * @property string $streetName
 * @property string $streetName2
 * @property integer $zipcode
 * @property string $state
 * @property string $city
 * @property integer $phoneNumber
 * @property string $customerType
 *
 * The followings are the available model relations:
 * @property Order[] $orders
 * @property User[] $users
 */
class Customer extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Customer the static model class
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
		return 'tbl_customer';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('rfc, zipcode, phoneNumber', 'required'),
			array('rfc, zipcode, phoneNumber', 'numerical', 'integerOnly'=>true),
			array('name, lastName, streetName, streetName2, state, city, customerType', 'length', 'max'=>64),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, rfc, name, lastName, streetName, streetName2, zipcode, state, city, phoneNumber, customerType', 'safe', 'on'=>'search'),
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
			'orders' => array(self::HAS_MANY, 'Order', 'id_customer'),
			'users' => array(self::HAS_MANY, 'User', 'id_customer'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'rfc' => 'Rfc',
			'name' => 'Name',
			'lastName' => 'Last Name',
			'streetName' => 'Street Name',
			'streetName2' => 'Street Name2',
			'zipcode' => 'Zipcode',
			'state' => 'State',
			'city' => 'City',
			'phoneNumber' => 'Phone Number',
			'customerType' => 'Customer Type',
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
		$criteria->compare('rfc',$this->rfc);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('lastName',$this->lastName,true);
		$criteria->compare('streetName',$this->streetName,true);
		$criteria->compare('streetName2',$this->streetName2,true);
		$criteria->compare('zipcode',$this->zipcode);
		$criteria->compare('state',$this->state,true);
		$criteria->compare('city',$this->city,true);
		$criteria->compare('phoneNumber',$this->phoneNumber);
		$criteria->compare('customerType',$this->customerType,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}