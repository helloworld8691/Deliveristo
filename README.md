## INTRO
- Software architecture: MVVM
- State management with provider (https://pub.dev/packages/provider)
- navigation management with auto_route (https://pub.dev/packages/auto_route)
- Dependency Injection: injectable(https://pub.dev/packages/injectable), get_it (https://pub.dev/packages/get_it)
- OOP & SOLID principle implement

## Explanation
- There are 3 parts in each screen.
  All screens are included in lib/ui, and each screen has 3 parts (interactor, viewmodel, screen)
  For example, there are 3 files, interactor.dart, viewmodel.dart, screen.dart in lib/ui/dashboard
  - interactor.dart is used to communicate between API layer and view model. 
  - viewmodel.dart is used to implement business logic of dashboard screen. 
  - scree.dart is UI
  interactor, viewmodel and screen are inherited from base_interactor, base_viewmodel, and base_view.
  The dependencies between interactor, viewmodel and screen are implemented using injectable and get_it libraries
- flutter_screenutil (https://pub.dev/packages/flutter_screenutil)
  With this library, we can build responsible UI
- device_preview(https://pub.dev/packages/device_preview)
  With this library, we can test app UI in different screen size