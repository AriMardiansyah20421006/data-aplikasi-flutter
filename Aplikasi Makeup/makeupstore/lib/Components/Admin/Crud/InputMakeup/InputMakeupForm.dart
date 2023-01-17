import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makeupstore/Api/configAPI.dart';
import 'package:makeupstore/Components/custom_surfix_icon.dart';
import 'package:makeupstore/Components/default_button_custome_color.dart';
import 'package:makeupstore/Screens/Admin/HomeAdminScreens.dart';
import 'package:makeupstore/Screens/Register/RegistrasiScreens.dart';
import 'package:makeupstore/Screens/User/HomeUserScreens.dart';
import 'package:makeupstore/size_config.dart';
import 'package:makeupstore/utils/constants.dart';
import 'dart:convert';

class FormInputMakeup extends StatefulWidget {
  @override
  _FormInputMakeup createState() => _FormInputMakeup();
}

class _FormInputMakeup extends State<FormInputMakeup> {
  TextEditingController txtNamaMakeup = TextEditingController(),
      txtTipeMakeup = TextEditingController(),
      txtHargaMakeup = TextEditingController(),
      txtMerekMakeup = TextEditingController();

  FocusNode focusNode = new FocusNode();
  File? image;
  Response? response;
  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loginProses();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildNamaMakeup(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTipeMakeup(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildHargaMakeup(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMerekMakeup(),
          SizedBox(height: getProportionateScreenHeight(30)),
          image == null
              ? Container()
              : Image.file(
                  image!,
                  // width: 250,
                  // height: 250,
                  fit: BoxFit.cover,
                ),
          TextButton(
              child: Text('Pilih Gambar Makeup Anda'),
              style: TextButton.styleFrom(
                primary: kColorTeal,
                // onPrimary: Colors.white,
                shadowColor: kPrimaryColor,
                elevation: 10,
              ),
              onPressed: () {
                pilihGambar();
              }),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "SUBMIT",
            press: () {
              if (txtNamaMakeup.text == '') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        title: 'Peringatan',
                        desc: 'Nama makeup tidak boleh kosong',
                        btnOkOnPress: () {})
                    .show();
              } else if (txtTipeMakeup.text == '') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        title: 'Peringatan',
                        desc: 'Tipe makeup tidak boleh kosong',
                        btnOkOnPress: () {})
                    .show();
              } else if (txtHargaMakeup.text == '') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        title: 'Peringatan',
                        desc: 'Harga makeup tidak boleh kosong',
                        btnOkOnPress: () {})
                    .show();
              } else if (txtMerekMakeup.text == '') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        title: 'Peringatan',
                        desc: 'Merek makeup tidak boleh kosong',
                        btnOkOnPress: () {})
                    .show();
              } else {
                inputDataMakeup(txtNamaMakeup.text, txtTipeMakeup.text,
                    txtHargaMakeup.text, txtMerekMakeup.text, image?.path);
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  TextFormField buildNamaMakeup() {
    return TextFormField(
      controller: txtNamaMakeup,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Nama makeup',
          hintText: 'Masukan Nama makeup',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
    );
  }

  TextFormField buildTipeMakeup() {
    return TextFormField(
      controller: txtTipeMakeup,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Tipe makeup',
          hintText: 'Masukan Tipe makeup',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
    );
  }

  TextFormField buildHargaMakeup() {
    return TextFormField(
      controller: txtHargaMakeup,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Harga makeup',
          hintText: 'Masukan Harga makeup',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
    );
  }

  TextFormField buildMerekMakeup() {
    return TextFormField(
      controller: txtMerekMakeup,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Merek makeup',
          hintText: 'Masukan Merek makeup',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
    );
  }

  Future pilihGambar() async {
    try {
      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print("Gagal mengambil foto : $e");
    }
  }

  void inputDataMakeup(nama, tipe, harga, merk, gambar) async {
    utilsApps.showDialog(context);
    bool status;
    var msg;
    try {
      var formData = FormData.fromMap({
        'nama': nama,
        'tipe': tipe,
        'harga': harga,
        'merk': merk,
        'gambar': await MultipartFile.fromFile(gambar)
      });

      response = await dio.post(inputbarang, data: formData);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan',
            desc: '$msg',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
              Navigator.pushNamed(context, HomeAdminScreens.routeName);
            }).show();
      } else {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan',
            desc: '$msg',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
            }).show();
      }
    } catch (e) {
      print(e);
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: 'Terjadi Kesalahan Pada Server Kami!!!!!!',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          }).show();
    }
  }
}
