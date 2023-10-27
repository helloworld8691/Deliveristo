import '../ui/dashboard/viewmodel.dart';

class Utils {
  static String getMenuTitle(Menu item) {
    switch (item) {
      case Menu.byBreed:
        return '1- Random image by breed\n2- Images list by breed';
      case Menu.bySubBreed:
        return '3- Random image by breed and sub breed\n4- Images list by breed and sub breed';
    }
  }
}