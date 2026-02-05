import 'dart:convert';

import 'package:http/http.dart';
import 'package:providers_app/data/network/BaseApiServices.dart';
import 'package:providers_app/data/network/NetworkApiSerivices.dart';
import 'package:providers_app/respository/app_url.dart';

class
    AuthRepository {
  final BaseApiSerivices _apiServices=NetworkApiSerivice();
  Future<dynamic>loginApi(dynamic data)async{
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;

    }catch(e){
      rethrow;
    }
  } Future<dynamic>signUpApi(dynamic data)async{
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;


    }catch(e){
      rethrow;
    }
  }
}