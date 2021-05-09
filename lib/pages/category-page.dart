import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 5.0,
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/bags.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, .5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  child: Center(
                    child: Text(
                      'BAGS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 5.0,
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/clothing.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, .5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  child: Center(
                    child: Text(
                      'CLOTHING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 5.0,
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/men.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, .5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  child: Center(
                    child: Text(
                      'MEN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 5.0,
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/women.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, .5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 15.0,
                  height: 150,
                  child: Center(
                    child: Text(
                      'WOMEN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
