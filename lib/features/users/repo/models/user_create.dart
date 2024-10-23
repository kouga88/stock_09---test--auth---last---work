// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class UserCreate {
  TextEditingController last_name = TextEditingController();
  TextEditingController first_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  TextEditingController telegram_id = TextEditingController();

  int department = 0;
  int organization = 0;
  List groups = [];
  bool is_staff = false;

  bool is_superuser = false;
}
