import 'package:app_memorygame/app/controllers/home_controller.dart';
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
      backgroundColor: Color(0xFFe55870),
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
                itemCount: _game.gameImg!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(_game.cards_list[index]);
                      setState(() {
                        tries++;
                        _game.gameImg![index] = _game.cards_list[index];
                        _game.matchCheck.add({index: _game.cards_list[index]});
                      });
                      if (_game.matchCheck.length == 2) {
                        if (_game.matchCheck[0].values.first ==
                            _game.matchCheck[1].values.first) {
                          print("TRUE");
                          score += 100;
                          _game.matchCheck.clear();
                        } else {
                          print("FALSE");
                          Future.delayed(const Duration(milliseconds: 600), () {
                            setState(() {
                              _game.gameImg![_game.matchCheck[0].keys.first] =
                                  _game.hiddenCardpath;
                              _game.gameImg![_game.matchCheck[1].keys.first] =
                                  _game.hiddenCardpath;
                              _game.matchCheck.clear();
                            });
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(66, 255, 252, 70),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(
                            _game.gameImg![index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
