import 'package:intl/intl.dart';

class Helper {

  static String stringToDate(var date){
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('dd-MM-yyyy – kk:mm').format(dateTime);
    return formattedDate;
  }

}



