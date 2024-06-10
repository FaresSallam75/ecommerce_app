

import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class FavoriteViewData {
  Crud crud;
  FavoriteViewData(this.crud);

  addFavorite(String usersid) async {
    var response = await crud.postData(AppLink.favoriteView, {
      "userid": usersid,  
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String favoriteId) async {
    var response = await crud.postData(AppLink.deleteFromfavorite, {
      "favoriteid": favoriteId,  
    });
    return response.fold((l) => l, (r) => r);
  }

  
}
