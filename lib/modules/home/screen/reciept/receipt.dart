import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReceiptScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor:Color(-1088543194),
          title: Text('Tourista'),
          actions: [
            Icon(
              Icons.notifications,
            ),
          ],
        ),
        body:Column(children: [
          SizedBox(height: 10,width: 10,),
          Card(
            elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.zero),
                      color: Colors.white60,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Text('East Repair lnc', style: TextStyle(
                                fontWeight: FontWeight.normal),),
                            SizedBox(height: 10),
                            Text('1912 Harvest Lane', style: TextStyle(fontSize: 10,
                                fontWeight: FontWeight.normal) ), SizedBox(height: 5,),
                            Text('New York,NY 12210 ', style: TextStyle(fontSize: 10,
                                fontWeight: FontWeight.normal)
                            ),
                            SizedBox(height: 5,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(children: [
                          Container(
                            height:120,
                            width: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bill To', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text('John Smith', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal), ), SizedBox(height: 5,),
                                Text('2 Count Square ', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal ),), SizedBox(height: 5,),
                                Text('New York,NY 12210 ', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            height:120,
                            width: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Ship To', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.bold),), SizedBox(height: 5,),
                                Text('John Smith', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                                Text('3787 Pineview Drive', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal), ), SizedBox(height: 5,),
                                Text('Cambridge ,MA 12210 ', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                              ],
                            ),
                          ),
                          Container(
                            height:120,
                            width: 80,
                            child: Column(
                              children: [
                                Text('Receipt#', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text('Receipt Date', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal), ), SizedBox(width: 5,),
                                Text('P.O# ', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                                Text('Due Date', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal), ), SizedBox(height: 5,),
                              ],
                            ),
                          ),
                          Container(
                            height:120,
                            width: 80,
                            child: Column(
                              children: [
                                Text('US-001', style:TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.bold),), SizedBox(height: 5,),
                                Text('11/02/2019', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                                Text('23/12/2019', style: TextStyle(fontSize: 10,
                                  fontWeight: FontWeight.normal,),), SizedBox(height: 5,),
                                Text('26/02/2019', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                              ],
                            ),
                          ),
                        ],),
                        SizedBox(height: 10,),
                        Divider(height:10 ,thickness:3,color: Colors.black,),
                        Container(
                          child: Row(
                            children: [
                            Text('Receipt Total',
                              style: TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 130,),
                            Text('154.06 LE',
                              style: TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],),
                        ),
                        Divider(height:10 ,thickness: 3,color: Colors.black,),
                        SizedBox(height: 10,),
                        Row(children: [
                          Container(
                            height: 150,
                            width: 50,
                            child: Column(children: [
                              Text('QTY',style: TextStyle(fontSize: 10,
                              fontWeight: FontWeight.bold,)), SizedBox(height: 10,),
                              Text('1', style: TextStyle(fontSize: 10,
                                  fontWeight: FontWeight.normal),), SizedBox(height: 15,),
                              Text('2', style: TextStyle(fontSize: 10,
                                  fontWeight: FontWeight.normal),), SizedBox(height: 15,),
                              Text('3', style: TextStyle(fontSize: 10,
                                  fontWeight: FontWeight.normal),), SizedBox(height: 15,),
                            ],),
                          ),
                          SizedBox(width: 2,),
                          Container(
                            height: 150,
                            width: 100,
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [Text('DESCRIPTION',style: TextStyle(fontSize: 10,
                                fontWeight: FontWeight.bold,)),
                                SizedBox(height: 5,),
                                Text('Front and rear brake cables', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                                Text('New set of pedal arms', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                                Text('Labor 3hrs', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                              ],),
                          ),
                          Container(
                            height: 150,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text('UNIT PRICE',style: TextStyle(fontSize: 10,
                                fontWeight: FontWeight.bold,)), SizedBox(height: 5,),
                                Text('100.00', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal ),), SizedBox(height: 5,),
                                Text('15.00', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal ),), SizedBox(height: 5,),
                                Text('5.00', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                                Text('Subtotal', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                                Text('Sales Tax 6.25', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal ),), SizedBox(height: 5,),

                              ],),
                          ),
                          Container(
                            height: 150,
                            width: 70,
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text('AMOUNT',style: TextStyle(fontSize: 10,
                                  fontWeight: FontWeight.bold,)), SizedBox(height: 5,),
                                Text('100.00', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal ),), SizedBox(height: 5,),
                                Text('30.00', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal ),), SizedBox(height: 5,),
                                Text('15.00', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),), SizedBox(height: 5,),
                                Text('145.00', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal),),
                                SizedBox(height: 5,),
                                Text('9.06', style: TextStyle(fontSize: 10,
                                    fontWeight: FontWeight.normal ),),

                              ],),
                          ),
                        ]
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Terms & Conditions',
                              style: TextStyle(fontSize: 10,
                                  fontWeight: FontWeight.bold),), SizedBox(height: 5,),
                            Text('Payment is Due within 15 days', style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            Text('Please make checks Payable to : East Repair lnc',style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],),
                      ],
                    ),
                  ),
                ),
             
              ],
            ),
          ),
        ),
          SizedBox(height: 20,),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left:30.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(-1088543194),
                    ),
                    width: 140.0,
                    height: 50.0,
                    child: MaterialButton(onPressed: () {

                    },
                      child: Text(
                        'not your order',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:15.0
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40.0,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color:Color(-1088543194),
                    ),
                    width: 140.0,
                    height: 50.0,
                    child: MaterialButton(onPressed: () {

                    },
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:15.0
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],)
    );
  }
}
