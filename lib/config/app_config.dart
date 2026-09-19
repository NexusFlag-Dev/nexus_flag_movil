enum AppEnviroment {productivo, pruebas, local}

class AppConfig {
  AppConfig._();
  static const _prodUrl = '';
  static const _testUrl = 'http://192.168.0.199:8000/api/';
  static const _loclaUrl = '';

  static AppEnviroment currentEnviroment = AppEnviroment.pruebas;
  static String getBaseUrl(AppEnviroment env){
    currentEnviroment = env;
    switch (env) {
      case AppEnviroment.productivo:
        return _prodUrl;
      case AppEnviroment.pruebas:
        return _testUrl;
      case AppEnviroment.local:
        return _loclaUrl;
    }
  }
}