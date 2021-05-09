import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
        title: Text('Fluxstore'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [0, 1, 2, 3, 4].map((int a) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/tshirt-2.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    width: 50.0,
                    height: 50.0,
                  ),
                  Text('Men')
                ],
              );
            }).toList(),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Image.asset("assets/christmas-sale.gif"),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Products of the day',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'See all products',
                  style: TextStyle(color: Colors.blue[600]),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          CarouselSlider.builder(
            options: CarouselOptions(
              enlargeCenterPage: false,
              viewportFraction: 1,
              height: 380.0,
              enableInfiniteScroll: false,
            ),
            itemCount: ([0].length / 2).round(),
            itemBuilder: (context, index, realIdx) {
              final int first = index * 2;
              final int second = first == [0].length - 1 ? null : first + 1;
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [first, second].map((idx) {
                  return idx != null
                      ? Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 200.0,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: DecorationImage(
                                      image: AssetImage("assets/prod-img.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                Text('T-Shirt with Next Stop'),
                                Text(
                                  '\$60.00',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  'In stock',
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                        )
                      : Text('');
                }).toList(),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Collections',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'See all products',
                  style: TextStyle(color: Colors.blue[600]),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          CarouselSlider.builder(
            options: CarouselOptions(
              enlargeCenterPage: false,
              viewportFraction: 1,
              height: 380.0,
              enableInfiniteScroll: false,
            ),
            itemCount: ([0].length / 2).round(),
            itemBuilder: (context, index, realIdx) {
              final int first = index * 2;
              final int second = first == [0].length - 1 ? null : first + 1;
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [first, second].map((idx) {
                  return idx != null
                      ? Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 200.0,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: DecorationImage(
                                      image: AssetImage("assets/prod-img.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                Text('T-Shirt with Next Stop'),
                                Text(
                                  '\$60.00',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  'In stock',
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                        )
                      : Text('');
                }).toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
