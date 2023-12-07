import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locator_app/constants/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.indicatorColor = kCustomBlack,
  });
  final Color? indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: Center(
          child: Platform.isIOS
              ? CupertinoActivityIndicator(
                  color: indicatorColor,
                )
              : CircularProgressIndicator(
                  color: indicatorColor,
                ),
        ),
      ),
    );
  }
}
