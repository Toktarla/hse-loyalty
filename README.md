# HSE Loyalty

A Flutter application using clean architecture with BLOC pattern.

## Folder Structure

The project follows a structured approach to organize code based on clean architecture principles and BLOC pattern:
lib/
├── data/
│   ├── models/
│   ├── repositories/
│   ├── datasource/remote(api services)
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── blocs/
│   ├── pages/
│   ├── widgets/
│   └── cubits/
└── injection_container.dart
└── main.dart


## Dependencies

This project uses various Flutter packages to enhance functionality:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  font_awesome_flutter: ^10.6.0
  flutter_bloc: ^8.1.3
  shared_preferences: ^2.2.2
  file_picker: ^6.1.1
  flutter_screenutil: ^5.9.0
  get_it: ^7.6.4
  http: ^1.1.0
  url_launcher: ^6.2.1
  equatable: ^2.0.5
  cached_network_image: ^3.3.0
  dio: ^5.3.4
  retrofit: ^4.0.3
  syncfusion_flutter_pdfviewer: ^26.1.38
  go_router: ^14.1.1
  device_preview:
```

## Development Dependencies

For development and testing purposes, additional dependencies are included:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  flutter_launcher_icons: "^0.13.1"
  retrofit_generator: ^8.0.4
  build_runner: ^2.4.6
```

## How to Install Dependencies

To install dependencies, run the following command in your project directory:

``` flutter pub get ```

## Adding Functionality
To add new functionality to your Flutter app using clean architecture, follow these steps:

1. Create an Interface Repository in the Domain Layer
   In the lib/domain/repositories/ directory, create an interface for your repository. This interface will define the methods that will be implemented in the data layer.

```
abstract class ExampleRepository {
  Future<ExampleEntity> getExampleData();
}
```

2. Create an Entity
   In the lib/domain/entities/ directory, create an entity class that represents the data model.

```
class ExampleEntity {
  final String data;

  ExampleEntity({required this.data});
}
```

3. Create an API Service using Retrofit
   In the lib/data/services/ directory, create an API service using Retrofit.

```
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'example_service.g.dart';

@RestApi(baseUrl: "https://api.example.com")
abstract class ExampleService {
  factory ExampleService(Dio dio, {String baseUrl}) = _ExampleService;

  @GET("/example")
  Future<ExampleModel> getExampleData();
}

```

4. Generate Retrofit Code
   Run the following command to generate the Retrofit code:
```
flutter pub run build_runner build
```

5. Implement the Repository in the Data Layer
   In the lib/data/repositories/ directory, create a repository implementation that extends the interface repository created in the domain layer.
```
import 'package:example_app/domain/repositories/example_repository.dart';
import 'package:example_app/data/services/example_service.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleService exampleService;

  ExampleRepositoryImpl(this.exampleService);

  @override
  Future<ExampleEntity> getExampleData() async {
    final model = await exampleService.getExampleData();
    return ExampleEntity(data: model.data);
  }
}
```

6. Create Use Cases
   In the lib/domain/usecases/ directory, create use cases that will use the repository.

```
abstract class UseCase<Type,Params> {
  Future<Type> call({Params params});
}

class GetExampleData implements UseCase<DataState<T>,T> {
  final ExampleRepository repository;

  const GetExampleData(this.repository);

  @override
  Future<DataState<T>> call({T? params}) {
    return repository.getExampleData(params!);
  }
}
```

7. Create BLoC
   In the lib/presentation/blocs/ directory, create a BLoC that uses the use cases. Define the states and events for the BLoC.

## Dependency Injection

### Using GetIt Locator

This project uses the `GetIt` locator for dependency injection, which leverages the singleton pattern to manage instances of your classes, services, repositories, and BLoCs/Cubits.

### Setting Up Dependency Injection

Do not forget to register your classes, services, repositories, and BLoCs/Cubits. This is done by configuring the `GetIt` locator, usually in a file like `injection_container.dart`. The setup includes registering instances and factories that can be accessed throughout your application.

### How to Access Registered Classes

Once you have registered your dependencies with `GetIt`, you can access them from anywhere in your codebase. Here's how you can do it:

1. **Registering a Service:**
   ```dart
   final sl = GetIt.instance;

   sl.registerSingleton<YourService>(YourService());


## Dependency Injection

### Using GetIt Locator

This project uses the `GetIt` locator for dependency injection, which leverages the singleton pattern to manage instances of your classes, services, repositories, and BLoCs/Cubits.

### Setting Up Dependency Injection

Do not forget to register your classes, services, repositories, and BLoCs/Cubits. This is done by configuring the `GetIt` locator, usually in a file like `injection_container.dart`. The setup includes registering instances and factories that can be accessed throughout your application.

### How to Access Registered Classes

Once you have registered your dependencies with `GetIt`, you can access them from anywhere in your codebase. Here's how you can do it:

1. **Registering a Service:**
   ```dart
   final sl = GetIt.instance;
   sl.registerSingleton<YourService>(YourService());
1. **Accessing a Registered Service:**
   ```dart
   final yourService = sl<YourService>();


## Future Enhancements

### Debouncer for TextField
To prevent the `onChanged` method from being called every time the user types something, you can implement a debouncer. This will optimize performance by reducing the number of times the callback is triggered.

### Theme Changing
You can implement theme changing using Cubit by creating a `ThemeCubit` with a `ThemeData` state. Use a `theme.dart` file in the project to define the light theme and create a `darkTheme` variable for the dark theme.

### Notifications
You can use Firebase Messaging and the Local Notification plugin to implement notifications in the app. This will allow you to send and receive notifications effectively.

### Code Optimization
Optimize the code by creating reusable widgets. While I've tried to create widgets as much as possible, there are some cases where this hasn't been done. Refactoring the code to use more widgets will enhance maintainability and readability.

### Entity Behavior
Entities should not have behavior like `fromJson`, `toModel`, or `toJson`. This should be implemented inside the model by extending the entity and using polymorphism to add behavior. Be cautious as in some cases this might not have been followed strictly to clean architecture concepts.

### Better validation while posting requestBody
Implement better validation when we save some form

### Unfocus textfield when you quit it

Feel free to adjust the folder structure and content according to your specific project needs and preferences. This structure and information should provide a solid foundation for understanding how your Flutter app is organized with clean architecture and BLoC pattern.







