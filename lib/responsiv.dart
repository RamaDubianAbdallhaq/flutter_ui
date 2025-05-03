import 'package:flutter/material.dart';
import 'package:rasponsive_addaptiv/demensions.dart';

class responsiv extends StatelessWidget {
  // final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;

  final Widget desktopBody;
  final Widget mobileBody;
  const responsiv({required this.desktopBody, required this.mobileBody});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth < mobileWidth) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
