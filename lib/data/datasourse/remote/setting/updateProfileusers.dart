import 'dart:io';

import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class UpdateProfileUser {
  Crud crud;
  UpdateProfileUser(this.crud);

  updateData(Map data , [File? file]) async {
    var response = await crud.postRequestWithFile(AppLink.updateProfilrUser, data , file!);
    return response.fold((l) => l, (r) => r);
  }
   

    viewUserData(String email) async {
    var response = await crud.postData(AppLink.viewUserData, {
      "email" : email , 

     });
    return response.fold((l) => l, (r) => r);
  }

}
