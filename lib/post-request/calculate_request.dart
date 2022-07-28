import 'dart:io';

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

import 'model/calculate_request_model.dart';
import 'model/calculate_response_model.dart';

class CalculateRequest {

  final Handler<AwsApiGatewayEvent> addOnePostGateway = (context, event) async {
    final requestBody = event.body;
    final requestModel = CalculateRequestModel.fromJsonString(requestBody);

    final responseBody = CalculateResponseModel(
      value: requestModel.value + 1
    );

    final response = AwsApiGatewayResponse(
      body: CalculateResponseModel.toJsonString(responseBody),
      // isBase64Encoded: false,
      statusCode: HttpStatus.ok,
       headers: {
         "Content-Type": "application/json",
         "Access-Control-Allow-Origin": "http://dartisan.s3-website-eu-west-1.amazonaws.com",
         "Access-Control-Allow-Methods": "GET, PUT, PATCH, POST, DELETE, OPTIONS",
         // "Access-Control-Allow-Headers": "*", THIS WAS WRONG, HAD TO REMOVE
         "Access-Control-Allow-Credentials": "true",
       },
    );

    return response;
  };

  final Handler<AwsApiGatewayEvent> addOnePathGateway = (context, event) async {
    final params = event.pathParameters;
    var value = params.isNotEmpty && params.containsKey('value') ? int.parse(params['value']) : 0;

    final responseBody = CalculateResponseModel(
        value: value + 1
    );

    final response = AwsApiGatewayResponse(
      body: CalculateResponseModel.toJsonString(responseBody),
      statusCode: HttpStatus.ok,
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "http://dartisan.s3-website-eu-west-1.amazonaws.com",
        "Access-Control-Allow-Methods": "GET, PUT, PATCH, POST, DELETE, OPTIONS",
        // "Access-Control-Allow-Headers": "*", THIS WAS WRONG, HAD TO REMOVE
        "Access-Control-Allow-Credentials": "true",
      },
    );

    return response;
  };

  final Handler<AwsApiGatewayEvent> addOneQueryGateway = (context, event) async {

    final params = event.queryStringParameters;
    var value = params.isNotEmpty && params.containsKey('value') ? int.parse(params['value']) : 0;

    final responseBody = CalculateResponseModel(
        value: value + 1
    );

    final response = AwsApiGatewayResponse(
      body: CalculateResponseModel.toJsonString(responseBody),
      statusCode: HttpStatus.ok,
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "http://dartisan.s3-website-eu-west-1.amazonaws.com",
        "Access-Control-Allow-Methods": "GET, PUT, PATCH, POST, DELETE, OPTIONS",
        // "Access-Control-Allow-Headers": "*", THIS WAS WRONG, HAD TO REMOVE
        "Access-Control-Allow-Credentials": "true",
      },
    );

    return response;
  };
}
