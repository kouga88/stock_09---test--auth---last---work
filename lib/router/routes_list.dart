// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/artem/views/artem_arrival_page.dart';
import 'package:pronet_storeroom_v_01/features/artem/views/artem_cable_page.dart';
import 'package:pronet_storeroom_v_01/features/artem/views/artem_page.dart';
import 'package:pronet_storeroom_v_01/features/balance/views/balance_page.dart';
import 'package:pronet_storeroom_v_01/features/balance/views/in_stock_page.dart';
import 'package:pronet_storeroom_v_01/features/balance/views/reserves_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/view/accounting_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/view/building_detail_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/view/building_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/view/department_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/view/directions_of_ops_detail_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/view/directions_of_ops_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/view/mission_of_ops_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/view/nomenclatueres_group_page.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/views/organization_detail_page.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/views/organization_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/view/nomenclatures_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/views/nomenclatures_parametrs_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/views/reserves_detail_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/views/reserves_list_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/view/suppliers_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/view/type_of_ops_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/view/type_of_work_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/view/units_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/views/storerooms_detail_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/views/storerooms_list_page.dart';
import 'package:pronet_storeroom_v_01/features/users/views/user_detail_page.dart';
import 'package:pronet_storeroom_v_01/features/users/views/user_list_page.dart';
import 'package:pronet_storeroom_v_01/features/handbook/views/hand_book_page.dart';
import 'package:pronet_storeroom_v_01/features/search/views/search_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/views/store_house_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/views/forms_add_sn_device_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/views/forms_arrival_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/views/forms_expanse_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/views/forms_expanse_redmine_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/views/forms_nullify_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/views/forms_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/views/forms_reserv_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/form_return/view/forms_return_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/views/forms_return_reserv_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/views/forms_transfer_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/views/forms_use_reserv_page.dart';
import 'package:pronet_storeroom_v_01/features/news/views/news_page.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/operations/views/operations_page.dart';
import 'package:pronet_storeroom_v_01/features/balance/views/procurement_page.dart';
import 'package:pronet_storeroom_v_01/features/search/views/search_project_page.dart';
import 'package:pronet_storeroom_v_01/features/search/views/search_redmine_page.dart';
import 'package:pronet_storeroom_v_01/features/search/views/search_serial_page.dart';
import 'package:pronet_storeroom_v_01/setup/views/equipment_page.dart';
import 'package:pronet_storeroom_v_01/setup/views/purchase_page.dart';
import 'package:pronet_storeroom_v_01/features/settings/views/settings_page.dart';
import 'package:pronet_storeroom_v_01/setup/views/tools_page.dart';
import 'package:pronet_storeroom_v_01/common/pages/test_page.dart';
import 'package:pronet_storeroom_v_01/layouts/widgets/transition_page.dart';

