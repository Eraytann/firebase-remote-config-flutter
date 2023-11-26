# firebase_firestore_project

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

In this project you will learn how to add remote config in your app on firebase.
Remote config means that you can send some updates into your application without sendind update on playstore so that user can see the latest updates. Firebase Remote Config is a cloud service that lets you change the behavior and appearance of your app without requiring users to download an app update. When using Remote Config, you create in-app default values that control the behavior and appearance of your app. Then, you can later use the Firebase console or the Remote Config backend APIs to override in-app default values for all app users or for segments of your user base. Your app controls when updates are applied, and it can frequently check for updates and apply them with a negligible impact on performance.

If you want to try it on your app please add the following packages into your flutter project:

  firebase_core: ^2.22.0
  firebase_auth: ^4.14.0
  firebase_storage: ^11.5.1
  firebase_remote_config: ^4.3.5
