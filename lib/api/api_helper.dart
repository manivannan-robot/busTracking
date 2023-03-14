const String uatServerBaseUrl = 'https://dev-bee.com/devbee-school/';
const String liveServerBaseUrl = 'http://43.206.124.140/live/';
const String localServerBaseUrl='http://192.168.0.147/smart-school/';

const String versionName = '1.1.0'; //TODO: NEED TO CHANGE BEFORE BUILD

class ApiBaseUrl {
  static String baseUrl = //TODO: NEED TO CHANGE BEFORE BUILD
  // uatServerBaseUrl; //UAT
  //liveServerBaseUrl; //LIVE
  localServerBaseUrl;

}

class BuildVersion {
  static String versionNameSuffix =
  ApiBaseUrl.baseUrl == liveServerBaseUrl ? 'L' : 'U';
  static String buildName = 'V $versionName $versionNameSuffix';
}

class ApiEndPoint {
  static String loginEndPoint = 'api/Driver/Auth/login';
  static String busListEndPoint = 'api/Driver/Driver_controller/get_bus_list?school_id=1';
  static String schoolListEndPoint = 'api/Driver/Driver_controller/get_school_list';

  static String resetPasswordEndPoint = 'api/Teacher/Auth/reset_password';
}


// fvm flutter pub run flutter_launcher_icons:main