var routes = [
  // Главная страница новостей
  GoRoute(
    path: '/news',
    pageBuilder: (context, state) => buildPageWithTransition(
      const NewsPage(),
      true,
    ),
  ),

  // Главный маршрут для "Склад" (Storehouse)
  GoRoute(
    path: '/storehouse',
    pageBuilder: (context, state) => buildPageWithTransition(
      const StoreHousePage(), // Основная страница склада, если есть
      false,
    ),
    routes: [
      // Формы
      GoRoute(
        name: 'Формы',
        path: 'forms',
        pageBuilder: (context, state) => buildPageWithTransition(
          FormsPage(),
          false,
        ),
        routes: [
          // Формы Приход
          GoRoute(
            name: 'Оприходывание',
            path: 'arrival_create',
            pageBuilder: (context, state) => buildPageWithTransition(
              FormArrivalPage(),
              false,
            ),
          ),
          // Формы Возврат
          GoRoute(
            name: 'Возврат',
            path: 'return_create',
            pageBuilder: (context, state) => buildPageWithTransition(
              FormReturnPage(),
              false,
            ),
          ),
          // Формы Возврат с резерва
          GoRoute(
            name: 'Возврат с резерва',
            path: 'return_reserve_create',
            pageBuilder: (context, state) => buildPageWithTransition(
              const FormReturnReservePage(),
              false,
            ),
          ),
          // Формы Выдача
          GoRoute(
            name: 'Выдача',
            path: 'transfer_create',
            pageBuilder: (context, state) => buildPageWithTransition(
              FormTransferPage(),
              false,
            ),
          ),
          // Формы Расход
          GoRoute(
            name: 'Расход',
            path: 'expense_create',
            pageBuilder: (context, state) => buildPageWithTransition(
              FormExpansePage(),
              false,
            ),
          ),
          // Формы Расход по заявке
          GoRoute(
            name: 'Расход по заявке',
            path: 'expense_in_redmine',
            pageBuilder: (context, state) => buildPageWithTransition(
              FormExpanseRedminePage(),
              false,
            ),
          ),
          // Формы Резервирование
          GoRoute(
            name: 'Резервирование',
            path: 'reserve_create',
            pageBuilder: (context, state) => buildPageWithTransition(
              const FormReservePage(),
              false,
            ),
          ),
          // Формы Использовать резерв
          GoRoute(
            name: 'Использовать резерв',
            path: 'use_reserve_create',
            pageBuilder: (context, state) => buildPageWithTransition(
              const FormUseReservePage(),
              false,
            ),
          ),

          GoRoute(
            name: 'Списание',
            path: 'nullify_create',
            pageBuilder: (context, state) => buildPageWithTransition(
              const FormNullifyPage(),
              false,
            ),
          ),
          // Формы Привязать серийные номера
          GoRoute(
            name: 'Привязать серийные номера',
            path: 'add_sn_device',
            pageBuilder: (context, state) => buildPageWithTransition(
              FormAddSnDevicePage(),
              false,
            ),
          ),
        ],
      ),
      // Настройки
      GoRoute(
        name: 'Настройки',
        path: 'settings',
        pageBuilder: (context, state) => buildPageWithTransition(
          SettingsPage(),
          false,
        ),
        routes: [
          // Номенклатуры
          GoRoute(
            name: 'Настройки склада',
            path: 'storerooms',
            pageBuilder: (context, state) => buildPageWithTransition(
              StoreroomListPage(),
              false,
            ),
            routes: [
              GoRoute(
                path: 'storeroom/:storeroomId',
                pageBuilder: (context, state) {
                  final storeroomId = state.pathParameters['storeroomId'];

                  return buildPageWithTransition(
                    StoreroomDetailPage(id: int.parse(storeroomId!)),
                    false,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: 'Строительные объекты',
            path: 'building',
            pageBuilder: (context, state) => buildPageWithTransition(
              BuildingPage(),
              false,
            ),
            routes: [
              GoRoute(
                path: 'building/:buildingId',
                pageBuilder: (context, state) {
                  final buildingId = state.pathParameters['buildingId'];

                  return buildPageWithTransition(
                    BuildingDetailPage(id: int.parse(buildingId!)),
                    false,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: 'Номенклатура',
            path: 'nomenclatures',
            pageBuilder: (context, state) => buildPageWithTransition(
              NomenclaturesPage(),
              false,
            ),
          ),

          GoRoute(
            name: 'Счета учета',
            path: 'accounting',
            pageBuilder: (context, state) => buildPageWithTransition(
              AccountingPage(),
              false,
            ),
          ),
          // Параметры номенклатур  acounting
          GoRoute(
            name: 'Параметры номенклатуры',
            path: 'nomenclatures_params',
            pageBuilder: (context, state) => buildPageWithTransition(
              const NomenclaturesParametrsPage(),
              false,
            ),
          ),
          // Параметры номенклатур
          GoRoute(
            name: 'Склады',
            path: 'storeroom',
            pageBuilder: (context, state) => buildPageWithTransition(
              StoreroomListPage(),
              false,
            ),
            // routes: [
            //   GoRoute(
            //     path: 'organization/:orgId',
            //     pageBuilder: (context, state) {
            //       final orgId = state.pathParameters['orgId'];

            //       return buildPageWithTransition(
            //         OrganizationDetailPage(id: int.parse(orgId!)),
            //         false,
            //       );
            //     },
            //   ),
            // ],
          ),
          // Группы номенклатур
          GoRoute(
            name: 'Группы номенклатур',
            path: 'nomenclature_groups',
            pageBuilder: (context, state) => buildPageWithTransition(
              NomenclaturesGroupsPage(),
              // NomenclaturesGroupPage(), //
              false,
            ),
          ),
          // Резерв
          GoRoute(
            name: 'Резервы',
            path: 'reserve',
            pageBuilder: (context, state) => buildPageWithTransition(
              // const ReserveSettingsPage(),
              const ReservesListPage(),
              false,
            ),
            routes: [
              GoRoute(
                path: ':reserveId',
                pageBuilder: (context, state) {
                  final reserveId = state.pathParameters['reserveId'];

                  return buildPageWithTransition(
                    ReservesDetailPage(id: int.parse(reserveId!)),
                    false,
                  );
                },
              ),
            ],
          ),
          // Рабочие настройки // Подразделения
          GoRoute(
            name: 'Тип работы',
            path: 'types-of-work',
            pageBuilder: (context, state) => buildPageWithTransition(
              TypeWorkPage(),
              false,
            ),
          ),
          // Поставщики
          GoRoute(
            name: 'Поставщики',
            path: 'suppliers',
            pageBuilder: (context, state) => buildPageWithTransition(
              const SuppliersPage(),
              false,
            ),
          ),
          GoRoute(
            name: 'Подразделения',
            path: 'departments',
            pageBuilder: (context, state) => buildPageWithTransition(
              const DepartmentPage(),
              false,
            ),
          ),
          // Утилиты
          GoRoute(
            name: 'Единицы измерений',
            path: 'units',
            pageBuilder: (context, state) => buildPageWithTransition(
              const UnitsPage(),
              false,
            ),
          ),
          // Закупки
          GoRoute(
            name: 'Закупки',
            path: 'purchase',
            pageBuilder: (context, state) => buildPageWithTransition(
              const PurchasePage(),
              false,
            ),
          ),
          // Инструменты
          GoRoute(
            name: 'Инструменты',
            path: 'tools',
            pageBuilder: (context, state) => buildPageWithTransition(
              const ToolsPage(),
              false,
            ),
          ),
          // Оборудование
          GoRoute(
            name: 'Оборудование',
            path: 'equipment',
            pageBuilder: (context, state) => buildPageWithTransition(
              const EquipmentPage(),
              false,
            ),
          ),
          GoRoute(
            name: 'Направление расхода',
            path: 'directions-of-operation',
            pageBuilder: (context, state) => buildPageWithTransition(
              // const ReserveSettingsPage(),
              DirectionsOpsPage(),
              false,
            ),
            routes: [
              GoRoute(
                path: ':reserveId',
                pageBuilder: (context, state) {
                  final reserveId = state.pathParameters['reserveId'];

                  return buildPageWithTransition(
                    DirectionsOpsDetailPage(id: int.parse(reserveId!)),
                    false,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: 'Цели выдачи',
            path: 'missions-of-operation',
            pageBuilder: (context, state) => buildPageWithTransition(
              // const ReserveSettingsPage(),
              const MissionOperationsPage(),
              false,
            ),
            routes: [
              GoRoute(
                path: ':reserveId',
                pageBuilder: (context, state) {
                  final reserveId = state.pathParameters['reserveId'];

                  return buildPageWithTransition(
                    DirectionsOpsDetailPage(id: int.parse(reserveId!)),
                    false,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: 'Типы операции',
            path: 'types-of-operation',
            pageBuilder: (context, state) => buildPageWithTransition(
              // const ReserveSettingsPage(),
              TypeOpsPage(),
              false,
            ),
            routes: [
              GoRoute(
                path: ':reserveId',
                pageBuilder: (context, state) {
                  final reserveId = state.pathParameters['reserveId'];

                  return buildPageWithTransition(
                    DirectionsOpsDetailPage(id: int.parse(reserveId!)),
                    false,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      // Операции
      GoRoute(
        name: 'Операции',
        path: 'operations',
        pageBuilder: (context, state) => buildPageWithTransition(
          const OperationsPage(),
          false,
        ),
      ),
    ],
  ),
  // Баланс
  GoRoute(
      name: 'Остаток',
      path: '/balance',
      pageBuilder: (context, state) => buildPageWithTransition(
            const BalancePage(),
            false,
          ),
      routes: [
        GoRoute(
          name: 'Остаток на складах',
          path: 'instoreroom',
          pageBuilder: (context, state) => buildPageWithTransition(
            const InStoreroomPage(),
            false,
          ),
        ),
        GoRoute(
          name: 'Остаток в резервах',
          path: 'reserves',
          pageBuilder: (context, state) => buildPageWithTransition(
            const ReservesPage(),
            false,
          ),
        ),
        // Закупки
        GoRoute(
          name: 'На закупку',
          path: 'procurement',
          pageBuilder: (context, state) => buildPageWithTransition(
            const ProcurementPage(),
            false,
          ),
        ),
      ]),
  // Резервы

  // Справочник (Handbook)
  GoRoute(
    name: 'Справочник',
    path: '/handbook',
    pageBuilder: (context, state) => buildPageWithTransition(
      const HandbookPage(), // Основная страница справочника, если есть
      false,
    ),
    routes: [
      // Организации
      GoRoute(
        name: 'Организации',
        path: 'organizations',
        pageBuilder: (context, state) => buildPageWithTransition(
          const OrganizationsPage(),
          false,
        ),
        routes: [
          GoRoute(
            path: ':orgId',
            pageBuilder: (context, state) {
              final orgId = state.pathParameters['orgId'];

              return buildPageWithTransition(
                OrganizationDetailPage(id: int.parse(orgId!)),
                false,
              );
            },
          ),
        ],
      ),
      // Сотрудники
      GoRoute(
          name: 'Сотрудники',
          path: 'users',
          pageBuilder: (context, state) => buildPageWithTransition(
                const UserListPage(),
                false,
              ),
          routes: [
            GoRoute(
              path: ':userId',
              pageBuilder: (context, state) {
                final userId = state.pathParameters['userId'];

                return buildPageWithTransition(
                  UserDetailPage(id: int.parse(userId!)),
                  false,
                );
              },
            ),
          ]),
    ],
  ),
  // GoRoute(
  //   path: '/users/:userId',
  //   builder: (context, state) {
  //     final userId = state.pathParameters['userId'];
  //     if (userId == null) {
  //       // Handle the case when userId is null (e.g., show an error page or redirect)
  //       return const ErrorPage(
  //           errorMessage:
  //               'Пользователь не найден'); // Replace with an appropriate error handling widget
  //     }
  //     return UserDetailPage(
  //         id: int.tryParse(userId) ??
  //             0); // Ensure the id is parsed correctly as an integer
  //   },
  // ),

  // Поиск (Search)
  GoRoute(
    name: 'Поиск',
    path: '/find',
    pageBuilder: (context, state) => buildPageWithTransition(
      const SearchPage(), // Основная страница поиска, если есть
      false,
    ),
    routes: [
      // Поиск по Redmine
      GoRoute(
        name: 'Поиск по Redmine',
        path: 'bid',
        pageBuilder: (context, state) => buildPageWithTransition(
          const SearchBidPage(),
          false,
        ),
      ),
      // Поиск по объектам
      GoRoute(
        name: 'Поиск  по объектам',
        path: 'objects',
        pageBuilder: (context, state) => buildPageWithTransition(
          const SearchObjectsPage(),
          false,
        ),
      ),
      // Поиск по серийным номерам
      GoRoute(
        name: 'Поиск по серийным номерам',
        path: 'serial',
        pageBuilder: (context, state) => buildPageWithTransition(
          const SearchSerialPage(),
          false,
        ),
      ),
    ],
  ),

  // Артем (Artem)
  GoRoute(
    name: 'Для Артема',
    path: '/artem',
    pageBuilder: (context, state) => buildPageWithTransition(
      const ArtemPage(), // Основная страница Артема, если есть
      false,
    ),
    routes: [
      // Кабель
      GoRoute(
        name: 'Бухты Кабеля',
        path: 'cable',
        pageBuilder: (context, state) => buildPageWithTransition(
          const ArtemCablePage(),
          false,
        ),
      ),
      // Приход
      GoRoute(
        name: 'Для Артема приход',
        path: 'arrival',
        pageBuilder: (context, state) => buildPageWithTransition(
          const ArtemArivalPage(),
          false,
        ),
      ),
    ],
  ),
  GoRoute(
    path: '/test',
    name: 'test',
    pageBuilder: (context, state) =>
        buildPageWithTransition(const TestPage(), false),
  ),
  // Страница ошибки
  GoRoute(
    path: '/404',
    pageBuilder: (context, state) => buildPageWithTransition(
        const ErrorPage(errorMessage: 'errorMessage'), true),
  )
];
