// Виджет содержимого
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/common/buttons/fullButton/full_button_model.dart';
import 'package:pronet_storeroom_v_01/common/buttons/fullButton/full_button_widget.dart';

class TabContentWidget extends StatelessWidget {
  final String title;

  const TabContentWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    List<FullButtonModel> buttonsData;

    // Определяем, какой массив использовать в зависимости от title
    switch (title) {
      case 'Поступления':
        buttonsData = incomeButtonsList;
        break;
      case 'Расход':
        buttonsData = consumptionButtonsList;
        break;
      case 'Возможности':
        buttonsData = possibilitiesButtonsList;
        break;
      default:
        buttonsData = incomeButtonsList;
        break;
    }

    return Column(
      children: buttonsData
          .map((button) => FullButtonWidget(
                button: button,
              ))
          .toList(),
    );
  }
}

final List<FullButtonModel> incomeButtonsList = [
  FullButtonModel(
      name: 'Оприходывание', path: '/storehouse/forms/arrival_create/'),
  FullButtonModel(name: 'Возврат', path: '/storehouse/forms/return_create'),
  FullButtonModel(
      name: 'Возврат с резерва',
      path: '/storehouse/forms/return_reserve_create'),
];

final List<FullButtonModel> consumptionButtonsList = [
  FullButtonModel(name: 'Выдача', path: '/storehouse/forms/transfer_create'),
  FullButtonModel(name: 'Расход', path: '/storehouse/forms/expense_create'),
  FullButtonModel(
      name: 'Расход по заявке', path: '/storehouse/forms/expense_in_redmine'),
  FullButtonModel(
      name: 'Резервирование ', path: '/storehouse/forms/reserve_create'),
  FullButtonModel(
      name: 'Использовать резерв',
      path: '/storehouse/forms/use_reserve_create'),
  FullButtonModel(name: 'Списание', path: '/storehouse/forms/nullify_create'),
];

final List<FullButtonModel> possibilitiesButtonsList = [
  FullButtonModel(
      name: 'Привязать серийные номера',
      path: '/storehouse/forms/add_sn_device'),
];
