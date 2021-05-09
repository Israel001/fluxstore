import 'package:flutter/material.dart';

Widget buildCartItem(
    dynamic cartItem, Function itemRemover, Function qtyIncreaser, Function qtyReducer,
    {isLocked = false}) {
  return Padding(
    padding: EdgeInsets.only(top: 10.0),
    child: Column(
      children: [
        Row(
          children: [
            isLocked
                ? Text('')
                : IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: itemRemover,
                  ),
            Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.only(right: 15.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage(cartItem['image']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem['name'],
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Text('\$${cartItem['price']}'),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isLocked
                          ? Text('')
                          : GestureDetector(
                              child: Icon(Icons.add),
                              onTap: () {
                                if (cartItem['quantity'] + 1 <=
                                    cartItem['maxQuantity']) qtyIncreaser();
                              },
                            ),
                      Text('${cartItem['quantity']}'),
                      isLocked
                          ? Text('')
                          : GestureDetector(
                              child: Icon(Icons.remove),
                              onTap: () {
                                if (cartItem['quantity'] - 1 > 0) qtyReducer();
                              },
                            ),
                    ],
                  ),
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Divider(),
      ],
    ),
  );
}
