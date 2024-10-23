import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user_short.dart';

class FormReturn {
  TextEditingController titleController = TextEditingController();
  HtmlEditorController descriptionController = HtmlEditorController();
  UserShort? selectedUserr;

  static fromJson(String jsonString) {}
}
