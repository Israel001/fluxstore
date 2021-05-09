import 'package:flutter/material.dart';
import 'package:fluxstore/config/big-variables.dart';
import 'package:fluxstore/pages/checkout-page.dart';
import 'package:fluxstore/pages/home.dart';
import 'package:fluxstore/widgets/cart-item.dart';
import 'package:fluxstore/helpers/utilities.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with AutomaticKeepAliveClientMixin {
  buildCartPage() {
    if (cartItems.length > 0) {
      return ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    children: [
                      TextSpan(text: 'TOTAL '),
                      TextSpan(text: '${cartItems.length} items')
                    ],
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'CLEAR CART',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    setState(() => cartItems = []);
                  },
                ),
              ],
            ),
          ),
          Column(
              children: cartItems.mapIndexed((cartItem, i) {
            return buildCartItem(
              cartItem,
              () => setState(() => cartItems.removeAt(i)),
              () => setState(() => cartItem['quantity'] += 1),
              () => setState(() => cartItem['quantity'] -= 1),
            );
          }).toList()),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'SubTotal: \$${cartItems.fold({
                    'price': 0,
                    'quantity': 0
                  }, (prev, cur) => prev['price'] + cur['price'] * cur['quantity'])}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
          ),
        ],
      );
    } else {
      return ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 200,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your bag is empty'),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(
                  "Looks like you haven't added any items to the bag yet. Start shopping to fill it in.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: buildCartPage(),
      floatingActionButton: ElevatedButton.icon(
        icon: Icon(
          cartItems.length > 0 ? Icons.credit_card_outlined : Icons.shop,
          color: Colors.white,
        ),
        label: Text(
          cartItems.length > 0 ? 'CHECKOUT' : 'START SHOPPING',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          if (cartItems.length > 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutPage(),
              ),
            );
          } else {
            pageController.jumpToPage(0);
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          elevation: MaterialStateProperty.all<double>(10.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
