import 'package:flutter/material.dart';
import 'package:movies_app/app/service/detalis/cast.dart';
import 'package:movies_app/app/src/cast/model/model.dart';
import 'package:movies_app/app/src/cast/view/charater.dart';
import 'package:movies_app/app/src/home/model/homemodel.dart';

class CastScreen extends StatelessWidget {
  const CastScreen({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(movie.name),
            Expanded(
              child: FutureBuilder<List<MovieCast>?>(
                future: ApiServiceMoviCast().getMovieCast(movie.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 220,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final item = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => CharaterAnimation(
                                  movies: snapshot.data![index],
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    radius: 70,
                                    backgroundImage: NetworkImage(
                                      item.character.image!.original,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 8),
                                child: Text(
                                  item.character.name,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
