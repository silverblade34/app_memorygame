import 'package:get/get.dart';

class HomeController extends GetxController {
  final String hiddenCardpath = 'assets/memorygame/hidden.png';
  List<String>? gameImg;

  final List<String> cards_list = [
    'assets/memorygame/img1.jpeg',
    'assets/memorygame/img2.jpeg',
    'assets/memorygame/img3.jpeg',
    'assets/memorygame/img4.jpeg',
    'assets/memorygame/img5.jpeg',
    'assets/memorygame/img6.jpeg',
    'assets/memorygame/img1.jpeg',
    'assets/memorygame/img2.jpeg',
    'assets/memorygame/img3.jpeg',
    'assets/memorygame/img4.jpeg',
    'assets/memorygame/img5.jpeg',
    'assets/memorygame/img6.jpeg'
  ];

  List<Map<int, String>> matchCheck = [];

  final int cardCount = 12;

  void initGame() {
    cards_list.shuffle(); // Barajea los elementos de la lista
  }
}
