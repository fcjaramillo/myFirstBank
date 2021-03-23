import 'package:flutter/material.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';

extension ShowSnackbar on BuildContext {

  void showSnackbar({String message, int duration}){

    Scaffold.of(this).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.warning,
                color: MFBColors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(message),
            ],
          ),
          backgroundColor: MFBColors.red,
          duration: Duration(seconds: duration),
        )
    );
  }
}