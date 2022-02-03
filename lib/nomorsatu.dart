import 'package:flutter/material.dart';

class NomorSatu extends StatefulWidget {

  @override
  _NomorSatuState createState() => _NomorSatuState();
}

class _NomorSatuState extends State<NomorSatu> {
  final _controller = TextEditingController();
  String output = "input angka 1 ≤ N < 100.000 ke text field";
  List<String> jwban = ['satuan', 'puluhan','ratusan','ribuan','puluh ribuan','lebih dari puluh ribuan'];

  void satu(String input){
    int calc = int.parse(input);
    int index = 0;
    while (calc/10>1 && index<5){
      calc = (calc/10).round();
      index++;
    }
    setState(() {
      output = jwban[index];
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
                          satu(_controller.text);
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
