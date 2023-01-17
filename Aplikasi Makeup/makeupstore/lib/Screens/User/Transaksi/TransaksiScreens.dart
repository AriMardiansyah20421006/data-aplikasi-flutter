import 'package:flutter/material.dart';
import 'package:makeupstore/size_config.dart';
import 'package:makeupstore/utils/constants.dart';

import '../../../Components/User/Transaksi/CreateTransaksi/TransaksiComponents.dart';

class TransaksiScreens extends StatelessWidget {
  static var routeName = '/form_transaksi_screens';
  static var dataMakeup;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dataMakeup = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Menu Transaksi",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: TransaksiComponent(),
    );
  }
}
