
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class RecipeCard extends StatefulWidget {
   const RecipeCard( {Key? key ,required this.id, required this.name, required this.img,required this.price }) : super(key: key);
   final String name;
   final String id;
  final String img;
  final String price;
  @override
  _RecipeCardState createState() => _RecipeCardState();
}
class _RecipeCardState extends State<RecipeCard> {
  String url="http://192.168.1.6:3000/cart/cart";
   int _quantity=1;
   addToCart()async{
     try{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     String token = sharedPreferences.getString("token");
     Map body = {"_id":widget.id,"quantity": _quantity,"token":token};
     var jsonResponse;
     String quantity=_quantity.toString();
     var res = await http.post(Uri.parse(url),body:{
     "_id":widget.id,
       "quantity":quantity,
       "token":token
     });


     if (res.statusCode == 200) {
       jsonResponse = json.decode(res.body);
       print("response status = ${res.statusCode}");
       print("response body = ${res.body}");
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text("votre commande est reçu"),
       ));
     }
     else{
       print("something is wrong");
     }


     print("response body = ${res.body}");
     print(res.statusCode);}
     catch(e) {
       print(e);
     }
   }
  @override
  Widget build(BuildContext context) {


    return Container(

      child: Card(
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




                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   IconButton(onPressed: ()=> setState(() {
                     _quantity++;
                   })
                   , icon:Icon( Icons.expand_less_outlined)),
                    Container(
                      decoration: ShapeDecoration(
                        color:Color.fromRGBO(212, 212, 212, 1.0),
                        shape: RoundedRectangleBorder (
                            borderRadius: BorderRadius.circular(32.0),
                        )
                        ),
                      width: 20,
                      height: 40,
                      //color: Color.fromRGBO(212, 212, 212, 1.0),
                      child:Center(

                          child:Text("${_quantity}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      ) ,
                    ),
                    IconButton(onPressed: ()=> setState(() {
                      if(_quantity>1){
                        _quantity--;
                      }
                     else {_quantity=1;}
                    }), icon:Icon( Icons.expand_more_outlined)),
                  ],
                ),
               Column(
                 mainAxisSize: MainAxisSize.max,

                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children:  <Widget> [
                 SizedBox(
                   width: 170,
                   height: 120,
                   child:
                       Flexible(
                           child: Center(child:Text(
                             widget.name ,
                             maxLines: 3,
                             overflow: TextOverflow.ellipsis,
                             softWrap: false,
                             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20 ),
                           ),
                           ),
                       )
                   ),
                   Text(widget.price+ " TND",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                 SizedBox(

                   width: 150,
                   child:FlatButton(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                     onPressed: addToCart,
                     color: Colors.black,
                     child: Row(
                       children: <Widget>[
                         Icon(Icons.add_shopping_cart_outlined,color: Colors.white,),
                          Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child:Text("Add to cart",style: TextStyle(color: Colors.white) ,

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
    );
  }
}
