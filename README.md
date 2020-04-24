

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

## GeoLocator

[Geolocator](https://pub.dev/packages/geolocator)

The geolocator package from pub.dev gets the location of the user using the
`getCurrentPosition` method. I also added a request note that asked the
permission to get the user's position.

```dart
void getLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
```

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
