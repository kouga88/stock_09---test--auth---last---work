// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';

class ReservesCreate {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController status = TextEditingController();
  late StoreroomShort storeroom;
}
