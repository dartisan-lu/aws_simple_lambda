import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

import 'post-request/calculate_request.dart';

void main() async {

  Runtime()
    ..registerHandler<AwsApiGatewayEvent>("calculate.addOne", CalculateRequest().postApiGateway)
    ..invoke();
}
