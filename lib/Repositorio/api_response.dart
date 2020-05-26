import 'package:UNNA/Repositorio/api_error.dart';

class ApiResponse{

  ApiResponse.success({this.result}){
    success = true;
  }

  ApiResponse.error({this.result, ApiError error}){
    success = false;
  }

  bool success;
  dynamic result;
  ApiError error;

}