

# Clima ☁

## Goal

The objective of this tutorial is to learn about asynchronous programming in Dart. We'll look at how to carry out time consuming tasks such as getting device location and networking to get data from the internet. 


## What I will learn

- How to use Dart to perform asynchronous tasks.
- Understand async and await.
- Learn about Futures and how to work with them.
- How to network with the Dart http package.
- What APIs are and how to use them to get data from the internet.
- What JSONs are and how to parse them using the Dart convert package.
- How to pass data forwards and backwards between screens using the Navigator.
- How to handle exceptions in Dart using try/catch/throw.
- Learn about the lifecycle of Stateful Widgets and how to override them.
- How to use the Geolocator package to get live location data for both iOS and Android.
- How to use the TextField Widget to take user input.

---
---

# GeoLocator 📍

[Geolocator](https://pub.dev/packages/geolocator)

The geolocator package from pub.dev gets the location of the user using the
`getCurrentPosition` method.

The first step is to add geolocator to the `pubspec.yaml` file as a dependency.

```yaml
dependencies:
  geolocator: ^5.3.1
```

Next, I imported geolocator at the top of my file.

```
import 'package:geolocator/geolocator.dart';
```

To get the location, I used the `getCurrentPosition` method with a low accuracy.

```dart
void getLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
```

I also added a request note that asked the
permission to get the user's position.

### Request Note for iOS

The file to place the request is called `Info.plist`.

Location: ios/Runner/Info.plist

```
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>This app needs access to location when open.</string>
```

### Request Note for Android

The file to place the request is called `AndroidManifest.xml`.

Location: android/app/src/main/AndroidManifest.xml

```
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```
---
---

# Async Programming 🕒

Async programming is when multiple requests are sent out and the user doesn't have to wait for the result to occur before moving on. For example, a multiple requests could be running at the same time and the results don't have to appear chronologically.

Future keyword is assigned to a variable that will exist in the future. At
the moment of creation, it is empty like a receipt. Later, it is assigned
to a value. The angle brackets represent the type of variable it will be.

```
Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
 
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
  });

  return result;

}
```

# Sync Programming

Synchronous programming is when the result of a request has to be finished
BEFORE moving on to the next request. Sync programming is useful when the user has to get the result of one function and input it in another function.

```
void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete $task2Data');
}
```

# Await ✋

Await is used in async programming when the user needs to wait for a result to appear before moving on in the code.

```
await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  
```

---
---

# Widget Life Cycle ♻️

Widget lifecycle is how a widget is created, runs and then destroyed.

### initState

This method is called when the stateful widget is created and is the first step of the lifecycle.

### build

The second step is the build method which builds a new widget every time the stateful widget is changed.

### deactivate

Lastly, the deactivate method calls for the destruction of the widget.

---
---

# Exception Handling

Exception handling is made of 3 components that check to see if there is an
exception and how to deal with it.

### Try

The try component checks if a piece of code will have an exception at the
time the code runs. It's similar to an if statement.

```dart
try {
    double myStringAsDouble = double.parse(myString);
    print(myStringAsDouble);
  }
```
### Catch

The catch component runs if the try component finds an exception. The code
defaults to the catch if there is an error.

```dart
catch (e) {
    print(e);
  }
```

### Throw

Lastly, the throw component ensures that the code will produce an exception(error)
 if the user performs an illegal operation.

```dart
if (i < 10) {
  throw {
    print('i cannot be less than 10');
  }
}
```

---
---

# Private Variables

An underscore that starts the name of a variable indicates that it is a private
variable.

```dart
_LoadingScreenState createState() => _LoadingScreenState();
```
---
---

# API

API, or Application Programming Interface, is used to create own software
or interact with external database. The RESTful API is a standard way of accessing data using HTTP requests. THe four main methods are GET, PUT, POST, and DELETE. In my Clima App, I used the [Open Weather API](https://openweathermap.org/current) and the GET request.

For the Open Weather API I need to use a key so that I can access the
information on their database. Here is a sample code of an API call.

```
https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02
```

# http package

The http package is a way to create requests and responses to the external server. For example, I created a `get` request and a `Response` variable using the http package.

[Http Package](https://pub.dev/packages/http)

```dart
 http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
```
---
---

# jsonDecode

jsonDecode can be used to decode json data and access certain key types.
For instance, I accessed city name and temperature from the json data using jsonDecode.

```dart
var decodedData = jsonDecode(data);
String city = decodedData['name'];
```