import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom_svg.dart';
import '../theme.dart';
import 'elevated_btn.dart';


class DialogHelper {
  //show error dialog
  static void showErroDialog(
      {String title = 'Oops!', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 200,
                width: 50,
                child: CustomSvg(
                  assetName:'assets/svg/error.svg',
                  width: 50,
                  height: 50,
                  color: Colors.white,
                ),
              ),
              description == 'An error occured'
                  ? const SizedBox(
                height: 15,
              )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  description ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              description == 'An error occured'
                  ? const SizedBox(
                height: 15,
              )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BtnElevated(
                  child: Text(
                    'Dismiss',
                    style: Get.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () {
                    if (Get.isDialogOpen!) Get.back();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //show toast

  static void showSessionTimeoutDialog(
      {String title = 'Session Time0ut',
        String? description = 'Please enter your pin'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  description ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BtnElevated(
                  child: Text(
                    'ok',
                    style: Get.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () {
                    if (Get.isDialogOpen!) Get.back();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
