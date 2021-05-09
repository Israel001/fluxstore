import 'package:flutter/material.dart';
import 'package:fluxstore/pages/login-page.dart';
import 'package:fluxstore/pages/signup-page.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Settings'),
              background: Image.asset('assets/orange.jpg', fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(right: 30.0)),
                        Icon(Icons.person),
                        Padding(padding: EdgeInsets.only(right: 30.0)),
                        Expanded(
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 17.0),
                          ),
                          flex: 1,
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Divider(color: Colors.white),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(right: 30.0)),
                        Icon(Icons.person_add),
                        Padding(padding: EdgeInsets.only(right: 30.0)),
                        Expanded(
                          child: Text(
                            'Signup',
                            style: TextStyle(fontSize: 17.0),
                          ),
                          flex: 1,
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 50.0)),
                  Row(children: [
                    Text(
                      'General Setting',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ]),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 30.0)),
                      Icon(Icons.bedtime_outlined),
                      Padding(padding: EdgeInsets.only(right: 30.0)),
                      Expanded(
                        child: Text(
                          'Dark Theme',
                          style: TextStyle(fontSize: 17.0),
                        ),
                        flex: 1,
                      ),
                      Switch(
                        value: false,
                        onChanged: null,
                        activeColor: Colors.blue,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Divider(color: Colors.white),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 30.0)),
                      Icon(Icons.article_outlined),
                      Padding(padding: EdgeInsets.only(right: 30.0)),
                      Expanded(
                        child: Text(
                          'Privacy and Terms',
                          style: TextStyle(fontSize: 17.0),
                        ),
                        flex: 1,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Divider(color: Colors.white),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 30.0)),
                      Icon(Icons.info_outline),
                      Padding(padding: EdgeInsets.only(right: 30.0)),
                      Expanded(
                        child: Text(
                          'About Us',
                          style: TextStyle(fontSize: 17.0),
                        ),
                        flex: 1,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
