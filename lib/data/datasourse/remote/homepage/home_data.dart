import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class HomePageData {
  Crud crud;
  HomePageData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchItems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
