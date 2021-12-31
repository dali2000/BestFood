import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/recipe_cart.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Food> foods=[];
  Future getMenu()async{
    final String url="http://192.168.1.7:3000/food/foods";
    var res = await http.get(url);
    if(res.statusCode==200){
      var food=[];
      var obj = json.decode(res.body);
      food=obj['food'];
      //print(food);
      for(var f in food){
        Food food = Food(f['_id'],f['name'],f['img'],f['price']);
        foods.add(food);
      }
      print(foods.length);
    }
    return foods;

  }
   @override
  void initState() {
    print('hello home');
    getMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Container(
          
            child:FutureBuilder(
              future:getMenu() ,
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
                      title: RecipeCard(id:snapshot.data[index]._id ,name:snapshot.data[index].name,img:snapshot.data[index].img,price:snapshot.data[index].price),
                    );
                  },
                );
              } ,
            )
        ),
    );}
}
class Food{
  final String _id;
  final String name;
  final String img;
  final String price;

  Food(this._id, this.name, this.img, this.price);

}
//RecipeCard(name: 'pizza',img: "https://kfc.com.tn/56351-large_default/maxi-meal.jpg",prix: "20 TND");