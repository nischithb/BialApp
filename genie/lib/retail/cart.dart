// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie/retail/billwid.dart';
import 'package:genie/retail/productdetail.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';



class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // int itemCount =1;
  // bool value = false;
  
  @override
  Widget build(BuildContext context) {

    int lengthh;
    Box boxx = Hive.box('cartBox');
    // if(boxx.get("items"))  List cartItems = boxx.get('items'), lengthh = cartItems.length;
    List cartItems = boxx.get('items');
    if (cartItems.isEmpty) lengthh = 0;
    else lengthh = cartItems.length;
    
    // var itemCost = itemCount*cartItems[index][2];
    int bagtotcost=0;
    int roundcost=0;
    print(cartItems);
    // print(boxx);


    return Scaffold(
      appBar: AppBar(
                  backgroundColor: Colors.black,
                  leading: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close,)),
                  // leading: BackButton(color: Colors.white,)
                ),
      body: Column(
            children:[
              Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: lengthh,
                  itemBuilder: (BuildContext context, index){
                    
                    // int itemCount = 1;
                    int itemCost = cartItems[index][4]*(int.parse(cartItems[index][2]));
                    bagtotcost = roundcost + itemCost;
                    roundcost = itemCost;
                    // print(bagtotcost);

                    return GestureDetector(
                      onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder:(context)=> 
                            ProductDetailss(itemdet: cartItems[index][6], ind: cartItems[index][5], shopname: cartItems[index][0])
                         ));
                        // Navigator.pushNamed(context, ProductDetailss(itemdet: [], ind: cartItems[index][5], shopname: cartItems[index][0]))
                      },
                      child: Card(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 175,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage("${cartItems[index][3]}"),
                                  fit: BoxFit.fill,
                                )
                              ),
                              // child: Image.asset('assets/images/test.png',
                              // child: Image.network("${cartItems[index][3]}",
                              // fit: BoxFit.cover,),
                            ),
                            // Padding(padding: EdgeInsets.all(25),
                            SizedBox(width: 30,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cartItems[index][0]),
                                    SizedBox(height: 10,),
                                    // ignore: avoid_unnecessary_containers
                                    
                                      Container(
                                        // width: 60,
                                        // child: Text(cartItems[index][1], maxLines: 2,),
                                        child: Text("Jack and Jones", maxLines: 2,),
                                      ),
                                    
                                    SizedBox(height: 10,),
                                    Container(
                                      // child: Text("M"),
                                      child: Text("Size ${cartItems[index][7]}"),
                                    ),

                                    SizedBox(height: 10,),
                                    Container(
                                      // child: Text('\u{20B9} ${cartItems[index][2]}'),
                                      child: Text('\u{20B9} ${itemCost}'),
                                    ),
                      
                                    SizedBox(height: 10,),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        if (cartItems[index][4]>1) InkWell(
                                          onTap: (){
                                            setState(() {
                                              cartItems[index][4]=cartItems[index][4]-1;
                                            });
                                          },
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              size: 15,
                                              ),
                                          ),
                                        ),
                      
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Text("${cartItems[index][4]}"),
                                        ),
                      
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              cartItems[index][4]=cartItems[index][4]+1;
                                            });
                                          },
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 15,
                                              ),
                                           ),
                                        ),
                      
                                      ],
                                    ),
                      
                                    
                                  ],
                                ),
                              ),
                            ),
                            // ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  cartItems.removeAt(index);
                                  boxx.put('items', cartItems);
                                  setState(() {
                                    cartItems = cartItems;
                                  });
                                  // Navigator.pop(context);
                                  // Navigator.of(context).push(MaterialPageRoute(builder:(context)=> super.widget));
                                  // print(cartItems[index]);
                                  // boxx.getAt(0);
                                  // boxx.delete(boxx.getAt(0)[index]);
                                  // print(boxx.getAt(0)[index]);
                                },
                                child: Icon(Icons.close, size: 20,)
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                      
                  ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   // child: Card(
            //     child: Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: 100,
            //       child: Column(
            //         children: [
                      
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             // mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            //                 child: Text("Total: "),
            //               ),
            //               Spacer(),
            //               Text("One"),
            //             ],
            //           ),
          
                      
          
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             // mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            //                 child: Text("Total: "),
            //               ),
            //               Spacer(),
            //               Text("One"),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            SizedBox(height: 10,),
      
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: (){
                      showModalBottomSheet(context: context, builder: (context) => ShowTotBill(totbagcost: bagtotcost,));
                      // showModalBottomSheet(context: context, builder: (context) => showBill(bagtotcost));
                    },
                    color: Colors.cyan,
                    // minWidth: double.infinity,
                    minWidth: 150,
                    height: 50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Text("Bill Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    ),
                    ),
      
      
                    MaterialButton(
                    onPressed: (){},
                    color: Colors.cyan,
                    // minWidth: double.infinity,
                    minWidth: 150,
                    height: 50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Text("Proceed to Checkout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    ),
                    ),
      
      
                ],
              ),
            ),
            ]
            
      ),
    );
  }

  
  // Widget showBill(int totbagcost) =>
  // Column showBill(int totbagcost) {
  // @override
  // Widget showBill(int totbagcost) {
  //   print(totbagcost);
  //   bool value = false;
  //   // print(value);
  
  // return Column(
  //   children: [
  //     // Checkbox(value: true, onChanged: (value) => {}),

  //     Row(
  //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Text("Redeem Reward Points"),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Checkbox(value: value, onChanged: (value) {
  //             setState(() {
  //               value = value;
  //               print(value);
  //             });
  //           }),
  //         ),
  //       ],
  //     ),

  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Text("Bag Total"),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Text('\u{20B9} ${totbagcost}'),
  //         ),
  //       ],
  //     ),

  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Text("Rewards"),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Text('\u{20B9} 100'),
  //         ),
  //       ],
  //     ),


  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Text("Total Amount"),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Text('\u{20B9} 6900'),
  //         ),
  //       ],
  //     )
  //   ],
  // );
  // }
}