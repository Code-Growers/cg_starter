# cg_starter

A new Flutter project initialized with libraries and code approved by Code Growers s.r.o.

## Startup

Before first start you need to run:
1) `flutter pub run build_runner build`

## Project structure

### A typical top-level directory layout

    .
    ├── build                   # Compiled files
    ├── i18n                    # Localization files
    ├── assets                  # Asset files
    ├── docs                    # Documentation files
    ├── ios                     # iOS specific files
    ├── android                 # Android specific files
    ├── lib                     # Source files
    ├── test                    # Automated tests
    └── README.md               # Information about how to launch application, necessary steps of configuration etc.

### Asset files (assets)

    .
    ├── fonts                   # Custom fonts
    ├── icons                   # Mostly .svg files
    └── images                  # Basically anything thats isn't an icon
    
### Source files (lib)

    .
    ├── bloc                    # Bloc files, each bloc part should be separated into its own file
    |    ├── bloc.dart          # Containing main bloc logic with mapEventToState function
    |    ├── event.dart         # Event classes that bloc should be able to react to
    |    └── state.dart         # Possible bloc state classes
    ├── constants               # Static and constant data. Could be list of urls, routes w/e
    ├── env                     # env files. In cases where we need specific configuration for either development and production builds
    ├── extensions              # Extension files specific for application use cases. Non-specific extensions should me moved into shared repository
    ├── models                  # Model classes
    ├── repositories            # Repositories (layer that handles API request or dealing with local storage)
    ├── screens                 # Each application screen should have its own screen file
    ├── theme                   # Theme file containing everything that has to do something with theming
    ├── utils                   # Utility files specific for application use cases. Non-specific utilities should me moved into shared repository
    ├── widgets                 # Application widgets. Logical structure should follow their contexts. Can be nested as much as needed. But be careful there is something fishy about nesting that is more than two levels deep
    └── main.dart               # Starting point of whole application. Should contains main() function

## Libraries

#### State management

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) - Even tho it might take a little more to get used to BloC pattern allows us to easily separate logic from UI even in big applications. For that BloC is our go to technology and should be used everywhere where it makes sense.

#### Http

- [Dio](https://pub.dev/packages/dio) - A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.

#### Data storage

- [Hive](https://pub.dev/packages/hive) - Lightweight and blazing fast key-value database. No more unsecure local storage.

#### UI

- [Shimmer](https://pub.dev/packages/shimmer) - An easy way to add shimmer effect. Much fancier than showing ugly spinning loader or anything else.
- [Gap](https://pub.dev/packages/gap) - Go to solution for making layout more readable using easy to use whitespace widgets.
- [Flutter screen utils](https://pub.dev/packages/flutter_screenutil) - Recommended solution to make flutter apps responsive to have that pixel perfect app.
- [Network image](https://pub.dev/packages/cached_network_image) - Show images from the internet and keep them in the cache directory. When loading assets from an internet this is a go to solution.
- [Flutter conditional rendering](https://pub.dev/packages/flutter_conditional_rendering) - Stop ugly if statements inside of our UI with this readable conditional rendering widgets.
- [Flash](https://pub.dev/packages/flash) - Because it's always good to have a nice way to display that snackbar to user.
- [Simple animations](https://pub.dev/packages/simple_animations) - It's always good to save time when doing simple animations.

#### Serialization

- [json annotation](https://pub.dev/packages/json_annotation) - Because nobody has time to write that `toJson` and `fromJson` methods. Not will it be allowed.
- [json serializable](https://pub.dev/packages/json_serializable) - Because nobody has time to handwrite json serialization methods.

#### Utils 

- [Device preview](https://pub.dev/packages/device_preview) - Approximate how your app looks and performs on another device. Go to solution for responsive layout testing.
- [Device info](https://pub.dev/packages?q=device_info) - Because it is always useful to have that knowledge about users device.
- [Equatable](https://pub.dev/packages/equatable) - Let's make equality checking easy again inside of our little immutable world.
- [Dartx](https://pub.dev/packages/dartx) - These extensions can and will save you a lot of time.
- [Uuid](https://pub.dev/packages/uuid) - Never use dirty old math.random when in need of unique values.

#### Logging

- [Logger](https://pub.dev/packages/logger) - Lets make that logging pretty.

#### Localization

- [Flutter i18n](https://pub.dev/packages/flutter_i18n) - Easy to use solution with translation located inside of json files.
