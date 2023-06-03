


import '../common/enums/enums.dart';

extension RequestTypeEx on RequestType{
  String get type {
    switch (this) {
      case RequestType.GET:
        return "GET";
      case RequestType.PUT:
        return "PUT";
      case RequestType.POST:
        return "POST";
      default:
        return "UNKNOWN";
    }
  }
}