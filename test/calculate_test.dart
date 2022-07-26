import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:aws_simple_lambda/post-request/calculate_request.dart';
import 'package:aws_simple_lambda/post-request/model/calculate_request_model.dart';
import 'package:aws_simple_lambda/post-request/model/calculate_response_model.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () async {

    var request = CalculateRequestModel();
    request.value = 1;

    Context context = Context(handler:"handler" ,requestId: "requestId");
    AwsApiGatewayEvent event = AwsApiGatewayEvent(body: CalculateRequestModel.toJsonString(request));

    var result = await CalculateRequest().addOnePostGateway(context, event);
    var rtn = CalculateResponseModel.fromJsonString(result.body);

    expect(rtn.value, equals(2));
  });

  test('uri', () async {

    var url = Uri.parse('https://XXXXXXXXXXXX.execute-api.eu-west-1.amazonaws.com/dev/add-one?value=1');
    var value = int.parse(url.queryParameters['value']);
    print(value);
  });
}
