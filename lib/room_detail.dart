import 'package:flutter/material.dart';
import 'main.dart';

class RoomDetail extends StatefulWidget {
  RoomDetail({Key? key}) : super(key: key);

  @override
  State<RoomDetail> createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {
  int cout = 1;

  @override
  Widget build(BuildContext context) {
    final roomlist1 = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.blueGrey),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              margin: const EdgeInsets.only(top: 230),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  color: Colors.white70),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              top: 230 - 150,
              right: 0,
              left: 0,
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.network(roomlist1?["img"] ?? ""),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  roomlist1?["name"] ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Text(
                                  "HotelBook Trested",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.verified,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text:
                                  "The property is centrally located and has good hygiene standards. The restaurant serves delicious food, especially the Gujarati thali. Rajkot's luxurious accommodations, elegant banquet spaces, sumptuous rooms, indulgent dining options hotel personnel greet you.",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700)),
                          TextSpan(
                              text: "Read More",
                              style: TextStyle(
                                  color: Color(0xff5CC24A),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500))
                        ])),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 30, top: 15),
                            child: Icon(
                              Icons.star_half,
                              color: Colors.yellow,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Text(
                              roomlist1?["rating"]?.toString() ?? "",
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 35, top: 15),
                            child: Text(
                              "🔥",
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5, top: 15),
                            child: Text(
                              "Top 10",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 30, top: 15),
                            child: Text(
                              "⏰",
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5, top: 15),
                            child: Text(
                              "20 Min",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              "Facilities",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: roomuse.map((e) {
                          return uses(
                            icon: e["icon"],
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: Container(
                          height: 49,
                          width: 500,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.blueGrey),
                          child: InkWell(
                              onTap: () {
                                if (roomlist1 != 0) {
                                  bookList.add(roomlist1!);
                                }
                                Navigator.pushNamed(context, "book_page");
                              },
                              child: const Center(
                                child: Text(
                                  "Book Room",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class uses extends StatefulWidget {
  dynamic icon;

  uses({super.key, this.icon});

  @override
  State<uses> createState() => _usesState();
}

class _usesState extends State<uses> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, top: 15),
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xffF4F4F4)),
            child: Center(
                child: Text(
              widget.icon ?? "",
              style: const TextStyle(fontSize: 25),
            )),
          ),
        ),
      ],
    );
  }
}

List<Map> roomuse = [
  {"icon": "🏊"},
  {"icon": "🛁"},
  {"icon": "🍵"},
  {"icon": "🅿️"},
  {"icon": "🛌"},
];
