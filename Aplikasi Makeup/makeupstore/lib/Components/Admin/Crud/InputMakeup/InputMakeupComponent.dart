import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:makeupstore/Components/Admin/Crud/InputMakeup/InputMakeupForm.dart';
import 'package:makeupstore/Components/Login/LoginForm.dart';
import 'package:makeupstore/size_config.dart';
import 'package:makeupstore/utils/constants.dart';

class InputMakeupComponent extends StatefulWidget {
  @override
  _InputMakeupComponent createState() => _InputMakeupComponent();
}

class _InputMakeupComponent extends State<InputMakeupComponent> {
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
                          "Input Data makeup !",
                          style: mTitleStyle,
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                FormInputMakeup()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
