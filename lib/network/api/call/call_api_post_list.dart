/*
* Created by Neloy on 13 July, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:dio/dio.dart';

import '../../configuration/configuration_network.dart';
import '../api_path.dart';

class GetPostList {
  Future<Response> run({
    required Map<String, dynamic> data,
    required ConfigurationNetwork configurationNetwork,
  }) async {
    Response response;
    response = await configurationNetwork.request.get(
      ApiPath.posts,
      queryParameters: data,
      options: Options(headers: {"Content-Type": "application/json"}),
    );

    return response;
  }
}
