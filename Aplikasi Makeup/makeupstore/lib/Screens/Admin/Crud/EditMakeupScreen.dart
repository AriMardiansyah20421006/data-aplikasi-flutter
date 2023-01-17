import 'package:flutter/material.dart';
import 'package:makeupstore/size_config.dart';
import 'package:makeupstore/utils/constants.dart';

import '../../../Components/Admin/Crud/EditMakeup/EditMakeupComponent.dart';

class EditMakeupScreens extends StatelessWidget {
  static var routeName = '/edit_makeup_screens';
  static var dataMakeup;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dataMakeup = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          "Edit Data Makeup",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: EditMakeupComponent(),
    );
  }
}
