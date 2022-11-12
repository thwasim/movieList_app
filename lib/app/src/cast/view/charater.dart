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
      body: SafeArea(
          child: Column(
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
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            movie.person.birthday.toString().replaceFirst('00:00:00.000', ''),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            movie.person.country.name.toString().replaceFirst('Name.', ''),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            movie.person.gender.toString().replaceFirst('Gender.', ''),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      )),
    );
  }
}
