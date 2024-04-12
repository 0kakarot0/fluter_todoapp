import 'package:intl/intl.dart';

class MyDateFormatter{

  String formatDate(){
    // Get the current date
    DateTime now = DateTime.now();

    // Format the date to display month name and year
    String formattedDate = DateFormat.yMMMM().format(now);

    return formattedDate;
  }

}