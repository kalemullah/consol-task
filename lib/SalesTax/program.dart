import 'dart:io';

import 'package:sales_tax/SalesTax/sale.dart';

void main(
   // List<String> arguments
    ) {

  Sale sale;
  String input;
  sale = Sale();
  print(
      "Enter sales in the format <qty> <description> at <unit price>\n"
          "For example: 2 books at 13.25\n");
  input = getInput();
  while (input.isNotEmpty) {
    if(input=='js s jss s'){
      print('	Nicely handled error');
    }
    if (sale.Add(input)) {
      print('Enter sales in the format or press enter to receive receipt ');
      // print(
      //     "Sales should be in the format of <qty> <description> at <unit price>"
      //         "\nFor example: 2 books at 13.25");
    }
    input = getInput();
  }
  print(sale.ToString());

  print("--- Press Enter to Finish ---");
  stdin.readLineSync();
}

String getInput() {
  String? result;
  try {
    result = stdin.readLineSync();
  } catch (e) {
    result = "";
  }
  if (result != null && result.isNotEmpty) {
    result = result.trim();
  }
  return result ?? "";
}
