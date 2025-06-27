import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color scaffoldBackgroundColor;
  final Color backgroundColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color appBarForegroundColor;
  final Color buttonColor;
  final Color containerBackgroundColor;
  final Color textFieldFillColor;
  final Color inactiveColor;

  const CustomColors(
      {
    required this.scaffoldBackgroundColor,
    required this.backgroundColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.appBarForegroundColor,
    required this.buttonColor,
    required this.containerBackgroundColor,
    required this.textFieldFillColor,
        required this.inactiveColor,

  });

  static const light = CustomColors(
    scaffoldBackgroundColor: Color(0xffF0F1F5),
    backgroundColor: Color(0xffB2D6FF),
    inactiveColor: Color(0xFF1E88E5),
    primaryTextColor: Color(0xff363939),
    secondaryTextColor: Color(0xff737373),
    appBarForegroundColor: Colors.white,
    buttonColor: Color(0xFF1E88E5),
    containerBackgroundColor: Colors.white,
    textFieldFillColor: Colors.white,
  );

  static var dark = CustomColors(
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    primaryTextColor: Colors.white,
    secondaryTextColor: Colors.grey,
    appBarForegroundColor: Colors.black,
    buttonColor:  Color(0xffEBD3F8),
      containerBackgroundColor: Color(0xFF424242),
    textFieldFillColor: Color(0xFF424242),
    inactiveColor: Color(0xffAD49E1),
  );

  @override
  CustomColors copyWith({
    Color? scaffoldBackgroundColor,
    Color? backgroundColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? appBarForegroundColor,
    Color? buttonColor,
    Color?  containerBackgroundColor,
    Color? textFieldFillColor,
    Color? inactiveColor,
  }) {
    return CustomColors(
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      appBarForegroundColor: appBarForegroundColor ?? this.appBarForegroundColor,
      buttonColor: buttonColor ?? this.buttonColor,
      containerBackgroundColor: containerBackgroundColor  ??this.containerBackgroundColor,
      textFieldFillColor: textFieldFillColor  ??this.textFieldFillColor,
      inactiveColor: inactiveColor  ??this.inactiveColor,

    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      scaffoldBackgroundColor: Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      secondaryTextColor: Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      appBarForegroundColor: Color.lerp(appBarForegroundColor, other.appBarForegroundColor, t)!,
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t)!,
      containerBackgroundColor: Color.lerp(containerBackgroundColor, other.containerBackgroundColor, t)!,
      textFieldFillColor: Color.lerp(textFieldFillColor, other.textFieldFillColor, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,

    );
  }
}
