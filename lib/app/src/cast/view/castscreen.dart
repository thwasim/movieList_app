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
                              PageRouteBuilder(
                                  pageBuilder: (context, animation, _) {
                                    return CharaterScreen(
                                      movie: snapshot.data![index],
                                    );
                                  },
                                  opaque: false),
                            );
                          },
                          child: Column(
                            children: [
                              item.character.image != null
                                  ? Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(80),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                item.character.image!.original,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const CircleAvatar(
                                      radius: 70,
                                      backgroundColor:
                                          Color.fromARGB(255, 117, 115, 108)),
                              Text(
                                item.character.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
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
