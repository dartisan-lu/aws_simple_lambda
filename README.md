# Dart, Flutter & AWS

![Attention](https://github.com/dartisan-lu/aws_simple_lambda/blob/master/images/aws1.jpeg?raw=true)


## Target

Deploying a Flutter Frontend to AWS S3 Bucket and communicating to a AWS Serverless Function for executing an operation.

WARNING: This is experimental code, be aware, services on AWS could generate costs !!! 

During reading different documentations and forums, the following I found the following hints as useful:

* Consider to use 2 way authenticated. (Be aware, hacker could use your account for example for crypto mining and generate high costs).
* Consider not to use your root account as working user, but to create a second account.
* Consider to create a Budget plan, even only to 1€, and receive a [NOTIFICATION-MAIL] when the limit is reached.
* Consider to remove all resources not needed or created for testing.

## Dart Serverless Function

https://www.serverless.com/plugins/serverless-dart

You need to have installed NodeJs and NPM for using this tool.

A new project can be initialized with:

```bash
$ npx serverless install \
  --url https://github.com/katallaxie/serverless-aws-dart \
  --name hello
```

CORS: 

When accessing the Lambda Function from a Web Browser, you need to define the CORS Header, in this case from a Static Website stored on the AWS S3.
```
 "Content-Type": "application/json",
 "Access-Control-Allow-Origin": "http://dartisan.s3-website-eu-west-1.amazonaws.com",
 "Access-Control-Allow-Methods": "GET, PUT, PATCH, POST, DELETE, OPTIONS",
 "Access-Control-Allow-Credentials": "true",
```

Also the tool is used to deploy and remove your function from AWS (see Makefile):

```
  npx serverless deploy
  npx serverless remove
```

Deploying and removing services need an AWS Token (NEVER share or commit Tokens in GIT !!!). You can add for example for mac as:

```
  export AWS_ACCESS_KEY_ID=XXXXXXXXX
  export AWS_SECRET_ACCESS_KEY=XXXXXXXXX
```

## Flutter Frontend

1. clone https://github.com/dartisan-lu/aws_simple_frontend.
2. Modify the URL to the created Lambda function.
```
  // TODO: Add URL for Lambda Service (with valid zone, if yours is not us-east-1)
  String lambdaUrl = 'https://XXXXXXXXXXXXXXX.execute-api.us-east-1.amazonaws.com/dev/add-one';
```
3. Run locally to validate the application.
4. Create AWS Bucket:
   - Deactivate Block all public access
   - Object Ownership (ACLs enabled)
5. Build Flutter Artifacts: flutter build web
6. Upload all files and subfolders from /build/web
7. Select all files, and under Actions change 
8. Under Properties (Bucket) Edit static website hosting enable it, and add index.html as home.

## Problems encounter:

When you try to access from your local PC to the AWS Lambda Function with the browser, CORS will block it with the message:

```
Error: XMLHttpRequest error.
dart-sdk/lib/_internal/js_dev_runtime/patch/core_patch.dart 963:28                get current
packages/http/src/browser_client.dart 69:22                                       <fn>
```

You may need to deactivate the security :

1. Stop all running applications
2. Go to flutter\bin\cache and remove a file named: flutter_tools.stamp
3. Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.
4. Find '--disable-extensions'
5. Add '--disable-web-security'
