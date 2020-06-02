import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static init(context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
  }

  static height(double height) {
    return ScreenUtil().setHeight(height);
  }

  static width(double width) {
    return ScreenUtil().setWidth(width);
  }

  static screenHeight() {
    return ScreenUtil.screenHeight;
  }

  static screenWidth() {
    return ScreenUtil.screenWidth;
  }
}