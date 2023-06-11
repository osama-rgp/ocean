part of 'api.dart';

class ApiRequest extends Equatable {
  final Map<String, dynamic>? headers;
  final String url;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? params;
  final MediaOption? media;

  const ApiRequest({
    required this.url,
    this.headers,
    this.body,
    this.params,
    this.media,
  });

  Future<Map<String, dynamic>> toMultiPart() async {
    if (media == null) {
      return {};
    }
    final Map<String, dynamic> requestedMap = {};
    for (int i = 0; i < media!.file.length; i++) {
      final file = await MultipartFile.fromFile(
        media!.file[i].path,
      );
      requestedMap.addAll({media!.keys[i]: file});
    }
    requestedMap.addAll(params ?? {});
    return requestedMap;
  }

  @override
  List<Object?> get props => [headers, url, body, params, media];
}

class MediaOption extends Equatable {
  final List<File> file;
  final List<String> keys;
  final RequestType requestType;

  const MediaOption({
    required this.file,
    required this.keys,
    required this.requestType,
  }) : assert(file.length == keys.length);

  @override
  List<Object> get props => [file, keys, requestType];

  @override
  String toString() {
    String res = '';
    for (int i = 0; i < file.length; i++) {
      res += '${keys[i]}:${file[i].path}\n';
    }
    res += "\n//Request type//${requestType.toString()}";
    return res;
  }
}
