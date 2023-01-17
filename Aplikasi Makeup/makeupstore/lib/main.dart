import 'package:flutter/material.dart';
import 'package:makeupstore/Screens/Login/LoginScreens.dart';
import 'package:makeupstore/routes.dart';
import 'package:makeupstore/theme.dart';

void main() async {
  runApp(MaterialApp(
      title: "Toko Makeup Kecantikan",
      theme: theme(),
      initialRoute: LoginScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: routes));
}
