import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDropdownMenu extends StatefulWidget {
  const MyDropdownMenu({Key? key}) : super(key: key);

  @override
  _MyDropdownMenuState createState() => _MyDropdownMenuState();
}
//TODO Convert it into Custom Widget
class _MyDropdownMenuState extends State<MyDropdownMenu> {
  String selectedMonth = '';

  @override
  void initState() {
    super.initState();
    // Initialize selected month to the current month
    selectedMonth = _getMonthName(DateTime.now().month);
  }

  @override
  Widget build(BuildContext context) {
    // List of month names
    List<String> monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade400,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: DropdownButton<String>(
        value: selectedMonth,
        items: monthNames.map((String month) {
          return DropdownMenuItem<String>(
            value: month,
            child: Text(month),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedMonth = newValue ?? '';
            print('Selected month: $selectedMonth');
          });
        },
      ),
    );
  }

  String _getMonthName(int month) {
    // Function to get the name of the month based on the month number
    List<String> monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }
}
