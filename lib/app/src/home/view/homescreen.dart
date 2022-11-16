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
      backgroundColor: Colors.black,
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
                title: const Text(
                  "MOVIES",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                background: Image.asset(
                  "assets/com-cerdillac-filmmaker-icon.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: FutureBuilder<List<Movie>?>(
          future: ApiserviceMovieList().movieListGetFunction(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 2.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => DetalisScreens(
                            movie: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FadeInImage(
                            placeholder: const AssetImage(
                              "assets/Loading-icon.gif",
                            ),
                            image: NetworkImage(
                              snapshot.data![index].image.original,
                            ),
                            height: 160,
                            width: 200,
                          ),
                          Text(
                            snapshot.data![index].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Something Wrong"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
