import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key,required this.id,required this.idOrder,required this.name,required this.img,required this.quantity,required this.price}) : super(key: key);
  final String id,idOrder,name,img,price;
  final int quantity;

  @override
  _CartPageState createState() => _CartPageState();

}

class _CartPageState extends State<CartPage> {
   String name="",img="",price="";
   sum(int a, int b){
     print(a*b);
     return a*b;
   }
   String url="http://192.168.1.4:3000/cart/cart";

   deleteOrder() async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     String token = sharedPreferences.getString("token");
     var res = await http.delete(Uri.parse(url),headers:{"token":token,"_id": widget.id });
     if (res.statusCode == 200) {
       var jsonResponse = json.decode(res.body);
       print("response status = ${res.statusCode}");
       print("response body = ${res.body}");
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text("Ordre supprimé"),
       ));

     }
     else{
       print("something is wrong");
     }

   }
  @override
  Widget build(BuildContext context) {

    return Container(

      child:Column
        (
        children:<Widget> [
          Card(
            child: InkWell(
              splashColor: Colors.deepOrange,
              onTap: () {
                //debugPrint(widget.id +"/ qte ${_quantity}" );
              },
              child:  SizedBox(

                // width: MediaQuery.of(context).size.width,
                // height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child:Image.network(widget.img,
                        height: 100,
                        width: 120,
                        alignment: Alignment.topCenter
                        ,fit: BoxFit.cover,
                        errorBuilder: (context, exception, stackTrack) => Icon(Icons.not_interested_outlined,size: 70,),

                      ),),




                    /*Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(

                          decoration: ShapeDecoration(
                              color:Color.fromRGBO(212, 212, 212, 1.0),
                              shape: RoundedRectangleBorder (
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                          width: 50,
                          height: 40,
                          alignment: Alignment.center,
                          //color: Color.fromRGBO(212, 212, 212, 1.0),
                          child:

                          Center(

                              child:Text(" x "+widget.quantity.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                          ) ,
                        ),
                      ],
                    )*/
                    Column(
                      mainAxisSize: MainAxisSize.max,

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  <Widget> [
                        SizedBox(
                            width: 170,
                            height: 120,
                            child:
                            Expanded(
                              child: Text(
                                widget.name ,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20 ),

                              ),
                            )
                        ),
                        Text(double.parse(widget.price).toString()+ " TND",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(

                          width: 150,
                          child:FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onPressed:deleteOrder,
                            color: Colors.red,
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.cancel_outlined,color: Colors.white,),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child:Text("Cancel ",style: TextStyle(color: Colors.white) ,

                                    )
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
