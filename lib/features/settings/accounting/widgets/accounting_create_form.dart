import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/bloc/accounting_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/models/accounting.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/models/accounting_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class AccountingCreateFromWidget extends StatefulWidget {
  const AccountingCreateFromWidget(
      {super.key, this.accounting, required this.bloc});

  final Accounting? accounting;
  final AccountingBloc bloc;
  @override
  State<AccountingCreateFromWidget> createState() =>
      _AccountingCreateFromWidgetState();
}

class _AccountingCreateFromWidgetState
    extends State<AccountingCreateFromWidget> {
  final _formKey = GlobalKey<FormState>();
  final AccountingCreate _accountingCreate = AccountingCreate();

  @override
  void initState() {
    if (widget.accounting != null) {
      _accountingCreate.name.text = widget.accounting!.name!;
      _accountingCreate.number.text = widget.accounting!.number!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;

    return AlertDialog(
      scrollable: true,
      title: SizedBox(
        width: 600,
        child: Text(
            widget.accounting == null
                ? 'Создание счета учета'
                : 'Редактирование счета учета #${widget.accounting!.name}',
            style: theme.textTheme.headlineSmall),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Наименование счета'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _accountingCreate.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите полное наименование';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Номер счета'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _accountingCreate.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите номер счета';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Accounting? accounting = widget.accounting;

              if (accounting != null) {
                widget.bloc.add(EditAccountingEvent(
                  id: accounting.id,
                  name: _accountingCreate.name.text,
                  number: _accountingCreate.number.text,
                ));
              } else {
                widget.bloc.add(CreateNewAccountingEvent(
                  name: _accountingCreate.name.text,
                  number: _accountingCreate.number.text,
                ));
              }

              Navigator.pop(context);
            }
          },
          child: const Text(
            'Сохранить',
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: buttonsTheme.secondaryButton,
          child: const Text(
            'Отмена',
          ),
        ),
      ],
    );
  }
}
