import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/movie_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                controller: homeController.txtmovie,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          homeController.movie.value =
                              homeController.txtmovie.text;
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                    label: Text("Enter movie name",
                        style: TextStyle(color: Colors.black)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: homeController.callApi(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              height: 300,
                              width: 300,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    "${homeController.MovieList[0].show.image.medium}",
                                    fit: BoxFit.cover,
                                  )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          height: 280,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${homeController.MovieList[0].show.name}",
                                style: GoogleFonts.ptSerif(
                                    fontSize: 30, color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "(${homeController.MovieList[0].show!.summary})",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
