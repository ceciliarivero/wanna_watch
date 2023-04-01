# Wanna Watch

This project is an app built using Flutter.

It was built as an assignment of the "Flutter Devcamp Womens Special 2023".

The purpose of it is to display movies fetched from the public API [The Movie DB](https://www.themoviedb.org/), and save movies to watch later in a Firestore database.

## Getting Started

You'll need to create a `.env` file with the needed environment variables. You can find the needed variables in `.env.example`.

You'll also need to create an account in The Movie DB in order to get an API key and use it as a value for `MOVIES_API_KEY` in the `.env` file.

Finally, you'll need to create a project in Firebase, use Firestore as database and follow the steps to configure Firebase in the project (this includes the step of adding to the project the `firebase_options.dart` file provided by Firebase).
Once that's done, you'll need to create a collection and use the collection name as a value for `WATCH_LIST_COLLECTION` in the `.env` file.

To start the app run:

```
flutter pub get
flutter run
```

## Some screenshots

### iOS

| Movies screen                                                      | Movie Details screen                                                      | Watch List screen                                                      |
| ------------------------------------------------------------------ | ------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| [![Movies screen](/screenshots/ios-1.png)](/screenshots/ios-1.png) | [![Movie Details screen](/screenshots/ios-2.png)](/screenshots/ios-2.png) | [![Watch List screen](/screenshots/ios-3.png)](/screenshots/ios-3.png) |

### Android

| Movies screen                                                              | Movie Details screen                                                              | Watch List screen                                                              |
| -------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| [![Movies screen](/screenshots/android-1.png)](/screenshots/android-1.png) | [![Movie Details screen](/screenshots/android-2.png)](/screenshots/android-2.png) | [![Watch List screen](/screenshots/android-3.png)](/screenshots/android-3.png) |
