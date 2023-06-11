import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:projectfinal/core/extension/request_type_extesion.dart';

import '../common/enums/enums.dart';
import '../logger/log.dart';
import '../managers/durations/duration_manager.dart';

part 'api_request.dart';

part 'api_response.dart';

abstract class Api {
  Future<ApiResponse> post(ApiRequest request);

  Future<ApiResponse> get(ApiRequest request);

  Future<ApiResponse> put(ApiRequest request);

  Future<ApiResponse> delete(ApiRequest request);

  Future<ApiResponse> uploadMedia(ApiRequest request);

  Future<Uint8List> download(String url);
}

class ApiImpl implements Api {
  final Dio dio = Dio();

  @override
  Future<ApiResponse> get(ApiRequest request) async {
    Logger.logApiRequest(request, RequestType.GET.type);
    final response = await dio.get(request.url,
        queryParameters: request.params,
        options: Options(
          sendTimeout: DurationManager.apiTimeout,
          headers: request.headers,
        ));
    final ApiResponse apiResponse = ApiResponse.fromResponse(response);
    Logger.logApiResponse(apiResponse);
    return apiResponse;
  }

  @override
  Future<ApiResponse> post(ApiRequest request) async {
    Logger.logApiRequest(request, RequestType.POST.type);
    final response = await dio.post(
      request.url,
      queryParameters: request.params,
      data: request.body,
      options: Options(
        sendTimeout: DurationManager.apiTimeout,
        receiveTimeout: DurationManager.apiReceiveTimeout,
        headers: request.headers,
      ),
    );
    final ApiResponse apiResponse = ApiResponse.fromResponse(response);
    Logger.logApiResponse(apiResponse);
    return apiResponse;
  }

  @override
  Future<ApiResponse> put(ApiRequest request) async {
    Logger.logApiRequest(request, RequestType.PUT.type);
    final response = await dio.put(request.url,
        queryParameters: request.params,
        options: Options(
          sendTimeout: DurationManager.apiTimeout,
          headers: request.headers,
        ));
    final ApiResponse apiResponse = ApiResponse.fromResponse(response);
    Logger.logApiResponse(apiResponse);
    return apiResponse;
  }

  @override
  Future<ApiResponse> uploadMedia(ApiRequest request) async {
    if (request.media == null) {
      throw Exception("no media to upload.");
    }
    final formDataMap = await request.toMultiPart();
    FormData formData = FormData.fromMap(formDataMap);
    Logger.logApiRequest(request, RequestType.PUT.type,
        isMedia: true, media: formDataMap);
    final Response response;
    switch (request.media!.requestType) {
      case RequestType.GET:
        response = await dio.get(request.url,
            data: formData,
            options: Options(
              headers: request.headers,
            ));
        break;
      case RequestType.PUT:
        response = await dio.put(request.url,
            data: formData,
            options: Options(
              headers: request.headers,
            ));
        break;
      case RequestType.POST:
      default:
        response = await dio.post(request.url,
            data: formData,
            options: Options(
              headers: request.headers,
            ));
        break;
    }
    final ApiResponse apiResponse = ApiResponse.fromResponse(response);
    Logger.logApiResponse(apiResponse);
    return apiResponse;
  }

  @override
  Future<ApiResponse> delete(ApiRequest request) async {
    Logger.logApiRequest(request, RequestType.DELETE.type);
    final response = await dio.delete(request.url,
        queryParameters: request.params,
        options: Options(
          sendTimeout: DurationManager.apiTimeout,
          headers: request.headers,
        ));
    final ApiResponse apiResponse = ApiResponse.fromResponse(response);
    Logger.logApiResponse(apiResponse);
    return apiResponse;
  }

  @override
  Future<Uint8List> download(String url) async {
    try {
      Logger.logProcess(
          message: "Downloading file with link $url ...",
          tag: LogTags.downloading);
      final response = await dio.get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      Uint8List bytes = Uint8List.fromList(response.data);
      Logger.logProcess(
          message:
              "Downloading file with link $url is successes with byte size ${bytes.buffer.lengthInBytes}",
          tag: LogTags.downloading);
      return bytes;
    } catch (e) {
      Logger.logError(e, LogTags.downloading);
      throw Exception("Can't download this file.");
    }
  }
}
