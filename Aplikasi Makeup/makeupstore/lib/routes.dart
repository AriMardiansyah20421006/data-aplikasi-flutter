import 'package:flutter/material.dart';
import 'package:makeupstore/Screens/Admin/Crud/EditMakeupScreen.dart';
import 'package:makeupstore/Screens/Admin/Crud/InputMakeupScreen.dart';
import 'package:makeupstore/Screens/Admin/HomeAdminScreens.dart';
import 'package:makeupstore/Screens/Register/RegistrasiScreens.dart';
import 'package:makeupstore/Screens/Login/LoginScreens.dart';
import 'package:makeupstore/Screens/User/Makeup/DataMakeupScreens.dart';
import 'package:makeupstore/Screens/User/HomeUserScreens.dart';

import 'Screens/User/Transaksi/DataTransaksiUser.dart';
import 'Screens/User/Transaksi/TransaksiScreens.dart';
import 'Screens/User/Transaksi/UploadBuktiBayar.dart';

final Map<String, WidgetBuilder> routes = {
  // Login registrasi
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),

  //routes user biasa
  HomeUserScreen.routeName: (context) => HomeUserScreen(),
  DataMakeupScreens.routeName: (context) => DataMakeupScreens(),
  TransaksiScreens.routeName: (context) => TransaksiScreens(),
  DataTransaksiScreens.routeName: (context) => DataTransaksiScreens(),
  UploadBuktiPembayaranScreens.routeName: (context) =>
      UploadBuktiPembayaranScreens(),

  //routes admin
  HomeAdminScreens.routeName: (context) => HomeAdminScreens(),
  InputMakeupScreens.routeName: (context) => InputMakeupScreens(),
  EditMakeupScreens.routeName: (context) => EditMakeupScreens(),
};
