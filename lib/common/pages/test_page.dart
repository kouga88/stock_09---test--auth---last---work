// ignore_for_file: unused_local_variable, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/department_repo.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/user_repo.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int selectedSize = 1;
  final int selectedPage = 99;
  List<int> items = [1, 10, 20, 30, 40, 50, 60, 70, 80, 100];
  // Метод для получения данных и обновления состояния
  Future<void> fetchAndDisplayUsers() async {
    // Инициализация userRepo
    try {
      final userRepo = GetIt.I<UserRepo>();

      final (userList, _) = await userRepo.getUserList(
          page_size: selectedSize, page: 1, searchText: '');

      for (final element in userList) {}
    } catch (e) {
      // Обработка ошибок
    }
    // Изменяем состояние виджета
  }

  Future<void> fetchShortUsers() async {
    // Инициализация userRepo
    try {
      final userRepo = GetIt.I<UserRepo>();
      final userList = await userRepo.getUserShort();
      for (var element in userList) {
        // print('$element ');
      }
    } catch (e) {
      // Обработка ошибок
      print(e);
    }
    // Изменяем состояние виджета
  }

  Future<void> fetchSearchUsers() async {
    // Инициализация userRepo
    try {
      final userRepo = GetIt.I<UserRepo>();

      final userList =
          await userRepo.searchUser(page: 1, page_size: 999, params: {
        "and": {"username": "k.ugay"}
      });
      for (var element in userList) {
        print('$element ');
      }
    } catch (e) {
      // Обработка ошибок
      print(e);
    }
    // Изменяем состояние виджета
  }

  Future<void> fetchOrgShort() async {
    // Инициализация userRepo
    try {
      final orgRepo = GetIt.I<OrganizationRepo>();
      final orgList = await orgRepo.getOrganizationsShort();
      for (var element in orgList) {
        print('$element ');
      }
    } catch (e) {
      // Обработка ошибок
      print(e);
    }
    // Изменяем состояние виджета
  }

  Future<void> fetchDeptShort() async {
    // Инициализация userRepo
    try {
      final deptRepo = GetIt.I<DepartmentRepo>();
      final deptList = await deptRepo.getDepartmentsShort();
      for (var element in deptList) {
        print('$element ');
      }
    } catch (e) {
      // Обработка ошибок
      print(e);
    }
    // Изменяем состояние виджета
  }

  Future<void> testFormUNtins() async {
    final dio = Dio();
    dio.options.headers["Authorization"] =
        'Token 435be1734c14b6900497b01e638e7e71a5cbd7ae';
    dio.options.baseUrl = SettingsRepo.apiHost;

    final response = await dio.get(
        'https://wh.provodov-net.ru/api/v1/employees/?filters={"and":{"first_name__contains":"Алекс"}}');

    print(response.data);
    return (response.data);
  }

  Future<void> fetchGroups() async {
    // Инициализация userRepo
    try {
      final groupeRepo = GetIt.I<UserRepo>();
      final groupeList = await groupeRepo.getGroupsShort();
      for (var element in groupeList) {
        print('fetchGroups $element');
      }
    } catch (e) {
      // Обработка ошибок
      print(e);
    }
    // Изменяем состояние виджета
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [Text('')],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: fetchAndDisplayUsers,
                child: const Text('Получить список пользователей'),
              ),
              Center(
                child: DropdownButton<int>(
                  hint: const Text("Select a number"), // Подсказка по умолчанию
                  value: selectedSize, // Текущее выбранное значение
                  icon: const Icon(Icons.safety_check), // Иконка стрелки вниз
                  iconSize: 24, // Размер иконки
                  elevation: 16, // Elevation выпадающего списка
                  style:
                      const TextStyle(color: Colors.deepPurple), // Стиль текста
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ), // Подчеркивание
                  onChanged: (int? newValue) {
                    // Обработка изменения значения
                    setState(() {
                      selectedSize = newValue ?? 1;
                    });
                  },
                  items: items.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()), // Показываем число
                    );
                  }).toList(), // Конвертируем список чисел в виджеты DropdownMenuItem
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: fetchShortUsers,
            child: const Text('Получить коротких пользователей'),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: fetchGroups,
            child: const Text('Получить список групп'),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: fetchOrgShort,
            child: const Text('Получить список организаций'),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: fetchDeptShort,
            child: const Text('Получить список департаментов'),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: testFormUNtins,
            child: const Text('Поиск сотрудников'),
          ),
        ),
      ],
    );
  }
}
//fetchDeptOrhort