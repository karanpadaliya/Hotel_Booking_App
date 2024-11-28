import 'dart:ffi';

import 'package:flutter/material.dart';
import 'room_detail.dart';
import 'book_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => const HotelBook(),
      "room_detail": (context) => RoomDetail(),
      "book_page": (context) => bookpage(),
    },
  ));
}

class HotelBook extends StatefulWidget {
  const HotelBook({super.key});

  @override
  State<HotelBook> createState() => _HotelBook();
}

class _HotelBook extends State<HotelBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Row(
                children: [
                  const Icon(Icons.location_on, size: 28),
                  const Text(
                    "Rajkot City",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Icon(Icons.arrow_drop_down_outlined, size: 30),
                  Container(
                    height: 40,
                    width: 130,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0x2D817E7E),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.search,
                              size: 22,
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Text(
                            "Search",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.sync_alt_outlined,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blueGrey),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "book_page");
                      },
                      child: const Icon(
                        Icons.person,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 120),
              child: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Hotel Book",
                    style: TextStyle(color: Colors.black, fontSize: 27)),
                TextSpan(
                    text: " Trested\n",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "Hotel's",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "  Around You",
                    style: TextStyle(color: Colors.black, fontSize: 27)),
              ])),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17, top: 20),
                  child: Row(
                    children: [
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "Find  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: "10km",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ])),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(Icons.arrow_forward_ios_sharp,
                            size: 16, color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Center(
                              child: Text(
                            "Hotels",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: const Color(0x257D8B91),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Center(
                              child: Text(
                            "Villas",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                        ),
                        Container(
                          height: 48,
                          width: 120,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: const Color(0x257D8B91),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Center(
                              child: Text(
                            "Popular",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                        ),
                        Container(
                          height: 48,
                          width: 120,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: const Color(0x257D8B91),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Center(
                              child: Text(
                            "Trusted",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: hotellist1.map((e) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "room_detail", //name changed
                                  arguments: e);
                            },
                            child: Hotel(
                              img: e["img"],
                              name: e["name"],
                              description: e["description"],
                              min: e["min"],
                              price: e["price"],
                              rating: e["rating"],
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: hotellist2.map((e) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "room_detail", //name_changed
                                  arguments: e);
                            },
                            child: Hotel(
                              img: e["img"],
                              name: e["name"],
                              description: e["description"],
                              min: e["min"],
                              price: e["price"],
                              rating: e["rating"],
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: hotellist3.map((e) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "room_detail", //name_changed
                                  arguments: e);
                            },
                            child: Hotel(
                              img: e["img"],
                              name: e["name"],
                              description: e["description"],
                              min: e["min"],
                              price: e["price"],
                              rating: e["rating"],
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Hotel extends StatelessWidget {
  String? name;
  String? description;
  String? img;
  String? min;
  double? price;
  double? rating;

  Hotel(
      {super.key,
      this.name,
      this.description,
      this.img,
      this.min,
      this.price,
      this.rating});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 228,
            width: 390,
            margin: const EdgeInsets.only(left: 10, top: 8, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  const BoxShadow(
                    blurRadius: 4.0,
                  ),
                ],
                color: const Color(0xffeeeeee)),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 0),
                      child: Container(
                        height: 29,
                        width: 390,
                        padding: const EdgeInsets.only(left: 0),
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50),
                          ),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 120),
                            Text(
                              "HotelBook Trusted",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.verified,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Image.network(
                        img ?? "",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.5),
                      child: Column(
                        children: [
                          Text(
                            name ?? "",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 15,
                              ),
                              Text(
                                description ?? "",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_half_sharp,
                                color: Colors.orangeAccent,
                                size: 18,
                              ),
                              Text(
                                "$rating",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffADAEAF)),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                min ?? "",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffADAEAF)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "\$$price",
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(width: 210),
                        Container(
                          height: 49,
                          width: 100.50,
                          decoration: const BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(23),
                            ),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Map> hotellist1 = [
  {
    "img":
        "https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/htl-imgs/201903061719227711-adc1124e970e11edbb590a58a9feac02.jpg",
    "name": "Hotel Kavery",
    "description": "Karanpara, Rajkot",
    "min": "20min",
    "price": 110.0,
    "rating": 4.5,
    "qty": 1
  },
];

List<Map> hotellist2 = [
  {
    "img":
        "https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/htl-imgs/202308071232423729-9021bec634ef11eeb3fe0a58a9feac02.jpg?&output-quality=75&downsize=520:350&crop=520:350;2,0&output-format=jpg",
    "name": "Hotel Lemon Tree",
    "description": "Yagnik Road, Rajkot",
    "min": "10min",
    "price": 135.00,
    "rating": 4.3,
    "qty": 1,
  },
];

List<Map> hotellist3 = [
  {
    "img":
        "https://r1imghtlak.mmtcdn.com/d6d5a36af69211e78020025f77df004f.jpg?&output-quality=75&downsize=520:350&crop=520:350;2,0&output-format=jpg",
    "name": "The Fern Residency",
    "description": "Kalawad Road, Rajkot",
    "min": "13min",
    "price": 152.00,
    "rating": 4.7,
    "qty": 1,
  },
];

List<Map> bookList = [];
