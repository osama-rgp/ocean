import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../server/api.dart';



class Logger {
  static void logProcess({
    required String tag,
    required String message,
     bool success = false,
  }) {
    log("${success?"✅✅✅":""}::$message", name: tag, time: DateTime.now());
  }

  static void logError(dynamic error, String errorLocation) {
    if (kDebugMode) {
      log("", error: error, name: errorLocation);
    }
  }

  static void logApiRequest(ApiRequest request, String requestType,
      {bool isMedia = false, Map<String, dynamic>? media}) {
    if (kDebugMode) {
      log("|| $requestType  ${request.url.toUpperCase()}\n${_bodyConverter(request.headers??{}, "END HEADERS>>")}\n${_bodyConverter(isMedia ?( media ?? {}) : (request.body ?? request.params??{}), "END REQUEST")}",
          name: "API Request");
    }
  }

  static void logApiResponse(ApiResponse response) {
    if (kDebugMode) {
      log("||Status Code :${response.statusCode} \n \t\t\t   || success : ${response.success}\n${_bodyConverter(response.body ?? {}, "END RESPONSE")}",
          name: "API Response");
    }
  }

  static String _bodyConverter(Map body, String endMessage) {
    List<String> keys = body.keys.map((e) => e.toString()).toList();
    List<String> values = body.values.map((e) => e.toString()).toList();
    String res = '||{\n';
    for (int i = 0; i < values.length; i++) {
      res += "||\t ${keys[i]}:${values[i].toString()}, \n";
    }
    res +=
        "||}\n -------------------------------------------------------- \n -------------------------------------------------------->>$endMessage";
    return res;
  }
}

class LogTags{
  static const String internetConnection = "Internet connection";

  static const String geolocator = "Geolocator";

  static const String permission = "Permission";

  static const String cash = "Cash";

  static const String navigator = "Navigator";

  static const String  mapping = "Mapping";

  static const String  firebaseMessaging = "Firebase Messaging";

  static const String initiateApp = "Initiate App";

  static const String performanceTracking = "PERFORMANCE TRACKER";

  static const  String unknown = "Unknown";

  static const String  widgetRebuild = "REBUILDING WIDGET";

  static const String otp = "OTP";

  static const String camera="camera";

  static const String map ="MAP";

  static const String downloading = "DOWNLOADING";

  static const String savingImageToGallery = "SAVING IMAGE TO GALLERY";
}
