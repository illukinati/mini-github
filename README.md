# mini_github

A new Flutter project like GitHub.

I didn’t just build the application — I structured it using the principles of `DDD (Domain-Driven Design)` and `Clean Architecture`. This approach helps ensure that each layer of the application has a clear responsibility, making the codebase easier to maintain, scale, and test. The architecture is divided into layers such as Domain, Application, Infrastructure (Data), and Presentation, which promotes the separation of concerns and minimizes coupling between modules. 

Additionally, I implemented `unit testing` to verify the behavior of each component in isolation, ensuring that core business logic remains robust and reliable even as the app evolves.

## Flutter Environment

This is my Flutter environment:
```
flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.29.3, on macOS 15.4.1 24E263 darwin-arm64, locale en-JP)
[✓] Android toolchain - develop for Android devices (Android SDK version 35.0.1)
[✓] Xcode - develop for iOS and macOS (Xcode 16.3)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2024.3)
[✓] VS Code (version 1.99.3)
[✓] Connected device (4 available)
[✓] Network resources

• No issues found!
```
## Installation

After cloning this repository, please download the `.env` file that I will email to you. 
The file contains the GitHub token that will be used to access the GitHub API.
Put it inside the `root` folder of this project.

After that, copy and paste these codes into your terminal:
```

flutter create --platforms=android,ios .
flutter pub get

```
Note: Please delete `widget_test.dart` in the `test` folder to prevent error while testing. 
Now, you should be able to run on your device or simulator.

## Run and Testing

To run a Flutter project on your device/simulator, run this code on your terminal
```
flutter run
```

To test this Flutter project, run this code on your terminal
```
flutter test
```

## Packages

These are packages that I am using:

`fpdart`

> I use fpdart for functional programming concepts like Either, Option, and TaskEither. It helps me handle errors and asynchronous logic in a more predictable and declarative way.

`dio`

> dio is a powerful HTTP client. It supports interceptors, global configuration, form data, and file downloading, making it great for handling API requests efficiently.

`riverpod & flutter_riverpod`

> These are my state management tools of choice. They offer compile-time safety, scalability, and are test-friendly. Riverpod works well with clean architecture and DDD.

`freezed_annotation`

> Used with freezed, this helps me generate immutable data classes, unions, and pattern matching, reducing boilerplate and improving code maintainability.

`mocktail`

> I use mocktail for unit testing. It allows me to mock classes and verify interactions in a simple and Dart-friendly way without needing manual setup.

`go_router`

> go_router simplifies navigation and deep linking in Flutter. It supports nested routes, guards, and declarative configuration, ideal for larger apps.

`flutter_dotenv`

> This library lets me load environment variables from a .env file. It keeps API keys and sensitive config data out of the source code.

`intl`

> I use intl for localization and formatting dates, numbers, and currencies. It’s essential for building apps with multiple language support.

`url_launcher`

> url_launcher allows the app to open external URLs, send emails, or make phone calls—essential for many real-world app features.

`skeletonizer`

> UI skeleton loading is a technique used to enhance user experience during web or app loading.

## Demo

### User List Screen

● Display a list of users, each list item must include:

○ Profile image

○ Username

![list](https://github.com/user-attachments/assets/66b2b2a8-5de0-4cc1-98cc-e57889aa6b58)

● Tapping an item navigates to the user repository screen

![tap-to-detail](https://github.com/user-attachments/assets/941eff55-0b52-4371-96a4-dd002497a30a)


● Display a fixed search input field at the top of the screen

● Display the list of users below the search field based on the entered keyword

![search-user](https://github.com/user-attachments/assets/336c3839-c9f1-45d4-bfa1-f2f080b4dc7f)


### User Details Screen

● Display detailed user information at the top of the list:

○ Profile image

○ Username

○ Full name

○ Follower count

○ Following count

![detail-user](https://github.com/user-attachments/assets/da9b7aa1-0e9e-4d50-88d1-df8e8c67d55a)


● Tapping a repository opens its web page

![open-repo](https://github.com/user-attachments/assets/51fea41d-089a-48f3-8e04-e35697907eff)


● Below that, display a list of the user’s repositories, excluding forked ones

○ Repository name

○ Programming language

○ Star count

○ Description

![list-repo](https://github.com/user-attachments/assets/2486d8ac-0fbc-4df5-9f7f-7b428d9c9d2a)


● I added a sort function, both ascending and descending

![sorting](https://github.com/user-attachments/assets/32249c25-5658-4c13-b6c6-977cfd9041f4)


