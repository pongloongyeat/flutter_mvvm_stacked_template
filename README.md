# Flutter MVVM Stacked Template

This is a work-in-progress starter project template which has been forked from [dumbdumb_flutter][dumbdumb_flutter] which consists of basic components that are commonly used across projects such as:
- Multiple flavours (development, staging, production)
- Firebase integration
- API calls
- Localization and more

This project adopts MVVM (Model-View-ViewModel) as the principle architecture. The difference between this template and [dumbdumb_flutter][dumbdumb_flutter] is that this template uses [stacked][stacked_link] for state management.

## Table of contents

- [Getting Started](#getting-started)
- [Project setup checklist](#project-setup-checklist)
- [State management](#state-management)
  - [The `Model` layer](#the-model-layer)
  - [The `View` layer](#the-view-layer)
  - [The `ViewModel` layer](#the-viewmodel-layer)
- [Working with the app](#working-with-the-app)
  - [Appconfig](#appconfig)
  - [Notifications](#notifications)
  - [Services](#services)
- [Code style](#code-style)
  - [`View` suffix](#view-suffix)
  - [`mixins`](#mixins)
- [Folder structure](#folder-structure)
- [Working with translations](#working-with-translations)
  - [Adding strings](#adding-strings)
  - [Adding supported locales](#adding-supported-locales)
  - [Adding translations](#adding-translations)
- [Tests](#tests)
- [Credits](#credits)

## Getting Started

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

## Project setup checklist

- [ ] Change bundle IDs (search for `com.example.` globally)
- [ ] Update App Icons
- [ ] Update App Name (if required)
- [ ] Setup keystore for Android
- [ ] Setup development team for iOS
- [ ] Setup [Firebase][firebase_link]

## State management

This template uses [stacked][stacked_link] as its state management tool. [stacked][stacked_link] encourages the use of MVVM by providing a `ViewModelBuilder` along with other helpful classes such as a `BaseViewModel`. This template also provides a `BaseViewModel` class that subclasses the `BaseViewModel` provided by [stacked][stacked_link] to add additional functionality.

### The `Model` layer

1. The model defines the data structure to be used. Oftentimes, this is the model you fetch from an API call.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_data_model.freezed.dart';
part 'example_data_model.g.dart';

@freezed
class ExampleDataModel with _$ExampleDataModel {
  factory ExampleDataModel({
    int? id,
    String? name,
    int? weight,
  }) = _ExampleDataModel;

  factory ExampleDataModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleDataModelFromJson(json);
}
```

2. A service class defines a set of API calls pertaining to a specific functionality (i.e. `ProductService`). A `BaseApiService` is provided to inherit some common features such as token refreshing.
    
```dart
class SomeApiService extends BaseApiService {
  Future<ResponseModel<ExampleDataModel>> fetchYourData() async {
    final response = await callApi(
      HttpRequestType.get,
      // '$baseUrl/path/to/your/api/endpoint',
      'https://pokeapi.co/api/v2/pokemon/ditto',
    );

    if (!response.hasError && response.hasData) {
      return ResponseModel.success(
        ExampleDataModel.fromJson(response.data!),
      );
    }

    return ResponseModel.error(response.error);
  }
}
```

3. The repository defines business logic for accessing the data source, such as combining multiple data sources into one or even filtering data (such as removing classes with null IDs) before passing it back to the `ViewModel`.

```dart
class CounterRepository extends BaseRepository with CounterRepositoryMixin {
  @override
  SomeApiService get apiService => SomeApiService();

  @override
  Future<ResponseModel<ExampleDataModel>> fetchDitto() {
    return apiService.fetchYourData();
  }
}
```

### The `View` layer

The `View` consists of both small, component-based widgets as well as full-paged widgets. A `BaseViewModelWidget` is provided for small, component-based widgets as well as a `BaseView` for full-paged widgets.

```dart
class CounterView extends BaseView<CounterViewModel> {
  const CounterView({super.key});

  @override
  CounterViewModel viewModelBuilder() {
    return CounterViewModel();
  }

  @override
  void onModelReady(BuildContext context, CounterViewModel viewModel) {
    viewModel
      ..initialise()
      ..showPlatformDialog = (title, content) =>
          showPlatformDialog(context, title: title, content: content);
  }

  @override
  Widget builder(BuildContext context, CounterViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.counterAppBarTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CounterText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ShowCountButton(),
                SizedBox(width: 8),
                ImageButton(),
                SizedBox(width: 8),
                ApiButton(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: viewModel.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: viewModel.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
```

### The `ViewModel` layer

1. A `ViewModel` acts as a bridge between the `View` and the `Model`, separating `View` and `Model` to segregate business logic from the UI by accepting events dispatched from the `View`.

2. A `ViewModel` should be able to serve multiple `View` classes (ensuring Extensibility and Maintainability).

```dart
class CounterViewModel extends BaseViewModel with CounterViewModelMixin {
  CounterViewModel();

  @override
  void initialise() {
    count = 0;
  }

  @override
  void increment() {
    count++;
    notifyListeners();
  }

  @override
  void decrement() {
    count--;
    notifyListeners();
  }

  @override
  Future<void> callApi() async {
    isApiLoading = true;
    notifyListeners();

    final response = await repository.fetchDitto();

    isApiLoading = false;
    notifyListeners();

    final data = response.data;

    return showPlatformDialog?.call(
      'Data',
      data?.toJson().toString() ?? 'Null data',
    );
  }
}
```

## Working with the app

TODO

### AppConfig

An `AppConfig` is provided to initialise services that you require throughout the app as well as for injection of said services. This AppConfig also sets up the flavour (e.g. for retrieval of correct API endpoint) based on which entry point file (`main_<flavour>.dart`) the app was launched from.

### [Firebase][firebase_link]

TODO

### Notifications

TODO

### Services

Services should be initialised and injected in the `AppConfig` and its dependency (`dependsOn`) managed if needed. The service can then be called using [get_it][get_it_link] i.e. `GetIt.instance<SomeService>()`.

## Code style

It is recommended to follow [VGV][very_good_ventures_link]'s code style which should be automatically enforced by your IDE due to the generated `analysis_options.yaml` file. However, this can be modified based on your project needs (i.e. disabling `lines_longer_than_80_chars`).

### `View` suffix

Don't use the keyword `View` in the suffix of a widget name unless the widget itself is a full-paged `Scaffold` widget.

### `mixins`

`mixins` should be used wherever possible to ensure reusability. An example is shown below

```dart
class SomeViewModel extends BaseViewModel with PaginatedViewModelMixin {
  List<SomeModel> data = [];

  @override
  Future<void> loadData() async {
    setBusy(true);

    final response = await someRepository.someApi(
        skip: currentPage * ApiDefaults.defaultLimit,
        limit: ApiDefaults.defaultLimit
    );

    if (response.hasData && response.data! != null) {
      data = response.data!.toList();
    }

    setBusy(false);
  }

  @override
  Future<void> loadMoreData() async { ... }
}
```

## Folder structure

TODO: Feature-first?

## Working with Translations

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:flutter_mvvm_stacked_template/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

## Tests

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

## Credits

A big thank you and shoutout to [VGV][very_good_ventures_link] for their work on [very_good_cli][very_good_cli_link] which was used to setup the project for flavouring and localisation support. A major thank you to [heickjack619lok] for his initial work on the [dumbdumb_flutter][dumbdumb_flutter] template for which this template is based upon.

[dumbdumb_flutter]: https://github.com/heickjack619lok/dumbdumb_flutter
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[firebase_link]: https://console.firebase.google.com/
[get_it_link]: https://pub.dev/packages/get_it
[heickjack619lok]: https://github.com/heickjack619lok
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[stacked_link]: https://pub.dev/packages/stacked
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
[very_good_ventures_link]: https://github.com/VeryGoodOpenSource