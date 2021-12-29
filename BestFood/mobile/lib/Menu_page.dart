import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  getMenu()async{
    final String url="http://192.168.1.6:3000/food/foods";
    var res = await http.get(url);
    if(res.statusCode==200){
      var food=[];
      var obj = json.decode(res.body);
      food=obj['food'];
      print(food);
    return obj;
    }}
   @override
  void initState() {
    print('hello home');
    getMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Text("menu",style: TextStyle(fontSize: 41,color: Colors.deepOrangeAccent),),
    ),);

  }
}
