import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:makeupstore/Screens/Login/LoginScreens.dart';
import 'package:makeupstore/size_config.dart';
import 'package:makeupstore/utils/constants.dart';

import '../../Components/User/HomeUserComponents.dart';

class HomeUserScreen extends StatelessWidget {
  static String routeName = "/home_user";
  static var dataUserLogin;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dataUserLogin = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "MakeupStore",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          Icons.home,
          color: mTitleColor,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              //Navigator.pushNamed(context, DataMakeupScreens.routeName);
            },
            child: Icon(
              Icons.person,
              color: mTitleColor,
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: HomeUserComponent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.INFO,
              animType: AnimType.RIGHSLIDE,
              title: 'Peringatan',
              desc: 'Yakin ingin keluar dari aplikasi ? ....',
              btnCancelOnPress: () {},
              btnCancelText: 'Tidak',
              btnOkText: 'Yakin',
              btnOkOnPress: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              }).show();
        },
        backgroundColor: kColorRedSlow,
        child: Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}
