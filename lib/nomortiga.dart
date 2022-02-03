import 'package:flutter/material.dart';

// nomor 3
// bikin dengan & tanpa date formatter
// lenstring, - di blkg string, klo >2, berarti bukan

class NomorTiga extends StatefulWidget {

  @override
  _NomorTigaState createState() => _NomorTigaState();
}

class _NomorTigaState extends State<NomorTiga> {
  final _controller = TextEditingController();
  String output = "input tanggal";
  List<String> tgl = [];

  // asumsi huruf yang dimasukkan valid (range 31 hari dan 12 bulan)
  void tiga(String input){
    bool sesuai = true;
    int indeks = 0;
    tgl = input.split('-').toList();
    tgl.add('.'); // menambahkan penanda End of List untuk menghindari mendapatkan array value kosong
    while(sesuai && indeks <=2){
      if(indeks==2){
        sesuai = (tgl[indeks].length==4);
      } else {
        sesuai = (tgl[indeks].length==2);
      }
      indeks++;
    }
    setState(() {
      output = sesuai ? "ya" : "tidak";
    });
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

                    // text field untuk input
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenHeight / 40,
                          screenHeight / 40,
                          screenHeight / 40,
                          0),
                      child: TextFormField(
                        controller: _controller,
                      ),
                    ),

                    // button untuk proses input
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenHeight / 40,
                          screenHeight / 40,
                          screenHeight / 40,
                          0),
                      child: ElevatedButton(
                        onPressed: () {
                          tiga(_controller.text);
                        },
                        child: Text("tentukan"),
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
