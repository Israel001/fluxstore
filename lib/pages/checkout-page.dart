import 'package:flutter/material.dart';
import 'package:fluxstore/config/big-variables.dart';
import 'package:fluxstore/widgets/cart-item.dart';
import 'package:fluxstore/helpers/utilities.dart';
import 'package:fluxstore/widgets/custom_expansion_tile.dart' as custom;

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController tabController;
  List<bool> tabsDisabledState = [false, false, true];
  final _formKey = GlobalKey<FormState>();
  List<Map> shippingMethods = [
    {'title': 'Free shipping', 'price': 0.00, 'value': 'freeShipping'},
    {'title': 'Flat rate', 'price': 20.00, 'value': 'flatRate'},
    {'title': 'Local pickup', 'price': 10.00, 'value': 'localPickup'}
  ];
  Map shippingMethod = {'value': 'freeShipping', 'index': 0};
  bool _isTileExpanded = false;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(vsync: this, length: tabsDisabledState.length);
    tabController.addListener(onTap);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  onTap() {
    if (tabsDisabledState[tabController.index]) {
      setState(() => tabController.index = tabController.previousIndex);
    }
    if (tabController.length != tabController.index + 1 &&
        !tabsDisabledState[tabController.index + 1]) {
      setState(() => tabsDisabledState[tabController.index + 1] = true);
    }
  }

  buildAddressPage() {
    return ListView(
      children: [
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: addressTextFields.map((field) {
              FocusNode focusNode = FocusNode();
              TextInputType keyboardType;
              switch (field['label']) {
                case 'Full Name':
                  keyboardType = TextInputType.name;
                  break;
                case 'Phone Number':
                  keyboardType = TextInputType.phone;
                  break;
                case 'Email Address':
                  keyboardType = TextInputType.emailAddress;
                  break;
                case 'Address':
                  keyboardType = TextInputType.streetAddress;
                  break;
                case 'Zip Code':
                  keyboardType = TextInputType.number;
                  break;
                default:
                  keyboardType = TextInputType.text;
              }
              return TextFormField(
                focusNode: focusNode,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelStyle: TextStyle(
                    color: focusNode.hasFocus ? Colors.blue : Colors.grey,
                  ),
                  labelText: field['label'],
                ),
                validator: field['validator'],
                onSaved: (val) => field['value'] = val,
              );
            }).toList(),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        TextButton(
          child: Text('CONTINUE TO SHIPPING'),
          onPressed: () {
            final form = _formKey.currentState;
            if (form.validate()) {
              form.save();
              setState(() {
                tabsDisabledState[tabController.index + 1] = false;
                tabController.index = tabController.index + 1;
              });
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ],
    );
  }

  buildShippingPage() {
    return ListView(
      children: [
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Text('Shipping Method'),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Column(
            children: shippingMethods.mapIndexed((method, index) {
          return Column(children: [
            RadioListTile(
              title: Text(
                method['title'],
              ),
              subtitle: Text(
                '\$${method['price']}',
              ),
              value: method['value'],
              groupValue: shippingMethod,
              onChanged: (value) {
                setState(() {
                  shippingMethod['value'] = value;
                  shippingMethod['index'] = index;
                });
              },
              selectedTileColor: Colors.grey,
              selected: shippingMethod['value'] == method['value'],
              activeColor: Colors.white,
            ),
            Divider()
          ]);
        }).toList()),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        TextButton(
          child: Text('CONTINUE TO PREVIEW'),
          onPressed: () {
            setState(() {
              tabsDisabledState[tabController.index + 1] = false;
              tabController.index = tabController.index + 1;
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                tabController.index = tabController.index - 1;
              });
            },
            child: Text(
              'Go back to address',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        )
      ],
    );
  }

  buildPreviewPage() {
    return ListView(
      children: [
        Padding(padding: EdgeInsets.only(top: 15.0)),
        custom.ExpansionTile(
          headerBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          iconColor: Colors.white,
          trailing: Icon(
            _isTileExpanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
          onExpansionChanged: (isExpanded) =>
              setState(() => _isTileExpanded = isExpanded),
          key: PageStorageKey(''),
          title: Text(
            'Shipping Address',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          children: addressTextFields.map((field) {
            return ListTile(
              title: Row(
                children: [
                  Expanded(child: Text('${field['label']}:'), flex: 4),
                  Expanded(child: Text(field['value']), flex: 6)
                ],
              ),
            );
          }).toList(),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Text(
          'Order details',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Column(
            children: cartItems.map((cartItem) {
          return buildCartItem(
            cartItem,
            null,
            null,
            null,
            isLocked: true,
          );
        }).toList()),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Subtotal',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
              Text(
                '\$${cartItems.fold({
                  'price': 0,
                  'quantity': 0
                }, (prev, cur) => prev['price'] + cur['price'] * cur['quantity'])}',
                style: TextStyle(
                  fontSize: 13.0,
                ),
              )
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Expanded(
                child: Text(shippingMethods[shippingMethod['index']]['title']),
              ),
              Text('\$${shippingMethods[shippingMethod['index']]['price']}')
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
              Text(
                '\$${cartItems.fold({
                      'price': 0,
                      'quantity': 0
                    }, (prev, cur) => prev['price'] + cur['price'] * cur['quantity']) + shippingMethods[shippingMethod['index']]['price']}',
                style: TextStyle(
                  fontSize: 23.0,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        TextButton(
          child: Text('PLACE MY ORDER'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Order confirmation'),
                  content: Text(
                    'Your order has been placed successfully. You can keep track of the order status by checking your email or logging in and checking the orders page under your profile.',
                  ),
                  actions: [
                    GestureDetector(
                      child: Text('Close'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                tabController.index = tabController.index - 1;
              });
            },
            child: Text(
              'Go back to shipping',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        )
      ],
    );
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'ADDRESS',
                    style: TextStyle(fontSize: 12.9),
                  ),
                ),
                Tab(
                  child: Text(
                    'SHIPPING',
                    style: TextStyle(fontSize: 12.9),
                  ),
                ),
                Tab(
                  child: Text(
                    'PREVIEW',
                    style: TextStyle(fontSize: 12.9),
                  ),
                ),
              ],
              indicatorColor: Colors.blue,
              controller: tabController,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  buildAddressPage(),
                  buildShippingPage(),
                  buildPreviewPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
