import 'package:flutter/material.dart';
import 'package:shopapp/Models/MealsProvider.dart';
import 'package:shopapp/Screens/MainScreen.dart';
import 'package:shopapp/Screens/AccountScreen.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Models/cart.dart';
import 'package:shopapp/Screens/CartScreen.dart';
import 'package:shopapp/Screens/MealDetailScreen.dart';
import 'package:shopapp/Models/orders.dart';
import 'package:shopapp/Screens/OrderScreen.dart';

Widget currentPage;
var pages = <Widget>[MainScreen(), CartScreen(), AccountScreen()];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        currentPage = pages[index];
      });
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            accentColor: Colors.deepOrange, primaryColor: Colors.deepOrange),
        home: Scaffold(
          body: currentPage == null ? MainScreen() : currentPage,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                      color: Color(0xFF2c2b2b),
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
                title: Text(
                  'Cart',
                  style: TextStyle(
                      color: Color(0xFF2c2b2b),
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.supervisor_account),
                title: Text(
                  'Account',
                  style: TextStyle(
                      color: Color(0xFF2c2b2b),
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black45,
            onTap: _onItemTapped,
          ),
        ),
        routes: {
          '/cart': (context) => CartScreen(),
          '/productdetails': (context) => ProductDetailsScreen(),
          '/orders': (context) => OrdersScreen(),
          '/account': (context) => AccountScreen(),
        },
      ),
    );
  }
}
