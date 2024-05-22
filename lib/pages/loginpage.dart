import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../colors_decorations/appcolors.dart';
import '../colors_decorations/decorations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'mainpage.dart';
import '../pages/signup.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool? _rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _email() {
    final userProvider = Provider.of<UserProvider>(context);
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
            controller: _emailController,
          ),
        ),
      ],
    );
  }

  Widget _Password() {
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
            controller: _passwordController,
          ),
        ),
      ],
    );
  }

  void _login() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    // Here you can handle the login logic, for example by using the UserProvider
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.updateUser(email: email, password: password);

    // Print or handle the email and password as needed
    print('Email: $email');
    print('Password: $password');
  }
  Widget _ForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: (null),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _RememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: Theme.of(context),
            child: Checkbox(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              }, // Or provide a callback function for onChanged
              checkColor: Colors.green,
              activeColor: Colors.white,
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _LoginBtn() {
    mytext.context = context;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _login();
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
          );
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(100, 60)),
          backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.primaryContainer),
        ),
        child: Text('LOGIN', style: mytext.headingbold(fontSize: 18)),
      ),
    );
  }

  Widget _SignupBtn() {
    return GestureDetector(
      onTap: () {
        (Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => signuppage(),
          ),
        ));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'New To Campus Ebay? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
        Center(
           child: Image.asset('assets/logo.png', height: 100, width: 50)
               .animate()
               .scale(begin:Offset(0,0) ,
               end: Offset(8, 8
               ),curve:Cubic(0.5, 0, 0, 1),
               duration:2000.milliseconds).fadeOut(delay: 2500.milliseconds,duration: 500.milliseconds),
         ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Center(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Transform.scale(
                    scale: 2.5,
                    child: Image.asset('assets/logo_star.png',
                        height: 100, width: 50))
                 .animate()
                 .fadeIn(delay: 2600.milliseconds,)
                ,
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Join The Community Now',
                  style: mytext.headingbold(fontSize: 30),
                ),
                Expanded(child: SizedBox()),
                _email(),
                SizedBox(
                  height: 30.0,
                ),
                _Password(),
                _ForgotPasswordBtn(),
                _RememberMeCheckbox(),
                _LoginBtn(),
                _SignupBtn()
              ],
            ),
          ) .animate().fadeIn(delay: 2600.milliseconds),
              ),
        )
      ],
    ));
  }
}
