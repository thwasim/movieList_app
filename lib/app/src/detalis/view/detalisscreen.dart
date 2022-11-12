import 'package:flutter/material.dart';
import 'package:movies_app/app/src/cast/view/castscreen.dart';
import 'package:movies_app/app/src/home/model/homemodel.dart';

class DetalisScreen extends StatelessWidget {
  const DetalisScreen({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: ListView(
          children: [
            SizedBox(
              height: 500,
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        movie.image.original,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      movie.summary,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => CastScreen(
                              movie: movie,
                            )));
                  },
                  child: Text("Cast Detalis")),
            )
          ],
        ),
      ),
    );
  }
}
