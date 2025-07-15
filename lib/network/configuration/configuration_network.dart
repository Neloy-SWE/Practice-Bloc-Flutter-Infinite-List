/*
* Created by Neloy on 13 July, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:dio/dio.dart';
import 'package:practice_bloc_flutter_infinite_list/network/configuration/configuration_api_constant.dart';
import 'package:practice_bloc_flutter_infinite_list/network/configuration/configure_interceptor.dart';

class ConfigurationNetwork {
  late Dio request;
  final BaseOptions options = BaseOptions(
    baseUrl: ConfigurationApiConstant.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 200),
    validateStatus: (status) {
      return status != null && status < 700;
    },
  );

  ConfigurationNetwork() {
    request = Dio(options);
    request.interceptors.add(ConfigurationInterceptor());
  }
}
