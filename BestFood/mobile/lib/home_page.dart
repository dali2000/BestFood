import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Menu_page.dart';
import 'package:mobile/basket_page.dart';
import 'package:mobile/cart_page.dart';
import 'package:mobile/custom_animated_bottom_bar.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/profile_page.dart';
import 'package:mobile/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _inactiveColor = Colors.grey;
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                child: Image.asset("lib/assets/images/logo.png",height: 50,fit: BoxFit.cover,)
              ),
              Text('Best',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25) ,),
              Text('Food',style:TextStyle(color: Colors.deepOrange,fontSize: 25,fontWeight: FontWeight.w400) ,)
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: getBody(),
        bottomNavigationBar: _buildBottomBar()
    );

}
  Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[

        BottomNavyBarItem(
          icon: Icon(Icons.account_circle_outlined),
          title: Text(
            'Profile ',
          ),
          activeColor: Colors.deepOrangeAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text('Home '),
          activeColor: Colors.deepOrangeAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          title: Text('Cart'),
          activeColor: Colors.deepOrangeAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }


  Widget getBody() {
    List<Widget> pages = [
      ProfilePage(),
      MenuPage(),
      BasketPage(),
      //CartPage(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }


}
