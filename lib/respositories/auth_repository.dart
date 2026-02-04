import 'dart:convert';

import 'package:http/http.dart';
import 'package:providers_app/data/network/BaseApiServices.dart';
import 'package:providers_app/data/network/NetworkApiSerivices.dart';
import 'package:providers_app/respository/app_url.dart';

class
    AuthRepository {
  BaseApiSerivices _apiSerivices=NetworkApiSerivice();
  Future<dynamic>loginApi(dynamic data)async{
    try{

      dynamic response = await _apiSerivices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;

    }catch(e){
      throw e;
    }
  } Future<dynamic>registerApi(dynamic data)async{
    try{

      dynamic response = await _apiSerivices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;


    }catch(e){
      throw e;
    }
  }
}