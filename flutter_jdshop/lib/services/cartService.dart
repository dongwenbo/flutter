import 'dart:convert';
import '../appConfig.dart';
import 'storage.dart';

class CartService {
  static addProductToCart(productItem) async {
    productItem = CartService.formatCartData(productItem);
    try {
      List productList = json.decode(await Storage.getString("productList"));
      bool hadData = productList.any((element) =>
      (element["_id"] == productItem["_id"] &&
          (element["selectAttrString"] == productItem["selectAttrString"])));
      if (hadData) {
        productList.forEach((element) {
          if (element["_id"] == productItem["_id"] &&
              (element["selectAttrString"] ==
                  productItem["selectAttrString"])) {
            element["count"] += 1;
            return;
          }
        });
        await Storage.setString("productList", json.encode(productList));
      } else {
        productList.add(productItem);
        await Storage.setString("productList", json.encode(productList));
      }
    } catch (e) {
      List productList = [];
      productList.add(productItem);
      await Storage.setString("productList", json.encode(productList));
    }
  }

  static Future<List> getProductListData() async {
    try {
      List productList = json.decode(await Storage.getString("productList"));
      return productList;
    } catch (e) {
      List productList = [];
      return productList;
    }
  }

//过滤数据
  static formatCartData(item){
    String picUrlString = AppConfig.domain +
        item.pic.replaceAll('\\', '/');
    final Map data = new Map<String, dynamic>();
    data['_id'] = item.sId;
    data['title'] = item.title;
    if (item.price is int || item.price is double) {
      data['price'] = item.price;
    } else {
      data['price'] = double.parse(item.price);
    }
    data['selectAttrString'] =
    item.selectAttrString == null ? "" : item.selectAttrString;
    data['count'] = item.selectCount;
    data['pic'] = picUrlString;
    //是否选中
    data['checked'] = true;
    return data;
  }

  static setProductListData(List productList) async {
    await Storage.setString("productList", json.encode(productList));
  }
}