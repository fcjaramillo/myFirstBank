import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';



class AppTheme{

  static final textTheme = TextTheme(
      bodyText1: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff212121)
          )
      )
  );

  static ThemeData build() => ThemeData(
    //appBarTheme: , agregar color
      primaryColor:  MFBColors.blue,
      primaryColorDark: MFBColors.blueDark,
      accentColor: MFBColors.blueAccent,
      backgroundColor: MFBColors.white,
      brightness: Brightness.light,

      textTheme: GoogleFonts.robotoTextTheme().copyWith(
          bodyText2: textTheme.bodyText1.copyWith(
              fontSize: 12
          )
      )
  );
}

extension GFilesAttributes on TextTheme{

  TextStyle get bodyTextSmall => bodyText1.copyWith(fontSize: 12);
  TextStyle get titleWhite => bodyText1.copyWith(
      color: MFBColors.white,
      fontSize: 45,
      fontWeight: FontWeight.bold
  );
  TextStyle get titleBlack => bodyText1.copyWith(
      color: MFBColors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold
  );
  TextStyle get titleGray  => bodyText1.copyWith(
      color: MFBColors.gray,
      fontSize: 16
  );
  TextStyle get titleBlue  => bodyText1.copyWith(
      color: MFBColors.blue,
      fontSize: 32
  );
  TextStyle get subtitleBlack => bodyText1.copyWith(
      color: MFBColors.black,
      fontSize: 16
  );
  TextStyle get textDetail => bodyText1.copyWith(
      color: MFBColors.black,
      fontSize: 12
  );
  TextStyle get grayDetail => bodyText1.copyWith(
      color: MFBColors.gray,
      fontSize: 12
  );
  TextStyle get blueDetail => bodyText1.copyWith(
      color: MFBColors.blue,
      fontSize: 14
  );
  TextStyle get textButtomWhite => bodyText1.copyWith(
      color: MFBColors.white,
      fontSize: 14,
      fontWeight: FontWeight.w600
  );
  TextStyle get textButtomBlue => bodyText1.copyWith(
      color: MFBColors.blue,
      fontSize: 14,
      fontWeight: FontWeight.w600
  );

}