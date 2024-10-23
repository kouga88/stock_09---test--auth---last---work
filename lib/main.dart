// ignore_for_file: dead_code

import 'dart:async';
import 'package:pronet_storeroom_v_01/app.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/api/building_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/api/building_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/api/i_building_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/building_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/api/department_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/api/department_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/api/i_department_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/department_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/accounting_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/api/accounting_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/api/accounting_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/api/i_accounting_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/api/directions_of_ops_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/api/directions_of_ops_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/api/i_directions_of_ops_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/directions_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/api/i_mission_of_ops_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/api/mission_of_ops_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/api/mission_of_ops_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/mission_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/api/i_nomenclatueres_group_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/api/nomenclatueres_group_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/api/nomenclatueres_group_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/nomenclatueres_group_repo.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/api/i_organization_api.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/api/organization_api.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/api/organization_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/api/i_nomenclatures_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/api/nomenclatures_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/nomenclatures_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/api/i_nomenclatures_parametrs_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/api/nomenclatures_parametrs_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/nomenclatures_parametrs_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/api/i_reserves_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/api/reserves_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/api/reserves_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/reserves_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/api/i_suppliers_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/api/suppliers_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/api/suppliers_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/suppliers_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/api/i_type_of_ops_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/api/type_of_ops_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/api/type_of_ops_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/type_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/api/i_type_of_work_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/api/type_of_work_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/api/type_of_work_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/type_of_work_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/api/i_units_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/api/units_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/api/units_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/units_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/api/i_storerooms_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/api/storerooms_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/api/storerooms_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/storerooms_repo.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/api/i_user_api.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/api/user_api.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/api/user_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/user_repo.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/auth/repo/api/auth_api.dart';
import 'package:pronet_storeroom_v_01/features/auth/repo/api/auth_api_mock.dart';
import 'package:pronet_storeroom_v_01/features/auth/repo/api/i_auth_api.dart';
import 'package:pronet_storeroom_v_01/features/auth/repo/auth_repo.dart';
import 'package:pronet_storeroom_v_01/setup/bloc/settings_bloc.dart';
import 'package:pronet_storeroom_v_01/setup/repo/enums/platform_type.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/token_saver_secure.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  await appPrepare();
  runApp(const App());
}

Future<void> appPrepare() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isApiMock = false;

  await Hive.initFlutter();

  GetIt.I.registerSingleton(await SharedPreferences.getInstance());

  GetIt.I.registerSingleton<ITokenSaver>(TokenSaverSecure());

  GetIt.I.registerSingleton(ApiMocker());
  final apiMocker = GetIt.I<ApiMocker>();
  apiMocker.registerAllJson();

  GetIt.I.registerSingleton<IAuthApi>(isApiMock ? AuthApiMock() : AuthApi());
  GetIt.I.registerSingleton(AuthRepo());

  GetIt.I.registerSingleton<IUserApi>(isApiMock ? UserApiMock() : UserApi());
  GetIt.I.registerSingleton(UserRepo());

  GetIt.I.registerSingleton<IOrganizationApi>(
      isApiMock ? OrganizationApiMock() : OrganizationApi());

  GetIt.I.registerSingleton(OrganizationRepo());

  GetIt.I.registerSingleton<IDepartmentApi>(
      isApiMock ? DepartmentApiMock() : DepartmentApi());
  GetIt.I.registerSingleton(DepartmentRepo());

  GetIt.I.registerSingleton<ISuppliersApi>(
      isApiMock ? SuppliersApiMock() : SuppliersApi());
  GetIt.I.registerSingleton(SuppliersRepo());

  // GetIt.I.registerSingleton<ITaskApi>(isApiMock ? TaskApiMock() : TaskApi());
  // GetIt.I.registerSingleton(TaskRepo());

  GetIt.I.registerSingleton<IUnitsApi>(isApiMock ? UnitsApiMock() : UnitsApi());
  GetIt.I.registerSingleton(UnitsRepo());

  GetIt.I.registerSingleton<IAccountingApi>(
      isApiMock ? AccountingApiMock() : AccountingApi());
  GetIt.I.registerSingleton(AccountingRepo());

  GetIt.I.registerSingleton<IReservesApi>(
      isApiMock ? ReservesApiMock() : ReservesApi());
  GetIt.I.registerSingleton(ReservesRepo());

  GetIt.I.registerSingleton<ITypeWorkApi>(
      isApiMock ? TypeWorkApiMock() : TypeWorkApi());
  GetIt.I.registerSingleton(TypeWorkRepo());

  GetIt.I.registerSingleton<IDirectionsOpsApi>(
      isApiMock ? DirectionsOpsApiMock() : DirectionsOpsApi());
  GetIt.I.registerSingleton(DirectionsOpsRepo());

  GetIt.I.registerSingleton<IMissionOperationsApi>(
      isApiMock ? MissionOperationsApiMock() : MissionOperationsApi());
  GetIt.I.registerSingleton(MissionOperationsRepo());

  GetIt.I.registerSingleton<ITypeOpsApi>(
      isApiMock ? TypeOpsApiMock() : TypeOpsApi());
  GetIt.I.registerSingleton(TypeOpsRepo());

  GetIt.I.registerSingleton<IStoreroomApi>(
      (isApiMock ? StoreroomApiMock() : StoreroomApi()));
  GetIt.I.registerSingleton(StoreroomRepo());

  GetIt.I.registerSingleton<IBuildingApi>(
      (isApiMock ? BuildingApiMock() : BuildingApi()));
  GetIt.I.registerSingleton(BuildingRepo());

  GetIt.I.registerSingleton<INomenclaturesGroupApi>(
      isApiMock ? NomenclaturesGroupApiMock() : NomenclaturesGroupApi());
  GetIt.I.registerSingleton(NomenclaturesGroupRepo());

  GetIt.I.registerSingleton<INomenclaturesApi>(NomenclaturesApi());
  GetIt.I.registerSingleton(NomenclaturesRepo());

  GetIt.I.registerSingleton<INomenclaturesParametrsApi>(
      NomenclaturesParametrsApi());
  GetIt.I.registerSingleton(NomenclaturesParametrsRepo());

  // GetIt.I.registerSingleton(CalendarRepo());
  final authBloc = AuthBloc(GetIt.I<AuthRepo>());
  GetIt.I.registerSingleton(authBloc);

  GetIt.I.registerSingleton(SettingsRepo());
  final settingsBloc = SettingsBloc(GetIt.I<SettingsRepo>());
  GetIt.I.registerSingleton(settingsBloc);

  setCurrentPlatform();
}

setCurrentPlatform() {
  if (kIsWeb) {
    SettingsRepo.currentPlatform = PlatformType.web;
    SettingsRepo.isWeb = true;
  } else {
    if (Platform.isAndroid) {
      SettingsRepo.currentPlatform = PlatformType.android;
      SettingsRepo.isMobile = true;
    } else if (Platform.isIOS) {
      SettingsRepo.currentPlatform = PlatformType.ios;
      SettingsRepo.isMobile = true;
    } else if (Platform.isFuchsia) {
      SettingsRepo.currentPlatform = PlatformType.fuchsia;
      SettingsRepo.isDesctop = true;
    } else if (Platform.isLinux) {
      SettingsRepo.currentPlatform = PlatformType.linux;
      SettingsRepo.isDesctop = true;
    } else if (Platform.isMacOS) {
      SettingsRepo.currentPlatform = PlatformType.macOS;
      SettingsRepo.isDesctop = true;
    } else if (Platform.isWindows) {
      SettingsRepo.currentPlatform = PlatformType.windows;
      SettingsRepo.isDesctop = true;
    }
  }
}
