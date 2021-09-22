/// Manage utility function for response repository api.

class ResponseUtil {
  Object data = [];
  List<Object> list = new List.filled(1, "");
  dynamic error = [];
  int statusCode = -1;
  String message = "";

  ResponseUtil({
    required this.data,
    required this.list,
    required this.error,
    required this.statusCode,
    required this.message,
  });

  static ResponseUtil resultResponse(
      {required Object data,
      required List<Object> list,
      required dynamic error,
      required int statusCode,
      required String message}) {
    switch (statusCode) {
      case 500:
        return ResponseUtil(
          data: [],
          list: [],
          message: message,
          statusCode: 500,
          error: error,
        );
      case 400:
        return ResponseUtil(
          data: [],
          list: [],
          message: message,
          statusCode: 400,
          error: error,
        );
      case 422:
        return ResponseUtil(
          data: [],
          list: [],
          message: message,
          statusCode: 400,
          error: error,
        );
      case 450:
        return ResponseUtil(
          data: [],
          list: [],
          message: message,
          statusCode: 450,
          error: error,
        );
      default:
        return ResponseUtil(
          statusCode: statusCode,
          error: "",
          message: message,
          data: data,
          list: list,
        );
    }
  }
}
