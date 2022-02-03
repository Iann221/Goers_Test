import 'package:flutter/material.dart';
import 'package:flutter_goers/item.dart';

class Bonus extends StatefulWidget {

  @override
  _BonusState createState() => _BonusState();
}

class _BonusState extends State<Bonus> {
  String output = "pilih urutan";
  Item indomie = Item(nama:'Indomie',harga:3000,rating:5,likes:150);
  Item laptop = Item(nama:'Laptop',harga:4000000,rating:4.5,likes:123);
  Item aqua = Item(nama:'Aqua',harga:3000,rating:4,likes:250);
  Item smartTV = Item(nama:'Smart TV',harga:4000000,rating:4.5,likes:42);
  Item headphone = Item(nama:'Headphone',harga:4000000,rating:3.5,likes:90);
  Item verysmartTV = Item(nama:'Very Smart TV',harga:4000000,rating:3.5,likes:87);
  List<Item> barang = [];
  String pilihan = "";

  @override
  void initState(){
    super.initState();
    barang = [indomie, laptop,aqua,smartTV,headphone,verysmartTV];
  }

  // menggunakan metode merge sort
  void show(){
    print('pilihan: $pilihan');
    List<String> terurut = [];
    barang = sort(barang);
    for(int i=0;i<barang.length;i++){
      terurut.add(barang[i].nama);
    }
    setState(() {
      output = "$terurut";
    });
  }

  // fungsi sort berfungsi untuk membagi list menjadi 2
  List<Item> sort(List<Item> c){
    if (c.length==1){
      return c;
    } else {
      int tengah = (c.length/2).ceil();
      List<Item> a = sort(c.sublist(0,tengah));
      List<Item> b = sort(c.sublist(tengah));
      if(pilihan=="harga"){
        return ascendPrice(a,b);
      } else if(pilihan=="rating") {
        return descendRating(a, b);
      } else {
        return descendLikes(a, b);
      }
    }
  }

  // fungsi untuk mengurutkan
  List<Item> ascendPrice(List<Item> a, List<Item> b){
    List<Item> c = [];
    while(a.isNotEmpty && b.isNotEmpty){
      if(a[0].harga>b[0].harga){
        c.add(b[0]);
        b.removeAt(0);
      } else {
        c.add(a[0]);
        a.removeAt(0);
      }
    }
    if(a.isNotEmpty){
      c += a;
    } else {
      c += b;
    }
    return c;
  }

  List<Item> descendRating(List<Item> a, List<Item> b){
    List<Item> c = [];
    while(a.isNotEmpty && b.isNotEmpty){
      if(a[0].rating<b[0].rating){
        c.add(b[0]);
        b.removeAt(0);
      } else {
        c.add(a[0]);
        a.removeAt(0);
      }
    }
    if(a.isNotEmpty){
      c += a;
    } else {
      c += b;
    }
    return c;
  }

  List<Item> descendLikes(List<Item> a, List<Item> b){
    List<Item> c = [];
    while(a.isNotEmpty && b.isNotEmpty){
      if(a[0].likes<b[0].likes){
        c.add(b[0]);
        b.removeAt(0);
      } else {
        c.add(a[0]);
        a.removeAt(0);
      }
    }
    if(a.isNotEmpty){
      c += a;
    } else {
      c += b;
    }
    return c;
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Column(
                  children: [
                    // kembali
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenHeight / 40,
                          screenHeight / 40,
                          screenHeight / 40,
                          0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Kembali"),
                      ),
                    ),

                    // button pilihan urutan prioritas
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenHeight / 40,
                          screenHeight / 40,
                          screenHeight / 40,
                          0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            pilihan = "harga";
                          });
                          show();
                        },
                        child: Text("prioritas harga terendah"),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenHeight / 40,
                          screenHeight / 40,
                          screenHeight / 40,
                          0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            pilihan = "rating";
                          });
                          show();
                        },
                        child: Text("prioritas rating tertinggi"),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenHeight / 40,
                          screenHeight / 40,
                          screenHeight / 40,
                          0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            pilihan = "likes";
                          });
                          show();
                        },
                        child: Text("prioritas likes terbanyak"),
                      ),
                    ),

                    // text hasil
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenHeight / 40,
                            screenHeight / 40,
                            screenHeight / 40,
                            0),
                        child: Text(
                          output,
                        )
                    ),
                  ],
                )
            )
        )
    );
  }
}
