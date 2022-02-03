import 'package:flutter/material.dart';

class NomorDua extends StatefulWidget {

  @override
  _NomorDuaState createState() => _NomorDuaState();
}

class _NomorDuaState extends State<NomorDua> {
  final _controller = TextEditingController();
  String output = "input list angka dipisah dengan spasi";
  List<int> nums = [];

  void dua(String input){
    nums = input.split(' ').map(int.parse).toList();
    int min = nums[0];
    int max = nums[0];
    for(int i=1;i<nums.length;i++){
      if(nums[i]>max){
        max = nums[i];
      }
      if(nums[i]<min){
        min = nums[i];
      }
    }
    setState(() {
      output = "$max $min";
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
                          dua(_controller.text);
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
