import 'dart:io';

import 'package:sales_tax/SalesTax/sale.dart';

void main(List<String> arguments) {
  Sale sale;
  String input;

  sale = Sale();
  print(
      "Enter sales in the format <qty> <description> at <unit price>\nFor example: 2 books at 13.25\nEntering a blank line completes the sale\n");
  input = getInput();
  while (input.isNotEmpty) {
    if (!sale.Add(input)) {
      print(
          "Sales should be in the format of <qty> <description> at <unit price>\nFor example: 2 books at 13.25");
    }
    input = getInput();
  }
  print(sale.ToString());

  print("--- Press Enter to Finish ---");
  stdin.readLineSync();
}

String getInput() {
  String? result;
  print("Sale : ");
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
