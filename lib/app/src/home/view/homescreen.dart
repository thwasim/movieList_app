import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_app/app/service/home/homeservice.dart';
import 'package:movies_app/app/src/detalis/view/detalisscreen.dart';
import 'package:movies_app/app/src/home/model/homemodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<Movie>? moviList = [];

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    fetchMove();
  }

  fetchMove() async {
    moviList = await ApiserviceMovieList().movieListGetFunction();
    log(moviList.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  expandedHeight: 380,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: const Text("MOVIES",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      background: Image.asset(
                        "assets/com-cerdillac-filmmaker-icon.png",
                        fit: BoxFit.cover,
                      ))),
            ];
          },
          body: FutureBuilder<List<Movie>?>(
              future: ApiserviceMovieList().movieListGetFunction(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.0,
                            mainAxisSpacing: 7.0),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>  DetalisScreen(movie: snapshot.data![index],)));
                        },
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.network(
                                  snapshot.data![index].image.original,
                                  height: 160,
                                  width: 200,
                                ),
                                Text(
                                  snapshot.data![index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Samething Worng"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
