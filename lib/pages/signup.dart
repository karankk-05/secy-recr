import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../colors_decorations/appcolors.dart';
import '../colors_decorations/decorations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'mainpage.dart';
import '../models/user.dart';

class signuppage extends StatefulWidget {
  @override
  _signuppageState createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _email(BuildContext context) {
    mydeco.context = context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'IITK Email',
          style: kLabelStyle,
        ).animate(),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: mydeco.deco(),
          height: 60.0,
          child: TextField(
            controller: _emailController,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your IITK Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _Password(BuildContext context) {
    mydeco.context = context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: mydeco.deco(),
          height: 60.0,
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _Conf_Password(BuildContext context) {
    mydeco.context = context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: mydeco.deco(),
          height: 60.0,
          child: TextField(
            controller: _confirmPasswordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Confirm your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _RegBtn(BuildContext context) {
    mytext.context = context;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final email = _emailController.text.trim();
          final password = _passwordController.text.trim();
          final confirmPassword = _confirmPasswordController.text.trim();

          if (password != confirmPassword) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Passwords do not match",style: mytext.headingtext1(fontSize: 15),),
              backgroundColor:Theme.of(context).colorScheme.primaryContainer ,),
            );
            return;
          }

          Provider.of<UserProvider>(context, listen: false).updateUser(
          email: email,             
          password: password,
              
            
          );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(100, 60)),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        child: Text(
          'REGISTER',
          style: mytext.headingbold(fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    mytext.context = context;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(gradient: gradients.login),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Transform.scale(
                      scale: 2.5,
                      child: Image.asset('assets/logo_star.png',
                          height: 100, width: 50),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Join The Community Now',
                      style: mytext.headingbold(fontSize: 30),
                    ),
                    Expanded(child: SizedBox()),
                    _email(context),
                    SizedBox(height: 30.0),
                    _Password(context),
                    SizedBox(height: 30.0),
                    _Conf_Password(context),
                    _RegBtn(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
