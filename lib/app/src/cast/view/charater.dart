import 'package:flutter/material.dart';
import 'package:movies_app/app/src/cast/model/model.dart';

class CharaterScreen extends StatelessWidget {
  const CharaterScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieCast movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 67, 66, 66),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.2,
          top: MediaQuery.of(context).size.height * 0.2,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
        ),
        child: Container(
          color: const Color.fromARGB(255, 226, 223, 216),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.black,
                child: Image.network(
                  movie.person.image.original,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie.person.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                movie.person.birthday
                    .toString()
                    .replaceFirst('00:00:00.000', ''),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                movie.person.country.name.toString().replaceFirst('Name.', ''),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                movie.person.gender.toString().replaceFirst('Gender.', ''),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
