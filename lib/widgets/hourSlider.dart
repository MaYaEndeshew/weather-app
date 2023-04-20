import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class hourSlider extends StatefulWidget {
  @override
  _hourSliderState createState() => _hourSliderState();
}

class _hourSliderState extends State<hourSlider> {
  List<String> data = [
    "1 : 00",
    "2 : 00",
    "3 : 00",
    "4 : 00",
    "5 : 00",
    "6 : 00",
    "7 : 00",
    "8 : 00",
    "9 : 00",
    "10 : 00",
    "11 : 00",
    "12 : 00"
  ];
  int _focusedIndex = 0;

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  Widget _buildItemList(BuildContext context, int index) {
    if (index == data.length)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.transparent,
            width: 150,

            // height: 200,
            child: Center(
              child: Text(
                '${data[index]}',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          Expanded(
              child: ScrollSnapList(
            onItemFocus: _onItemFocus,
            itemBuilder: _buildItemList,
            itemSize: 150,
            dynamicItemSize: true,
            onReachEnd: () {
              print('Done!');
            },
            itemCount: data.length,
            scrollDirection: Axis.vertical,
          )),
        ],
      ),
    );
  }
}
