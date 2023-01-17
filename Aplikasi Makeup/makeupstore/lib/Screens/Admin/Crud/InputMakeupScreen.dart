import 'package:flutter/material.dart';
import 'package:makeupstore/Components/Admin/Crud/InputMakeup/InputMakeupComponent.dart';
import 'package:makeupstore/utils/constants.dart';

class InputMakeupScreens extends StatelessWidget {
  static var routeName = '/input_makeup_screens';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Input Data Makeup",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: InputMakeupComponent(),
    );
  }
}
