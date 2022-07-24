import 'dart:io';

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

import 'model/calculate_request_model.dart';
import 'model/calculate_response_model.dart';

class CalculateRequest {

  final Handler<AwsApiGatewayEvent> postApiGateway = (context, event) async {
    final requestBody = event.body;
    final requestModel = CalculateRequestModel.fromJsonString(requestBody);

    final responseBody = CalculateResponseModel(
      value: requestModel.value + 1
    );

    final response = AwsApiGatewayResponse(
      body: CalculateResponseModel.toJsonString(responseBody),
      isBase64Encoded: false,
      statusCode: HttpStatus.ok,
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": "true",
      },
    );

    return response;
  };
}
