import 'package:app_memorygame/app/controllers/home_controller.dart';
import 'package:flip_card/flip_card.dart';
import 'package:app_memorygame/app/pages/widgets/score_board.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _game = HomeController();

  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 183, 185),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                "Juego de memoria",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                scoreBoard("Intentos", "$tries"),
                scoreBoard("Puntos", "$score")
              ],
            ),
            SizedBox(
              height: screenHeight - 300,
              width: screenWidth,
              child: GridView.builder(
                itemCount: _game.cards_list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => FlipCard(
  
                  fill: Fill.fillBack,
                  direction: FlipDirection.HORIZONTAL,
                  side: CardSide.FRONT,
                  back: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 113, 98, 155),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(
                          _game.hiddenCardpath,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  front: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 113, 98, 155),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(
                          _game.cards_list[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  autoFlipDuration: const Duration(seconds: 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
