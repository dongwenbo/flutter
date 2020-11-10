
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../services/cartService.dart';

class CartProvider with ChangeNotifier {
  List _cartList = [];
  bool _isSelectAll = true;
  double _totalPrice = 0;
  List get cartList => this._cartList;
  bool get isSelectAll => this._isSelectAll;
  double get totalPrice => this._totalPrice;

  CartProvider() {
    this._configData();
    this.judgeSelectAllState();
  }

  _configData() async {
    _cartList = await CartService.getProductListData();
    notifyListeners();
  }

  updateCartListData() async {
    _cartList = await CartService.getProductListData();
    this.countTotalPrice();
    notifyListeners();
  }

  changeCartListData() {
    this.countTotalPrice();
    CartService.setProductListData(this._cartList);
    notifyListeners();
  }

  changeSelectAllState(bool isSelectAll) {
    this._isSelectAll = isSelectAll;
    this._cartList.forEach((element) {
      element["checked"] = isSelectAll;
    });
    this.changeCartListData();
  }

  judgeSelectAllState() {
    if (this._cartList.length > 0) {
      this._isSelectAll =
          this._cartList.every((element) => element["checked"] == true);
    } else {
      this._isSelectAll = false;
    }
    notifyListeners();
  }
  
  countTotalPrice() {
    double totalPrice = 0;
    this._cartList.forEach((element) {
      if(element["checked"] == true) {
        totalPrice += element["price"] * element["count"];
      }
    });
    this._totalPrice = totalPrice;
  }

  deleteSelectedCartItem() {
    List tempList = [];
    this._cartList.forEach((element) {
      if (element["checked"] == false) {
        tempList.add(element);
      }
    });
    this._cartList = tempList;
    this.changeCartListData();
  }
}