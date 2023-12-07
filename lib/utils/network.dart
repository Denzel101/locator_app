import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/utils/utils.dart';
import 'package:logger/logger.dart';

class NetworkUtil {
  factory NetworkUtil() => _networkUtil;

  NetworkUtil._internal();

  static final NetworkUtil _networkUtil = NetworkUtil._internal();

  final _logger = Logger();

  Dio _getHttpClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: OnSpaceConfig.instance!.values.baseUrl,
        contentType: 'application/json',
        headers: <String, dynamic>{'Accept': 'application/json'},
        connectTimeout: const Duration(seconds: 60 * 1000),
        receiveTimeout: const Duration(seconds: 60 * 1000),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] = 'Bearer test';

          return handler.next(options);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          return handler.next(e);
        },
      ),
    );

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () => HttpClient()..badCertificateCallback = (_, __, ___) => true;
    return dio;
  }

  Future<Map<String, dynamic>> getReq(String url) async {
    try {
      final response = await _getHttpClient().get<dynamic>(url);

      final responseBody = response.data as Map<String, dynamic>;

      if (responseBody.isEmpty) {
        throw Failure(message: 'An error occured, please try again later');
      }

      return responseBody;
    } on SocketException catch (_) {
      throw Failure(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw Failure(message: 'Session timeout');
    } on DioException catch (err) {
      _logger
        ..d('Error: $err')
        ..i('${err.response?.statusCode}')
        ..i('Error: ${err.response?.data}');

      if (err.response?.statusCode == 401) {
        throw Failure(
          message: 'Session timeout',
          statusCode: err.response?.statusCode,
        );
      }

      if (DioExceptionType.unknown == err.type) {
        _logger
          ..d('Error: $err')
          ..i('${err.response?.statusCode}')
          ..i('Error: ${err.response?.data}');
        throw Exception('Server error');
      } else if (DioExceptionType.connectionTimeout == err.type) {
        throw const SocketException('No internet connection');
      } else if (DioExceptionType.connectionError == err.type) {
        throw const SocketException('No Internet Connection');
      }
      throw Exception('Server error');
    }
  }
}
