import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluxstore/config/big-variables.dart';
import 'package:fluxstore/pages/login-page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with AutomaticKeepAliveClientMixin {
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String fullName = '';
  String email = '';
  String password = '';
  bool shouldShowPassword = false;
  bool isPrivacyTermChecked = false;
  final _formKey = GlobalKey<FormState>();

  bool get wantKeepAlive => true;

  @override
  Widget build(context) {
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
                  focusNode: fullNameFocusNode,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelStyle: TextStyle(
                      color: fullNameFocusNode.hasFocus
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    labelText: 'Full Name',
                  ),
                  validator: addressTextFields[0]['validator'],
                  onSaved: (val) => fullName = val,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TextFormField(
                  focusNode: emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelStyle: TextStyle(
                      color:
                          emailFocusNode.hasFocus ? Colors.blue : Colors.grey,
                    ),
                    labelText: 'Email',
                  ),
                  validator: addressTextFields[2]['validator'],
                  onSaved: (val) => email = val,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TextFormField(
                  focusNode: passwordFocusNode,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !shouldShowPassword,
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
                      child: Icon(
                        shouldShowPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () => setState(
                          () => shouldShowPassword = !shouldShowPassword),
                    ),
                  ),
                  onSaved: (val) => password = val,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                CheckboxListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: 'I agree with '),
                      TextSpan(
                        text: 'Privacy and Terms',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ]),
                  ),
                  value: isPrivacyTermChecked,
                  onChanged: (val) =>
                      setState(() => isPrivacyTermChecked = val),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.blue,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                TextButton(
                  child: Text('Create an account'),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 100.0, vertical: 12.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 50.0)),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 17.0),
                    children: [
                      TextSpan(text: "Have an account? "),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
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
