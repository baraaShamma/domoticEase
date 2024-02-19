import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final void Function() onTap;

  const HandlingDataView(
      {Key? key,
      required this.statusRequest,
      required this.widget,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageAssets.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Column(
                  children: [
                    Lottie.asset(AppImageAssets.offline,
                        width: 250, height: 250)
                  ],
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Column(
                      children: [
                        Lottie.asset(AppImageAssets.server,
                            width: 250, height: 250),
                        ElevatedButton(
                            onPressed: onTap, child: Text("اعادة المحاولة"))
                      ],
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child:Column(
                          children: [
                            Lottie.asset(AppImageAssets.noData,
                                width: 250, height: 250, repeat: true),
                          ],
                        )
                      )
                    : widget;
  }
}
