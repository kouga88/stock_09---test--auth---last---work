// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'package:pronet_storeroom_v_01/servises/api_mocker/json/_json_map.dart';

class ApiMocker {
  static const JSON_BOX_NAME = 'json_box';

  Future<void> registerAllJson() async {
    var box = await Hive.openBox(JSON_BOX_NAME);
    try {
      for (final element in jsonMap.entries) {
        await box.put(element.key, element.value);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {}
  }

  String getJsonKeyFromPath(String path) {
    return basenameWithoutExtension(basename(path));
  }

  Future<String> getJson(String jsonKey) async {
    var box = await Hive.openBox(JSON_BOX_NAME);
    try {
      return await box.get(jsonKey);
    } finally {
      // await box.close();
    }
  }

  Future<void> saveJson(String jsonKey, String json) async {
    var box = await Hive.openBox(JSON_BOX_NAME);
    try {
      await box.put(jsonKey, json);
    } finally {
      // await box.close();
    }
  }
}
