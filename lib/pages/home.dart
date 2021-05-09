import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluxstore/pages/cart-page.dart';
import 'package:fluxstore/pages/category-page.dart';
import 'package:fluxstore/pages/landing-page.dart';
import 'package:fluxstore/pages/login-page.dart';
import 'package:fluxstore/pages/search-page.dart';
import 'package:fluxstore/pages/signup-page.dart';
import 'package:fluxstore/pages/user-page.dart';
import 'package:fluxstore/helpers/utilities.dart';
import 'package:fluxstore/widgets/custom_expansion_tile.dart' as custom;

PageController pageController = PageController();

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _pageIndex = 0;
  bool hideDrawerDividers = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              child: Text('Fluxstore', style: TextStyle(fontSize: 25.0)),
              padding: EdgeInsets.all(15.0),
            ),
            Divider(),
            GestureDetector(
              onTap: () => pageController.jumpToPage(0),
              child: Padding(
                child: Row(
                  children: [
                    Padding(
                      child: Icon(Icons.shop),
                      padding: EdgeInsets.only(right: 30.0),
                    ),
                    Text('Shop')
                  ],
                ),
                padding: EdgeInsets.all(15.0),
              ),
            ),
            GestureDetector(
              onTap: () => pageController.jumpToPage(1),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Padding(
                      child: Icon(Icons.category),
                      padding: EdgeInsets.only(right: 30.0),
                    ),
                    Text('Categories')
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => pageController.jumpToPage(3),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Padding(
                      child: Icon(Icons.shopping_bag),
                      padding: EdgeInsets.only(right: 30.0),
                    ),
                    Text('Cart')
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => pageController.jumpToPage(4),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Padding(
                      child: Icon(Icons.person),
                      padding: EdgeInsets.only(right: 30.0),
                    ),
                    Text('Settings')
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Padding(
                      child: Icon(Icons.login),
                      padding: EdgeInsets.only(right: 30.0),
                    ),
                    Text('Login')
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Padding(
                      child: Icon(Icons.person_add),
                      padding: EdgeInsets.only(right: 30.0),
                    ),
                    Text('Signup')
                  ],
                ),
              ),
            ),
            hideDrawerDividers ? Text('') : Divider(),
            custom.ExpansionTile(
              headerBackgroundColor: Colors.transparent,
              key: PageStorageKey(''),
              title: Text('BY CATEGORY', style: TextStyle(color: Colors.white)),
              children: [0, 1, 2, 3].mapIndexed((c, i) {
                return ListTile(
                  title: Text('BAGS'),
                  trailing: Text(
                    '$i items',
                    style: TextStyle(color: Colors.blue),
                  ),
                  tileColor: i % 2 != 0 ? Colors.grey : Colors.transparent,
                );
              }).toList(),
              onExpansionChanged: (v) => setState(() => hideDrawerDividers = !hideDrawerDividers),
              initiallyExpanded: true,
            ),
            hideDrawerDividers ? Text('') : Divider()
          ],
        ),
      ),
      body: PageView(
        children: [
          LandingPage(),
          CategoryPage(),
          SearchPage(),
          CartPage(),
          UserPage()
        ],
        controller: pageController,
        onPageChanged: (int pageIndex) {
          setState(() => _pageIndex = pageIndex);
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _pageIndex,
        onTap: (int pageIndex) {
          pageController.animateToPage(
            pageIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        activeColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.category)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag)),
          BottomNavigationBarItem(icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
