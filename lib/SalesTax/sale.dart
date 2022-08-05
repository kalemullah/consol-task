import 'input_parser.dart';
import 'sale_line.dart';

class Sale {
  List<SaleLine> saleLines =[];
  double totalTax = 0;
  double totalValue = 0;

  /// <summary>
  /// Adds a line to the sale.
  /// </summary>
  /// <param name="inputLine">The line to add.</param>
  /// <returns>True for success, False for failure.  Failures are usually caused via incorrect formatting of the input</returns>
  bool Add(String inputLine) {
    SaleLine? saleLine;

    saleLine = InputParser.ProcessInput(inputLine);
    if (saleLine != null) {
      saleLines.add(saleLine);
      totalTax += saleLine.Tax;
      totalValue += saleLine.LineValue;
    }
    return true;
  }

  /// <summary>
  /// The total Tax amount for the sale
  /// </summary>
  double get Tax => totalTax;

  /// <summary>
  /// The total value of the sale (including Tax)
  /// </summary>
  double get TotalValue => totalValue;

  /// <summary>
  /// Converts the sale to a String
  /// </summary>
  /// <returns></returns>
  String ToString() {
    String output = "receipt";

    for (var line in saleLines) {
      if (output.isNotEmpty) {
        output += "\n";
      }
      output += line.ToString();
    }
    //Now add footer information
    output += "\n";
    output += "Sales Taxes: ${Tax.toStringAsFixed(2)}";
    output += "\n";
    output += "Total price: ${TotalValue.toStringAsFixed(2)}";
    return output;
  }
}
