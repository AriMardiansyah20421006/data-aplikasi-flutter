import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:makeupstore/size_config.dart';
import 'package:makeupstore/utils/constants.dart';

import 'FormUploadPembayaran.dart';

class UploadPembayaranComponent extends StatefulWidget {
  @override
  _UploadPembayaranComponent createState() => _UploadPembayaranComponent();
}

class _UploadPembayaranComponent extends State<UploadPembayaranComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upload Bukti !!!",
                          style: mTitleStyle,
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                FormUploadPembayaran()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
