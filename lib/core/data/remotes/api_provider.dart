import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../domain/use_cases/either.dart';
import 'custom_exception.dart';

const String baseUrl = "https://8079-125-167-146-73.ngrok-free.app/api/";
Dio get initDio => Dio(
      BaseOptions(
        validateStatus: (status) {
          return true;
        },
        followRedirects: false,
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    )..interceptors
        .add(PrettyDioLogger(requestBody: true, requestHeader: true));

class ApiProvider {
  final Dio dio;

  ApiProvider(this.dio);

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        var lisDirectory = await getExternalStorageDirectories(
            type: StorageDirectory.downloads);

        directory = lisDirectory?.last;
      }
    } catch (err, _) {
      return null;
    }
    return directory?.path;
  }

  Future<Map<String, dynamic>> get(String endPoint,
      {String? authToken, Map<String, dynamic>? queryParameters}) async {
    try {
      if (authToken != null) {
        dio.options.headers["authorization"] = "Bearer $authToken";
      }
      final Response response =
          await dio.get(endPoint, queryParameters: queryParameters);
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioException catch (_) {
      throw ConnectionException();
    }
  }

  Future<Map<String, dynamic>> post(String endPoint, Map<String, dynamic> body,
      {String? authToken, bool catchError400 = false}) async {
    try {
      dio.options.headers["Content-Type"] = "application/json; charset=utf8";
      if (authToken != null) {
        dio.options.headers["authorization"] = "Bearer $authToken";
      }
      final Response response = await dio.post(
        endPoint,
        data: body,
      );
      final Map<String, dynamic> responseData = catchError400
          ? classifyErrorResponse(response)
          : classifyResponse(response);
      return responseData;
    } on DioException catch (_) {
      throw ConnectionException();
    }
  }

  Future<Map<String, dynamic>> postMultiPart(String endPoint, FormData body,
      {String? authToken}) async {
    try {
      if (authToken != null) {
        dio.options.headers["authorization"] = "Bearer $authToken";
      }
      final Response response = await dio.post(
        endPoint,
        data: body,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioException catch (_) {
      throw ConnectionException();
    }
  }

  Future<Map<String, dynamic>> delete(String endPoint,
      {String? authToken, Map<String, dynamic>? body}) async {
    try {
      dio.options.headers["Content-Type"] = "application/json; charset=utf8";
      if (authToken != null) {
        dio.options.headers["authorization"] = "Bearer $authToken";
      }
      final Response response = await dio.delete(endPoint, data: body);
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioException catch (_) {
      throw ConnectionException();
    }
  }

  Future<Map<String, dynamic>> patch(String endPoint,
      {Map<String, dynamic>? body, String? authToken}) async {
    try {
      dio.options.headers["Content-Type"] = "application/json; charset=utf8";
      if (authToken != null) {
        dio.options.headers["authorization"] = "Bearer $authToken";
      }
      final Response response = await dio.patch(endPoint, data: body ?? "{}");
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioException catch (_) {
      throw ConnectionException();
    }
  }

  Future<Map<String, dynamic>> put(String endPoint, Map<String, dynamic> body,
      {String? authToken}) async {
    try {
      dio.options.headers["Content-Type"] = "application/json; charset=utf8";
      if (authToken != null) {
        dio.options.headers["authorization"] = "Bearer $authToken";
      }
      final Response response = await dio.put(
        endPoint,
        data: body,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioException catch (_) {
      throw ConnectionException();
    }
  }

  Stream<Either<CustomException, double>> downloadStream(
      String endPoint, String fileName,
      {String? authToken, Map<String, dynamic>? queryParameters}) async* {
    try {
      if (authToken != null) {
        dio.options.headers["authorization"] = "Bearer $authToken";
      }
      StreamController<Either<CustomException, double>> downloadProgress =
          StreamController();
      var path = await getDownloadPath();
      var filePath = "$path/GetSurvey/$fileName";
      var saveFileLocation = '/storage/emulated/0/Download/GetSurvey/$fileName';
      var fileExist = false;
      if (Platform.isAndroid) {
        fileExist = await File(saveFileLocation).exists();
      } else {
        fileExist = await File(filePath).exists();
      }
      if (fileExist) {
        downloadProgress.add(const Right(1.0));
        downloadProgress.close();
        yield* downloadProgress.stream;
        dio.options.receiveTimeout = const Duration(minutes: 30);
        return;
      }
      dio.options.receiveTimeout = null;
      dio.download(endPoint, filePath,
          onReceiveProgress: (int count, int total) {
        downloadProgress.add(Right(count / total));
      }, queryParameters: queryParameters).then((value) async {
        downloadProgress.add(const Right(1.0));
        downloadProgress.close();
        if (Platform.isAndroid) {
          await File(filePath).copy(saveFileLocation);
        }
        dio.options.receiveTimeout = const Duration(minutes: 30);
      });
      yield* downloadProgress.stream;
    } on DioException catch (_) {
      throw ConnectionException();
    }
  }

  Future<Map<String, dynamic>> download(String endPoint, String fileName,
      {String? authToken, Map<String, dynamic>? queryParameters}) async {
    try {
      if (authToken != null) {
        dio.options.headers["authorization"] = "Bearer $authToken";
      }
      var path = await getDownloadPath();
      var filePath = "$path/GetSurvey/$fileName";
      var saveFileLocation = '/storage/emulated/0/Download/GetSurvey/$fileName';
      var fileExist = false;
      if (Platform.isAndroid) {
        fileExist = await File(saveFileLocation).exists();
      } else {
        fileExist = await File(filePath).exists();
      }
      if (fileExist) {
        return {};
      }
      dio.options.receiveTimeout = null;
      final Response response = await dio.download(endPoint, filePath,
          onReceiveProgress: (int count, int total) {},
          queryParameters: queryParameters);

      if (Platform.isAndroid) {
        await File(filePath).copy(saveFileLocation);
      }
      dio.options.receiveTimeout = const Duration(minutes: 30);
      final Map<String, dynamic> responseData =
          classifyDownloadResponse(response);
      return responseData;
    } on DioException catch (_) {
      throw ConnectionException();
    }
  }

  Future<Map<String, dynamic>> putMultiPart(String endPoint, FormData body,
      {String? authToken}) async {
    try {
      if (authToken != null) {
        dio.options.headers["authorization"] = "Bearer $authToken";
      }
      final Response response = await dio.put(
        endPoint,
        data: body,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioException catch (_) {
      throw ConnectionException();
    }
  }

  Map<String, dynamic> classifyResponse(Response? response) {
    final Map<String, dynamic> responseData =
        response?.data as Map<String, dynamic>;
    switch (response?.statusCode) {
      case 200:
      case 201:
        return responseData;
      case 301:
        throw NotAvailableException(responseData["message"].toString());
      case 400:
        throw BadRequestException(responseData["message"].toString());
      case 401:
        throw UnauthorisedException(responseData["message"].toString());
      case 403:
        throw ForbiddenException();
      case 426:
        throw UpgradeException(responseData["data"]['name'].toString());
      case 500:
        throw ServerException(
            "Kesalahan server: ${responseData["message"].toString()}");
      default:
        throw FetchDataException(
          'Terjadi kesalahan di server code: ${response?.statusCode}',
        );
    }
  }

  Map<String, dynamic> classifyErrorResponse(Response? response) {
    final Map<String, dynamic> responseData =
        response?.data as Map<String, dynamic>;
    switch (response?.statusCode) {
      case 200:
      case 201:
      case 400:
        return responseData;
      case 301:
        throw NotAvailableException(responseData["message"].toString());
      case 401:
        throw UnauthorisedException(responseData["message"].toString());
      case 403:
        throw ForbiddenException();
      case 426:
        throw UpgradeException(responseData["data"]['name'].toString());
      case 500:
        throw ServerException(
            "Kesalahan server: ${responseData["message"].toString()}");
      default:
        throw FetchDataException(
          'Terjadi kesalahan di server code: ${response?.statusCode}',
        );
    }
  }

  Map<String, dynamic> classifyDownloadResponse(Response? response) {
    if (response?.statusCode == 200) return {};
    final Map<String, dynamic> responseData =
        response?.data as Map<String, dynamic>;
    switch (response?.statusCode) {
      case 200:
      case 201:
        return responseData;
      case 301:
        throw NotAvailableException(responseData["message"].toString());
      case 400:
        throw BadRequestException(responseData["message"].toString());
      case 401:
        throw UnauthorisedException(responseData["message"].toString());
      case 403:
        throw ForbiddenException();
      case 500:
        throw ServerException(
            "Kesalahan server: ${responseData["message"].toString()}");
      default:
        throw FetchDataException(
          'Terjadi kesalahan di server code: ${response?.statusCode}',
        );
    }
  }

  String classifyErrorDownloadResponse(Response? response) {
    final Map<String, dynamic> responseData =
        response?.data as Map<String, dynamic>;
    switch (response?.statusCode) {
      case 400:
        return responseData["message"].toString();
      case 401:
        return "Anda belum login";
      case 403:
        return "Anda tidak berhak untuk melakukan aksi ini";
      case 500:
        return "Kesalahan server: ${responseData["message"].toString()}";
      default:
        return "Kesalahan tidak diketahui";
    }
  }
}
