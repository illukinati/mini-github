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

## Demo

### User List Screen

● Display a list of users, each list item must include:

○ Profile image

○ Username

![1](https://github.com/user-attachments/assets/d5d76985-b0bc-4a8c-9387-80a8c6c27c25)

● Tapping an item navigates to the user repository screen

![2](https://github.com/user-attachments/assets/b0c702b1-09ea-4726-bb0f-86ae9ad2cd25)

● Display a fixed search input field at the top of the screen

● Display the list of users below the search field based on the entered keyword

![3](https://github.com/user-attachments/assets/0720871f-1cfe-4eeb-a7c6-f6e46aba2493)

### User Details Screen

● Display detailed user information at the top of the list:

○ Profile image

○ Username

○ Full name

○ Follower count

○ Following count

● Tapping a repository opens its web page

![4](https://github.com/user-attachments/assets/8272d454-f0d5-41eb-9d3a-7666690fa18e)

● Below that, display a list of the user’s repositories, excluding forked ones

○ Repository name

○ Programming language

○ Star count

○ Description

![5](https://github.com/user-attachments/assets/acf0d773-20d9-48d1-a71f-dd920a4c1a77)

● I added a sort function both ascending and descending

