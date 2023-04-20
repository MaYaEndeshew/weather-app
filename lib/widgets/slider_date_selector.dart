import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  List<String> data = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
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
          )),
        ],
      ),
    );
  }
}

// class SlidingDaySelector extends StatefulWidget {
//   //final DatePickerController _controller = DatePickerController();
//   final void Function(DateTime) onDaySelected;

//   SlidingDaySelector({this.onDaySelected});

//   @override
//   _SlidingDaySelectorState createState() => _SlidingDaySelectorState();
// }

// class _SlidingDaySelectorState extends State<SlidingDaySelector> {
//   PageController _pageController;
//   final _days = List<DateTime>.generate(
//       7,
//       (i) =>
//           DateTime.now().subtract(Duration(days: DateTime.now().weekday - i)));

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: DateTime.now().weekday - 1);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: PageView.builder(
//         controller: _pageController,
//         onPageChanged: (page) => widget.onDaySelected(_days[page]),
//         itemCount: 7,
//         itemBuilder: (context, index) {
//           final day = _days[index];
//           final formatter = DateFormat('EEEE');
//           return Container(
//             alignment: Alignment.center,
//             child: Text(formatter.format(day)),
//           );
//         },
//       ),
//     );
//   }
// }
