import 'package:flutter/material.dart';

@immutable
class ButtonsTheme extends ThemeExtension<ButtonsTheme> {
  const ButtonsTheme({
    required this.prymaryButton,
    required this.secondaryButton,
    required this.dangerButton,
    required this.iconButtonExclued,
    required this.iconButtonAdd,
    required this.iconButtonClear,
    required this.iconButtonDelete,
    required this.iconButtonEdit,
    required this.filterButton,
    required this.iconButtonSmall,
    required this.iconButtonExit,
    required this.choiceButtonDate,
    required this.iconButtonMedium,
    required this.iconButtonMenu, // smallTextButton
    required this.smallTextButton,
    required this.linkTextButton,
    required this.menuButton,
  });

  final ButtonStyle? prymaryButton;
  final ButtonStyle? secondaryButton;
  final ButtonStyle? dangerButton;
  final ButtonStyle? iconButtonExclued;
  final ButtonStyle? iconButtonAdd;
  final ButtonStyle? iconButtonClear;
  final ButtonStyle? iconButtonDelete;
  final ButtonStyle? iconButtonEdit;
  final ButtonStyle? filterButton;
  final ButtonStyle? iconButtonSmall;
  final ButtonStyle? iconButtonExit;
  final ButtonStyle? choiceButtonDate;
  final ButtonStyle? iconButtonMedium;
  final ButtonStyle? iconButtonMenu;
  final ButtonStyle? smallTextButton;
  final ButtonStyle? linkTextButton;
  final ButtonStyle? menuButton;

  @override
  ButtonsTheme copyWith(
      {ButtonStyle? prymaryButton, ButtonStyle? secondaryButton}) {
    return ButtonsTheme(
      prymaryButton: prymaryButton ?? prymaryButton,
      secondaryButton: secondaryButton ?? secondaryButton,
      dangerButton: dangerButton ?? dangerButton,
      iconButtonExclued: iconButtonExclued ?? iconButtonExclued,
      iconButtonAdd: iconButtonAdd ?? iconButtonAdd,
      iconButtonClear: iconButtonClear ?? iconButtonClear,
      iconButtonDelete: iconButtonDelete ?? iconButtonDelete,
      iconButtonEdit: iconButtonEdit ?? iconButtonEdit,
      filterButton: filterButton ?? filterButton,
      iconButtonSmall: iconButtonSmall ?? iconButtonSmall,
      iconButtonExit: iconButtonExit ?? iconButtonExit,
      choiceButtonDate: choiceButtonDate ?? choiceButtonDate,
      iconButtonMedium: iconButtonMedium ?? iconButtonMedium,
      iconButtonMenu: iconButtonMenu ?? iconButtonMenu,
      smallTextButton: smallTextButton ?? smallTextButton,
      linkTextButton: linkTextButton ?? linkTextButton,
      menuButton: menuButton ?? menuButton,
    );
  }

  @override
  ButtonsTheme lerp(ButtonsTheme? other, double t) {
    if (other is! ButtonsTheme) {
      return this;
    }
    return ButtonsTheme(
      prymaryButton: ButtonStyle.lerp(prymaryButton, other.prymaryButton, t),
      secondaryButton:
          ButtonStyle.lerp(secondaryButton, other.secondaryButton, t),
      dangerButton: ButtonStyle.lerp(dangerButton, other.dangerButton, t),
      iconButtonExclued:
          ButtonStyle.lerp(iconButtonExclued, other.iconButtonExclued, t),
      iconButtonAdd: ButtonStyle.lerp(iconButtonAdd, other.iconButtonAdd, t),
      iconButtonClear:
          ButtonStyle.lerp(iconButtonClear, other.iconButtonClear, t),
      iconButtonDelete:
          ButtonStyle.lerp(iconButtonDelete, other.iconButtonDelete, t),
      iconButtonEdit: ButtonStyle.lerp(iconButtonEdit, other.iconButtonEdit, t),
      filterButton: ButtonStyle.lerp(filterButton, other.filterButton, t),
      iconButtonSmall:
          ButtonStyle.lerp(iconButtonSmall, other.iconButtonSmall, t),
      iconButtonExit: ButtonStyle.lerp(iconButtonExit, other.iconButtonExit, t),
      choiceButtonDate:
          ButtonStyle.lerp(choiceButtonDate, other.choiceButtonDate, t),
      iconButtonMedium:
          ButtonStyle.lerp(iconButtonMedium, other.iconButtonMedium, t),
      iconButtonMenu: ButtonStyle.lerp(iconButtonMenu, other.iconButtonMenu, t),
      smallTextButton:
          ButtonStyle.lerp(smallTextButton, other.smallTextButton, t),
      linkTextButton: ButtonStyle.lerp(linkTextButton, other.linkTextButton, t),
      menuButton: ButtonStyle.lerp(menuButton, other.menuButton, t),
    );
  }

  // Optional
  @override
  String toString() =>
      'ButtonsTheme(prymaryButton: $prymaryButton, secondaryButton: $secondaryButton, dangerButton: $dangerButton, iconButtonExclued:$iconButtonExclued, iconButtonAdd:$iconButtonAdd, iconButtonExclued:$iconButtonExclued, iconButtonDelete:$iconButtonDelete, iconButtonEdit:$iconButtonEdit, filterButton:$filterButton, iconButtonSmall:$iconButtonSmall, iconButtonExit:$iconButtonExit, choiceButtonDate: $choiceButtonDate, iconButtonMedium:$iconButtonMedium, iconButtonMenu:$iconButtonMenu, smallTextButton: $smallTextButton, linkTextButton: $linkTextButton,  menuButton: $menuButton,)';
}
