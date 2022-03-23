# News App Demo in Flutter

#### Project done with the following tools, SDK and settings:
- Android Studio Bumblebee
- Flutter `2.8.1`
- Dart `2.15.1`

#### Instructions to run the project
- Clone the project.
- Do a `flutter pub get`.
- Project should run successfully after this.

#### Architecture design and consideration
A custom BLoC pattern is used without any plugins which uses `rxdart` to expose a stream of a data.
UI/View observes such streams from `BLoC` and reacts accordingly.