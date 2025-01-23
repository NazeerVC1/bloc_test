// lib/constants/text_styles.dart
import 'package:flutter/material.dart';

class TextStyles {
  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  // Colors
  static const Color _primaryTextColor = Color(0xFF1F1F1F);
  static const Color _secondaryTextColor = Color(0xFF757575);
  static const Color _disabledTextColor = Color(0xFFBDBDBD);

  // Headings
  static TextStyle h1 = const TextStyle(
    fontSize: 32,
    fontWeight: bold,
    //fontFamily: _primaryFont,
    color: _primaryTextColor,
    letterSpacing: -0.5,
    height: 1.3,
  );

  static TextStyle h2 = const TextStyle(
    fontSize: 28,
    fontWeight: bold,
    //fontFamily: _primaryFont,
    color: _primaryTextColor,
    letterSpacing: -0.5,
    height: 1.3,
  );

  static TextStyle h3 = const TextStyle(
    fontSize: 24,
    fontWeight: semiBold,
    //fontFamily: _primaryFont,
    color: _primaryTextColor,
    height: 1.3,
  );

  static TextStyle h4 = const TextStyle(
    fontSize: 20,
    fontWeight: semiBold,
    //fontFamily: _primaryFont,
    color: _primaryTextColor,
    height: 1.3,
  );

  // Body text
  static TextStyle bodyLarge = const TextStyle(
    fontSize: 16,
    fontWeight: regular,
    //fontFamily: _primaryFont,
    color: _primaryTextColor,
    height: 1.5,
  );

  static TextStyle bodyMedium = const TextStyle(
    fontSize: 14,
    fontWeight: regular,
    //fontFamily: _primaryFont,
    color: _primaryTextColor,
    height: 1.5,
  );

  static TextStyle bodySmall = const TextStyle(
    fontSize: 12,
    fontWeight: regular,
    color: _primaryTextColor,
    height: 1.5,
  );

  // Button text
  static TextStyle buttonLarge = const TextStyle(
    fontSize: 16,
    fontWeight: semiBold,
    color: Colors.white,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static TextStyle buttonMedium = const TextStyle(
    fontSize: 14,
    fontWeight: semiBold,
    color: Colors.white,
    letterSpacing: 0.5,
    height: 1.5,
  );

  // Caption and overline
  static TextStyle caption = const TextStyle(
    fontSize: 12,
    fontWeight: regular,
    color: _secondaryTextColor,
    letterSpacing: 0.4,
    height: 1.3,
  );

  static TextStyle overline = const TextStyle(
    fontSize: 10,
    fontWeight: medium,
    color: _secondaryTextColor,
    letterSpacing: 1.5,
    height: 1.3,
  );

  // Helper methods for common variations
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  // Form field styles
  static TextStyle inputLabel = const TextStyle(
    fontSize: 14,
    fontWeight: medium,
    color: _primaryTextColor,
    height: 1.3,
  );

  static TextStyle inputText = const TextStyle(
    fontSize: 16,
    fontWeight: regular,
    color: _primaryTextColor,
    height: 1.5,
  );

  static TextStyle inputHint = const TextStyle(
    fontSize: 16,
    fontWeight: regular,
    color: _secondaryTextColor,
    height: 1.5,
  );

  // Error and validation styles
  static TextStyle errorText = const TextStyle(
    fontSize: 12,
    fontWeight: regular,
    color: Colors.red,
    height: 1.3,
  );

  static TextStyle successText = const TextStyle(
    fontSize: 12,
    fontWeight: regular,
    color: Colors.green,
    height: 1.3,
  );

  // Link styles
  static TextStyle link = const TextStyle(
    fontSize: 14,
    fontWeight: medium,
    color: Colors.blue,
    decoration: TextDecoration.underline,
    height: 1.5,
  );
}
