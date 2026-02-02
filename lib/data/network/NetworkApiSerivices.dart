import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:providers_app/data/app_excaptions.dart';
import 'package:providers_app/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;


class NetworkApiSerivice extends BaseApiSerivices{
  @override
  Future<dynamic> getGetApiResponse(String url) async{
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = retunResponse(response);
    }

    on SocketException {
      throw FetchDataException('No Internet Connetion');
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(String url , dynamic data) async{
    dynamic responseJson;

    try {
      Response response = await post(
        Uri.parse(url),
        body: data
      ).timeout(Duration(seconds: 10));
      responseJson = retunResponse(response);
    }

    on SocketException {
      throw FetchDataException('No Internet Connetion');
  }

    return responseJson;
}
  dynamic retunResponse (http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw InvalidInputException(response.body.toString());
        default:
              throw FetchDataException('error ' + 'with status code' +response.statusCode.toString());

    }
  }
  }

