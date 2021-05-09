import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluxstore/pages/signup-page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with AutomaticKeepAliveClientMixin {
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String username = '';
  String password = '';
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height - 100.0,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Fluxstore', style: TextStyle(fontSize: 25.0)),
                Padding(padding: EdgeInsets.only(top: 25.0)),
                TextFormField(
                  focusNode: usernameFocusNode,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelStyle: TextStyle(
                      color: usernameFocusNode.hasFocus
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    labelText: 'Username',
                  ),
                  validator: (val) {
                    return val.isEmpty ? 'This field cannot be blank' : null;
                  },
                  onSaved: (val) => username = val,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TextFormField(
                  focusNode: passwordFocusNode,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelStyle: TextStyle(
                      color: passwordFocusNode.hasFocus
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    labelText: 'Password',
                    suffix: GestureDetector(
                      child: Text('Reset'),
                      onTap: () => passwordController.text = '',
                    ),
                  ),
                  controller: passwordController,
                  onSaved: (val) => password = val,
                ),
                Padding(padding: EdgeInsets.only(top: 30.0)),
                TextButton(
                  child: Text('Sign In'),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 125.0, vertical: 12.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Divider()),
                    Padding(padding: EdgeInsets.only(right: 15.0)),
                    Text('OR'),
                    Padding(padding: EdgeInsets.only(right: 15.0)),
                    Expanded(child: Divider())
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.blue,
                      ),
                      width: 50.0,
                      height: 50.0,
                      child: Center(
                        child: Text(
                          'f',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.red,
                      ),
                      width: 50.0,
                      height: 50.0,
                      child: Center(
                        child: Text(
                          'G',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.blue,
                      ),
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 50.0)),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 17.0),
                    children: [
                      TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ),
                            );
                          },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
