import 'package:flutter/material.dart';
import 'package:respon/ipad.dart';

class responsiv extends StatelessWidget {
  // final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;

  final Widget desktopBody;
  final Widget mobileBody;
  final Widget ipadBody;
  const responsiv({
    required this.desktopBody,
    required this.mobileBody,
    required this.ipadBody,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth < 480) {
          return mobileBody;
        } else if (constrains.maxWidth > 480 && constrains.maxWidth < 834) {
          return ipadBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
