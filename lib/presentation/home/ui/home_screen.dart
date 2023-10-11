import 'package:get/get.dart';
import 'package:hr_management/presentation/home/controller/home_controller.dart';

import '../../../core/app_export.dart';

class HomeScreen extends GetWidget<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Container(
        child: Center(
          child: Text('HomeScreen is working'),
        ),
      ),
    );
  }
}