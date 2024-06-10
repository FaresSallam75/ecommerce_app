import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  addData(String usersid, String name, String city, String street, String latt,
      String long) async {
    var response = await crud.postData(AppLink.addAddress, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "latt": latt,
      "long": long
    });
    return response.fold((l) => l, (r) => r);
  }

  viewData(String usersid) async {
    var response =
        await crud.postData(AppLink.viewAddress, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  editData() async {
    var response = await crud.postData(AppLink.editAddress, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deleteAddress, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
