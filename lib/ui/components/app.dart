
import 'package:flutter/material.dart';

import 'package:fordev/ui/pages/pages.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final primaryColor = Color.fromRGBO(136, 14, 79, 1);
    final primaryColorDark = Color.fromRGBO(96, 0, 39, 1);
    final primaryColorLight = Color.fromRGBO(188, 71, 123, 1);


    return  MaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primaryColor: primaryColor, 
        primaryColorDark: primaryColorDark, 
        primaryColorLight: primaryColorLight,
        secondaryHeaderColor: primaryColor, 
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 30, 
            fontWeight: FontWeight.bold, 
            color: primaryColorDark
          ), 
        ), 
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide( color: primaryColor )
          ), 
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide( color: primaryColor )
          ), 
          alignLabelWithHint: true
        ),
        
      ),
      home: LoginPage(),
    );
  }
}