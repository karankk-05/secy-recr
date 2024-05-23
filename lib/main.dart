import 'dart:math';

import 'package:campus_ebay/pages/homepage.dart';
import 'package:campus_ebay/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'pages/loginpage.dart';
import 'colors_decorations/appcolors.dart';
import 'pages/mainpage.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'models/product.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:flutter/foundation.dart';

import 'dart:io' show Platform;

// Define kIsWeb constant if it's not available
const bool kIsWeb = identical(0, 0.0);

void main() {
  if (kIsWeb) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),

      ],
      child: MyApp(),
    ),
  );}
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mail Client',
      theme: appthemes.lighttheme,
      darkTheme: appthemes.darktheme,
      themeMode: ThemeMode.dark,
      home: loginpage(),
    );
  }
}

