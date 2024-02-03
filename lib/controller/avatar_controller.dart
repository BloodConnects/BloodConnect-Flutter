import 'package:get/get.dart';

class AvatarController extends GetxController{
  RxInt selectedIndex = 1.obs;

  void onSelectedImage(int index){
    selectedIndex.value = index;
  }
}