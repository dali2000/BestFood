import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/cart_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  List<Order> orders=[];
  double total=0.0;
  Future getCart() async {
    final String url="http://192.168.1.7:3000/cart/cart";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    var res = await http.get(url,headers: {"token":token});
    if(res.statusCode==200){
      var obj = json.decode(res.body);
      var cart=obj['cart'];
      print('cart');
      for(var i = 0; i < cart.length; i++ ){
        Order order =Order(cart[i]['_id'], cart[i]['order']['_id'], cart[i]['order']['name'], cart[i]['order']['price'], cart[i]['order']['img'],cart[i]['quantity']);

        orders.add(order);
        total+=cart[i]['quantity'] * double.parse(cart[i]['order']['price']);
      }
     // print("length"+orders.length.toString());
       //   print(cart[5]['quantity']);
      }
    return orders;
    }



  @override
  void initState() {
    print('hello cart page');
    getCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 400,
              child:RefreshIndicator(
                child: FutureBuilder(
                  future:getCart() ,
                  builder:(BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.data==null){
                      return Container(
                        child: Center(
                          child: Text("Loading ...",style: TextStyle(fontSize: 40),),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context,int index){
                        return ListTile(
                          title: CartPage(id:snapshot.data[index]._id ,
                            idOrder: snapshot.data[index]._idOrder,
                            img:snapshot.data[index].img ,
                            name:snapshot.data[index].name ,
                            price:snapshot.data[index].price ,
                            quantity: snapshot.data[index].quantity,
                          ),
                        );

                      },
                    );
                  } ,
                ),
                onRefresh: getCart,
              )

          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Row(
              children: [
                Text("Total :",style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 30)),
                Text(total.toString()+" \u1d40\u1d3a\u1d30",style: TextStyle(fontWeight: FontWeight.w900 ,fontSize: 30,color: Colors.orangeAccent)),
              ],
            ),
          ),
          FlatButton(
            onPressed: (){},
            child: Text("Buy",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              fontSize: 25
            ),
          ),
            color: Colors.deepOrangeAccent,
            minWidth: 300,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),),


        ],
      ),
    );}
}
class Order{
  final String _id;
  final String _idOrder;
  final  String name;
  final String price;
  final String img;
  final int quantity;

  Order(this._id, this._idOrder, this.name, this.price, this.img, this.quantity);



}
