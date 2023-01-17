import 'package:flutter/material.dart';
import 'package:makeupstore/size_config.dart';
import 'package:makeupstore/utils/constants.dart';

import '../../../Components/User/Makeup/MakeupComponents.dart';

class DataMakeupScreens extends StatelessWidget {
  static var routeName = '/list_makeup_user_screens';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Daftar Makeup",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: MakeupComponents(),
    );
  }
}
