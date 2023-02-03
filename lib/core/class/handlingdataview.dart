import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              ImageAssets.loading,
            ),
          )
        : statusRequest == StatusRequest.serverFailure
            ? Center(
                child: Lottie.asset(
                  ImageAssets.servererror,
                ),
              )
            : statusRequest == StatusRequest.offlineFailure
                ? Center(
                    child: Lottie.asset(
                      ImageAssets.offline,
                    ),
                  )
                : statusRequest == StatusRequest.exception
                    ? const Center(
                        child: Text('Exception'),
                      )
                    : statusRequest == StatusRequest.noDatafailure
                        ? Center(
                            child: Lottie.asset(
                              ImageAssets.nodata,
                            ),
                          )
                        : widget;
  }
}
