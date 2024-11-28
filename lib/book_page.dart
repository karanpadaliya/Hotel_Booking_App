import 'package:flutter/material.dart';
import 'main.dart';

class bookpage extends StatefulWidget {
  bookpage({super.key});

  @override
  State<bookpage> createState() => _bookpageState();
}

class _bookpageState extends State<bookpage> {
  double Charges = 3.50;

  @override
  Widget build(BuildContext context) {
    double subtotal = subtotalprice();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Colors.white70),
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    "Subtotal",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 230),
                  child: Text(
                    "\$$subtotal",
                    style: const TextStyle(
                        color: Color(0xffADAEAF),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1.9,
                width: 390,
                color: const Color(0xffADAEAF),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    "Charges",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 230),
                  child: Text(
                    "\$$Charges",
                    style: const TextStyle(
                        color: Color(0xffADAEAF),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                height: 1.9,
                width: 390,
                color: const Color(0xffADAEAF),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 260),
                  child: Text(
                    "${subtotal + Charges}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 50,
                width: 450,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blueGrey),
                child: const Center(
                    child: Text(
                  "PLACE ORDER",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              "https://images.unsplash.com/photo-1622626732808-b59f310cce62?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            margin: const EdgeInsets.only(top: 150),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Color(0xffF9F8FD)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: SingleChildScrollView(
              child: Column(
                  children: bookList.map((e) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      height: 100,
                      width: 380,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xffFFFFFF)),
                      child: Row(
                        children: [
                          Image.network(e["img"] ?? "", height: 130),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  e["name"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 1),
                                  Text(
                                    "\$" + e["price"].toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Room no: ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: InkWell(
                                      onTap: () {
                                        if (e["qty"] > 1) {
                                          e["qty"] = e["qty"] - 1;
                                          setState(() {});
                                        } else {
                                          bookList.remove(e);
                                          setState(() {});
                                        }
                                      },
                                      child: const Icon(Icons.remove_circle),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      e["qty"].toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        e["qty"] = e["qty"] + 1;
                                        setState(() {});
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Icon(Icons.add_circle_rounded),
                                      ))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }).toList()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                const Text("ROOM BOOK",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 605),
            height: 65,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: Colors.white70),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:
                      Icon(Icons.qr_code_2, color: Color(0xffADAEAF), size: 30),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text("Promo Code",
                      style: TextStyle(color: Color(0xffADAEAF), fontSize: 15)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.blueGrey),
                    child: const Center(
                        child: Text(
                      "Apply",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  double subtotalprice() {
    double subtotal = 0;
    bookList.forEach((e) {
      subtotal += e["qty"] * e["price"];
    });
    return subtotal;
  }
}
