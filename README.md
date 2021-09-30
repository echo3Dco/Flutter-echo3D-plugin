# echo3D Flutter Plugin

echo3D is a cloud-based 3D-first content management system (CMS) and delivery network (CDN) that provides network solutions to help scale augmented and virtual reality (AR/VR) applications. Our 3D-ready cloud platform helps manage & deliver 3D/AR/VR content to apps & devices everywhere.
This is a plugin which makes it easier to get your assets from echo3D.

## :book: Guide

#### 1. Setup the config file

Add echo3D plugin to your `pubspec.yaml`.
An example is shown below. 
```yaml
dev_dependencies:
  echoar_package: "^0.0.1+2"

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

## :mag: Explore echo3D
Now that you have your echo3D package ready, you can call it and start using echo3D with Flutter.
If you don't have an echo3D API key yet, make sure to register for FREE at [echo3D](https://console.echo3D.co/#/auth/register). 

To access your echo3D project, simply initialize your Flutter echo3D object:
```
EchoAR(apiKey: "<YOUR-API-KEY>");
```
Now your object is ready to go! 
Our open-source [example project](https://github.com/echo3Dco/Flutter-echo3D-plugin/tree/master/example) is available to keep exploring the echo3D and Flutter integration.

## :muscle: Support
Feel free to reach out at [support@echo3D.co](mailto:support@echo3D.co) or join our [support channel on Slack](https://go.echo3D.co/join). 
