// Модель кнопки сегмента
import 'package:flutter/material.dart';

class SegmentButton {
  final String title;
  final IconData selectedIcon;
  final bool isFirst;
  final bool isLast;

  SegmentButton({
    required this.title,
    required this.selectedIcon,
    required this.isFirst,
    required this.isLast,
  });
}
