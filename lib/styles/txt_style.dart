import 'package:flutter/material.dart';

import 'my_color.dart';




class FigmaTextStyles {
  const FigmaTextStyles();

  static const String fontFamily= "NanumSquareNeo";

  static const TextStyle title40 = TextStyle(
      fontSize: 40,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w100,
      letterSpacing: 0,
      fontFamily: fontFamily,
      color: MyColor.kAccent1
  );

  static const TextStyle title34 = TextStyle(
      fontSize: 34,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w200,
      letterSpacing: 0,
      fontFamily: fontFamily,
      color: MyColor.kAccent2
  );

  static const TextStyle title30 = TextStyle(
      fontSize: 30,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w100,
      letterSpacing: 0,
      fontFamily: fontFamily,
      color: MyColor.kAccent2
  );

  static const TextStyle title20 = TextStyle(
    fontSize: 20,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: MyColor.kAccent1
  );

  static const TextStyle title26 = TextStyle(
      fontSize: 26,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
      fontFamily: fontFamily,
      color: MyColor.kAccent1
  );

  static const TextStyle content8= TextStyle(
    fontSize: 8,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    fontFamily: fontFamily
  );

  static const TextStyle content10= TextStyle(
      fontSize: 10,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      fontFamily: fontFamily,
      color: MyColor.kAccent2
  );

  static const TextStyle content12= TextStyle(
      fontSize: 12,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      fontFamily: fontFamily,
      color: MyColor.kAccent2
  );

  static const TextStyle content14= TextStyle(
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
      fontFamily: fontFamily
  );

  static const TextStyle content16= TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
      fontFamily: fontFamily
  );



  TextStyle get textDescription => const TextStyle(
    fontSize: 10,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    height: 10 / 10,
    letterSpacing: 0,
    fontFamily: fontFamily
  );

  TextStyle get textMenu => const TextStyle(
    fontSize: 15,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    height: 15 / 15,
    letterSpacing: 0,
    fontFamily: fontFamily
  );

  TextStyle get textTitleBig => const TextStyle(
    fontSize: 38,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 38 / 38,
    letterSpacing: 0,
    fontFamily: fontFamily
  );

  TextStyle get textTitleSmall => const TextStyle(
    fontSize: 20,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 20 / 20,
    letterSpacing: 0,
    fontFamily: fontFamily
  );

  TextStyle get textTitleModerate => const TextStyle(
    fontSize: 25,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 25 / 25,
    letterSpacing: 0,
    fontFamily: fontFamily
  );

  TextStyle get textTitleDestination => const TextStyle(
    fontSize: 34,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 34 / 34,
    letterSpacing: 0,
    fontFamily: fontFamily
  );

}




class MyTextStyle {

  

  static const TextStyle h1 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w500,
    color: Colors.white
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: Colors.white
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.white
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    
  );

  static const TextStyle h5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    
  );

  static const TextStyle subTitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    
  );

  static const TextStyle subTitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    
  );

  static const TextStyle body1Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body2Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle caption2Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle body16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: MyColor.kAccent2
  );

  static const TextStyle body16L = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w200,
    color: MyColor.kAccent2
  );

  static const TextStyle body16bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: MyColor.kAccent2
  );

  static const TextStyle body14subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: MyColor.kGrey2,

  );

  static const TextStyle btn1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    
  );

  static const TextStyle btn2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    
  );

  static const TextStyle formLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    
  );

  static const TextStyle formInput = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle formInputBig = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w400,
    height: 1.5
  );


  static const TextStyle formInput2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    
  );

  static const TextStyle formHelper = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    
  );

  static const TextStyle toast = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    
  );

  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    
  );

  static const TextStyle contents = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    
  );

  static const TextStyle contentSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: MyColor.kGrey2

  );
}