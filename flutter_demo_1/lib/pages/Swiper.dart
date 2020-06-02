import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class SwiperDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("ExampleHorizontal"),
        ),
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network("https://cdn.nlark.com/yuque/0/2020/png/650644/1586404501037-avatar/dcbb5410-f31e-4ca3-9127-660cb5f48629.png?x-oss-process=image%2Fresize%2Cm_fill%2Cw_64%2Ch_64%2Fformat%2Cpng");
          },

          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: 3,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ));
  }
}