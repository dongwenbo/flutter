import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static init(context) {
    ScreenUtil.init(context, width: ScreenAdapter.designWidth(), height: ScreenAdapter.designHeight(), allowFontScaling: false);
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

  static fontSize(double fontSize) {
    return ScreenUtil().setSp(fontSize);
  }


  static double designHeight() {
    return 1334.0;
  }

  static double designWidth() {
    return 750.0;
  }

}