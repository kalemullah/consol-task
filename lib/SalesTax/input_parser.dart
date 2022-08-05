import 'sale_line.dart';

class InputParser {
  // Assumes that all input is in the format:
  //  <qty> <product> at <price>

  //
  //  If <product> contains the word imported then the product is deemed to attract import tax
  //
  // If it can't be parsed we return null.
  // If it can then we return a sales line, complete with tax information calculated.
   static SaleLine? ProcessInput(String input) {
    int quantity;
    String productName;
    double price;
    bool isImported;
    SaleLine saleLine;

    if (input.isEmpty) {
      return null;
    }
    var words = input.split(" ");
    int wordCount = words.length;

    // must have at least 4 words
    if (wordCount < 4) {
      return null;
    }

    // get quantity (first word)
    try {
      quantity = int.parse(words[0]);
    } catch (e) {
      return null;
    }

    // get price (last word in input String)
    try {
      price = double.parse(words[wordCount - 1]);
    } catch (e) {
      return null;
    }

    productName = words.sublist(1, wordCount).join(" ");
    if (productName.isEmpty) {
      return null;
    }

    //Check if this is an imported product
    isImported = input.contains("imported");
    // if (isImported) {
    //   //Ensure the word imported appears at the front of the description
    //   productName = "imported " + productName.replaceAll("imported ", "");
    // }

    // create the sale line
    saleLine = SaleLine(quantity, productName, price, isImported);
    return saleLine;
  }
}

