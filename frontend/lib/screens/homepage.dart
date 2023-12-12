// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projecto/models/productModel.dart';
import 'package:http/http.dart' as http;
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:projecto/screens/detail.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _bottomNavIndex = 0; //default index of a first screen
  final iconList = <IconData>[
    Icons.home,
    Icons.book,
    Icons.message_outlined,
    Icons.person
  ];

  int isLoaded = 0;
  List<productModel> booksList = [];

  getAllBooks() async {
    try {
      booksList = [];
      isLoaded = 0;
      String path = 'http://192.168.1.105:8000/getBooks';
      final response = await http.get(Uri.parse(path));

      if (response.statusCode == 200) {
        List ResponseAfterDecode = jsonDecode(response.body);
        for (var per in ResponseAfterDecode) {
          booksList.add(productModel.fromJson(per));
        }

        if (booksList.isEmpty) {
          isLoaded = 3;
        } else {
          isLoaded = 1;
        }
      } else {
        isLoaded = 2;
      }
    } catch (e) {
      print('Error fetching data: $e');
      isLoaded = 2; // Set an error state if there's an exception
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(
          Icons.search,
          color: Colors.amber,
        ),
        backgroundColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
      backgroundColor: Color.fromRGBO(247, 221, 181, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child: Image(
                  image: AssetImage('assets/book.jpg'),
                  width: 70,
                  height: 85,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  Text(
                    'Dhaka, Banassre',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 20),
              child: Container(
                height: 50,
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(242, 243, 242, 1),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: 'Search Store',
                  ),
                ),
              ),
            ),
            Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 3.5,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  productModel book = booksList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailedProduct(id: book.id!),
                          ));
                      print('Clicked: ${book.id}');
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Container(
                        height: 260,
                        width: 180,
                        decoration: BoxDecoration(
                            // color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30)),
                        child: Stack(
                          children: [
                            Container(
                              height: 230,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(30)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: CachedNetworkImage(
                                  imageUrl: book.bookImagePath!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        height: 20,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: book.isAvailable == true
                                              ? Colors.greenAccent
                                              : Colors.redAccent,
                                        ),
                                        child: Center(
                                            child: Text(book.isAvailable == true
                                                ? 'Available'
                                                : 'Unavailable'))),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.heart_broken_sharp),
                                      color: Colors.red,
                                    )
                                  ],
                                )),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    book.bookName!,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text("\$${book.bookPrice.toString()}")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: booksList.length,
              ),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, -2),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
