import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:krystal_digital/utils/theme.dart';

import '../../utils/widget/dialog_helper.dart';

class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);

// @override
// String toString() => 'AppException(message: $message, prefix: $prefix, url: $url)';
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responded in time', url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorized request', url);
}

String handleErrorMessage(e) {
  String errorMess = '';
  e is BadRequestException ||
      e is FetchDataException ||
      e is ApiNotRespondingException
      ? errorMess = e.message!
      : 'An error occurred';
  return errorMess;
}

void handleError(error) {
  // print(error.toString());
  if (error is BadRequestException || error is UnAuthorizedException) {
    var message = error.message;
    DialogHelper.showErroDialog(description: message);
  } else if (error is FetchDataException) {
    var message = error.message;
    //  showSnackBar(content: message!);
    DialogHelper.showErroDialog(description: message);
  } else if (error is ApiNotRespondingException) {
    DialogHelper.showErroDialog(
        description: 'Oops! It took longer to respond.');
  }
  else if (error is FormatException) {
    DialogHelper.showErroDialog(
        description: 'Oops! An error occured.Try again Later');
  }
  else {
    var message = error;
    DialogHelper.showErroDialog(description: message.toString());
  }
}

void showSnackBar({required String content, String? title}) {
  Get.showSnackbar(
    GetSnackBar(
      title: title ?? 'Error',
      message: content,
      duration: const Duration(seconds: 3),
      backgroundColor: appPurple,
    ),
  );
}
