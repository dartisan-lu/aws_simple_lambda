import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

import 'post-request/calculate_request.dart';

void main() async {

  Runtime()
    ..registerHandler<AwsApiGatewayEvent>("calculate.addOnePost", CalculateRequest().addOnePostGateway)
    ..registerHandler<AwsApiGatewayEvent>("calculate.addOnePath", CalculateRequest().addOnePathGateway)
    ..registerHandler<AwsApiGatewayEvent>("calculate.addOneQuery", CalculateRequest().addOneQueryGateway)
    ..invoke();
}
