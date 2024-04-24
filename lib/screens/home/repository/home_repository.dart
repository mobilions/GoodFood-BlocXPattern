import 'package:sample_project/dependencies/advanced_drawer/flutter_advanced_drawer.dart';
import 'package:sample_project/screens/home/repository/home_service.dart';

class HomeRepository {
  final HomeService homeService;
  HomeRepository(this.homeService);

  AdvancedDrawerController advancedDrawerController =
      AdvancedDrawerController();
  int selectedCategory = 0;
}
