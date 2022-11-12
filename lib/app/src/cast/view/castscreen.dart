import 'package:flutter/material.dart';
import 'package:movies_app/app/service/detalis/cast.dart';
import 'package:movies_app/app/src/cast/model/model.dart';
import 'package:movies_app/app/src/home/model/homemodel.dart';

class CastScreen extends StatelessWidget {
  const CastScreen({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(movie.name),
              Expanded(
                child: FutureBuilder<List<MovieCast>?>(
                  future: ApiServiceMoviCast().getMovieCast(movie.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Image.network(
                                    "",
                                  ),
                                ),
                              ),
                              Card(
                                shadowColor: Colors.black,
                                elevation: 10,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        'Name',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
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
      ),
    );
  }
}
