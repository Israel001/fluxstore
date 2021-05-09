import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(top: 10.0)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for items',
                filled: true,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 3.0),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Padding(
              padding: EdgeInsets.only(right: 297.0),
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text('Filter'),
                onPressed: null,
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'History',
                  style: TextStyle(fontSize: 25.0),
                ),
                Text(
                  'Clear',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            ElevatedButton(
              onPressed: null,
              child: Text('men'),
              style: ButtonStyle(
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
