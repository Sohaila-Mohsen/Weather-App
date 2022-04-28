import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/views/home_page.dart';
import 'package:weather/views/loading_page.dart';

class SearchPage extends StatelessWidget {
  final searchController = TextEditingController();

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Lottie.asset("images/sun.json"),
            Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        focusColor: Color.fromARGB(255, 255, 98, 0),
                        hintText: "ex: cairo",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        print(searchController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoadingPage(
                                location: searchController.text,
                              ),
                            ));
                      },
                      icon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 255, 98, 0),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
