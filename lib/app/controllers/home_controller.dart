import 'package:get/get.dart';

class HomeController extends GetxController {
  final String hiddenCardpath = 'assets/memorygame/hidden.png';
  List<String>? gameImg;
  final int cardCount = 8;

  void initGame(){
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
