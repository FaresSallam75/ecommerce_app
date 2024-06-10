

import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartAdd, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartDelete, {
       "usersid": usersid,
       "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartGetCount, {
       "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartView, {
       "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response = await crud.postData(AppLink.couponCheck, {
       "couponname": couponName,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCoupon() async {
    var response = await crud.postData(AppLink.couponView, {   
    });
    return response.fold((l) => l, (r) => r);
  }
}
