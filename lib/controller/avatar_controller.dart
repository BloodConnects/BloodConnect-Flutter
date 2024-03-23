import 'package:get/get.dart';

class AvatarController extends GetxController{
  RxInt selectedIndex = 0.obs;

  void onSelectedImage(int index){
    selectedIndex.value = index;
  }
}