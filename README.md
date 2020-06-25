# echoAR Flutter Plugin

A plugin which makes it easier to get your assets from echoAR

## :book: Guide

#### 1. Setup the config file

Add echoAR plugin to your `pubspec.yaml`.
An example is shown below. 
```yaml
dev_dependencies:
  echoar_package: "^0.0.1"

```

#### 2. Get package

After setting up the configuration, all that is left to do is run the package.

```
flutter pub get
```

Now inside your Dart code you can import it.
```
import 'package:echoar_package/echoar_package.dart';
```

## :mag: Explore echoAR
Now that you have your echoAR package ready, you can call it and start using echoAR with Flutter.
If you don't have an echoAR API key yet, make sure to register for FREE at [echoAR](https://console.echoar.xyz/#/auth/register). 

To access your echoAR project, simply initialize your Flutter echoAR object:
```
EchoAR(apiKey: "<YOUR-API-KEY>");
```
Now your object is ready to go! 
[Our example](/exapmle) project is avalable for you to keep exploring echoAR Flutter plugin.

## Support
Feel free to reach out at [support@echoAR.xyz](mailto:support@echoAR.xyz) or join our [support channel on Slack](https://join.slack.com/t/echoar/shared_invite/enQtNTg4NjI5NjM3OTc1LWU1M2M2MTNlNTM3NGY1YTUxYmY3ZDNjNTc3YjA5M2QyNGZiOTgzMjVmZWZmZmFjNGJjYTcxZjhhNzk3YjNhNjE). 
