// Виджет кнопки
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/common/buttons/segmentButton/segment_button_model.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class SegmentButtonWidget extends StatelessWidget {
  final SegmentButton button;
  final bool isActive;
  final VoidCallback onTap;

  const SegmentButtonWidget({
    super.key,
    required this.button,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: const Border(
            right: BorderSide(
              color: greyBlueColor75,
            ),
            left: BorderSide(color: greyBlueColor75),
            bottom: BorderSide(
              color: greyBlueColor75,
            ),
            top: BorderSide(
              color: greyBlueColor75,
            ),
          ),
          color: isActive ? backgroundColor : transparent,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(button.isFirst ? 50 : 0),
            topLeft: Radius.circular(button.isFirst ? 50 : 0),
            bottomRight: Radius.circular(button.isLast ? 50 : 0),
            topRight: Radius.circular(button.isLast ? 50 : 0),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            isActive
                ? Icon(
                    button.selectedIcon,
                    size: 16,
                    color: greyBlue45Color,
                  )
                : const SizedBox(),
            const SizedBox(
              width: 5,
            ),
            Text(button.title),
          ],
        ),
      ),
    );
  }
}
