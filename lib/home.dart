import 'package:flutter/material.dart';
import 'package:flutter_goers/nomorsatu.dart';
import 'package:flutter_goers/nomordua.dart';
import 'package:flutter_goers/nomortiga.dart';
import 'package:flutter_goers/bonus.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Column(
                  children: [

                    // nomor satu
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenHeight / 40,
                          screenHeight / 40,
                          screenHeight / 40,
                          0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                                return NomorSatu();
                              })
                          );
                        },
                        child: Text("Nomor Satu"),
                      ),
                    ),

                    // nomor dua
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenHeight / 40,
                          screenHeight / 40,
                          screenHeight / 40,
                          0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                                return NomorDua();
                              })
                          );
                        },
                        child: Text("Nomor Dua"),
                      ),
                    ),

                    // nomor tiga
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenHeight / 40,
                          screenHeight / 40,
                          screenHeight / 40,
                          0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                                return NomorTiga();
                              })
                          );
                        },
                        child: Text("Nomor Tiga"),
                      ),
                    ),

                    // bonus
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenHeight / 40,
                          screenHeight / 40,
                          screenHeight / 40,
                          0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                                return Bonus();
                              })
                          );
                        },
                        child: Text("Bonus"),
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}
