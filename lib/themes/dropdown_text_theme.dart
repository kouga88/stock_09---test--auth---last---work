import 'package:flutter/material.dart';

@immutable
class DropDownTextTheme extends ThemeExtension<DropDownTextTheme> {
  const DropDownTextTheme({
    required this.dropDownText,
  });

  final TextStyle? dropDownText;

  @override
  DropDownTextTheme copyWith({
    TextStyle? dropDownText,
  }) {
    return DropDownTextTheme(
      dropDownText: dropDownText ?? dropDownText,
    );
  }

  @override
  DropDownTextTheme lerp(DropDownTextTheme? other, double t) {
    if (other is! DropDownTextTheme) {
      return this;
    }
    return DropDownTextTheme(
      dropDownText: TextStyle.lerp(dropDownText, other.dropDownText, t),
    );
  }

  // Optional
  @override
  String toString() => 'DropDownTextTheme(dropDownText: $dropDownText,)';
}
