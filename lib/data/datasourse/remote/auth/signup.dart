import 'dart:io';

import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  signUpData(String username, String password, String email, String phone , [File? file ]) async {
    var response; 
    if(file == null) { 
       response = await crud.postData(AppLink.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    }else{
          response = await crud.postRequestWithFile(AppLink.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    } , file );     
    }
    return response.fold((l) => l, (r) => r);
  }
}
