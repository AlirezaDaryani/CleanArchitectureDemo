# CleanArchitectureDemo

A Demo Flutter project that used Bloc for state managment and Implemented by Clean Architecture 

## Getting Started

1. Open project
2. add ```.env``` file to root of the project that should be like:

```
baseURL = BASE_URL
apiKey = YOUR_KEY
```
3. Open terminal and run below scripts by order
   
   ```flutter pub get```
   
   ```dart run build_runner build```
5. It should remove all errors on lib/utils/env.dart and create a new class named env.g.dart at the same directory
6. When all issues has been gone, you can run unit tests with below command in terminal 

``` flutter test```

7. If all tests passed, You can connect your phone or open your emulator or simulator to run the app with

``` flutter run```

### Notice

App includes Firebase for anonymous sign-in with all required files



