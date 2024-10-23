import 'package:pronet_storeroom_v_01/setup/repo/enums/platform_type.dart';

class SettingsRepo {
  static PlatformType currentPlatform = PlatformType.web;
  static bool isMobile = false;
  static bool isDesctop = false;
  static bool isWeb = false;

  static String apiHost =
      'https://wh.provodov-net.ru'; // 'https://vortex.provodov-net.ru';
  // static String apiHost = 'http://10.10.20.133';
// https://vortex.provodov-net.ru
  // String getApiHost() => '10.10.20.133'; // :8001

  String getApiFilePath(String diskDirectory, String diskFilename) =>
      'warehouse.provodov-net.ru/files/$diskDirectory/$diskFilename';
}

// https://vortex.provodov-net.ru/files/
