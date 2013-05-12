<?php

/**
 * This is the model class for table "tbl_order".
 *
 * The followings are the available columns in table 'tbl_order':
 * @property string $id
 * @property string $id_customer
 * @property string $date
 * @property string $deliveryStreet
 * @property string $deliveryStreet2
 * @property string $deliveryZipcode
 * @property string $deliveryCity
 * @property string $deliveryState
 * @property string $orderType
 * @property string $payType
 *
 * The followings are the available model relations:
 * @property Customer $idCustomer
 * @property OrderDetail[] $orderDetails
 */
class Order extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Order the static model class
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
		return 'tbl_order';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_customer, date', 'required'),
			array('id_customer', 'length', 'max'=>11),
			array('deliveryStreet, deliveryStreet2, deliveryZipcode, deliveryCity, deliveryState, orderType, payType', 'length', 'max'=>64),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, id_customer, date, deliveryStreet, deliveryStreet2, deliveryZipcode, deliveryCity, deliveryState, orderType, payType', 'safe', 'on'=>'search'),
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
			'orderDetails' => array(self::HAS_MANY, 'OrderDetail', 'id_order'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_customer' => 'Id Customer',
			'date' => 'Date',
			'deliveryStreet' => 'Delivery Street',
			'deliveryStreet2' => 'Delivery Street2',
			'deliveryZipcode' => 'Delivery Zipcode',
			'deliveryCity' => 'Delivery City',
			'deliveryState' => 'Delivery State',
			'orderType' => 'Order Type',
			'payType' => 'Pay Type',
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
		$criteria->compare('id_customer',$this->id_customer,true);
		$criteria->compare('date',$this->date,true);
		$criteria->compare('deliveryStreet',$this->deliveryStreet,true);
		$criteria->compare('deliveryStreet2',$this->deliveryStreet2,true);
		$criteria->compare('deliveryZipcode',$this->deliveryZipcode,true);
		$criteria->compare('deliveryCity',$this->deliveryCity,true);
		$criteria->compare('deliveryState',$this->deliveryState,true);
		$criteria->compare('orderType',$this->orderType,true);
		$criteria->compare('payType',$this->payType,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}