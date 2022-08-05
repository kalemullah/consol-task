class SaleLine {
  String productName;
  double price;
  bool isImported;
  int quantity;
  double taxAmount;
  double lineValue;

  String get ProductName => productName;

  double get Price => price;

  bool get IsImported => isImported;

  int get Quantity => quantity;

  double get LineValue => lineValue;

  double get Tax => taxAmount;

  /// <summary>
  /// constructor for the sale line
  /// </summary>
  /// <param name="lineQuantity">Quantity on order</param>
  /// <param name="name">name of the product</param>
  /// <param name="unitPrice">price of a single item</param>
  /// <param name="itemIsImported">flag to indicate if the item is imported</param>
  SaleLine(this.quantity, this.productName, this.price, this.isImported)
       : taxAmount = 0,
         lineValue = 0
  {
    int taxRate = 0;
    lineValue = price * quantity;

    // calculate taxable amount
    // ideally should really have a product list and tax rules, but this'll have to do for the exercise.
    if (productName.contains("book") ||
        productName.contains("tablet") ||
        productName.contains("chip")) {
      taxRate = 0;
    } else if(isImported) {
      taxRate = 15;
    } //15% base tax or imported products
    else  {
      taxRate = 10;
    } //10% regardless for any gen items

    taxAmount = CalculateTax(lineValue, taxRate);
    //Add tax to line value
    lineValue += taxAmount;
  }

  /// <summary>
  /// Calculates the amount of tax for a value, rounded up to the nearest 5 cents
  /// </summary>
  /// <param name="value">The original value</param>
  /// <param name="taxRate">The tax rate to apply</param>
  /// <returns>The calculated tax on the original value</returns>
  static double CalculateTax(double value, int taxRate) {
    double amount;
    double remainder;

    amount = double.parse(((value * taxRate) / 100).toStringAsFixed(2));

    //Now round up to nearest 5 cents.
    remainder = amount % .05;
    if (remainder > 0) {
      amount += .05 - remainder;
    }
    return amount;
  }

  /// <summary>
  /// Converts the sale line to a String
  /// </summary>
  /// <returns>The String representation of the sale line</returns>
  String ToString() {
    return "$Quantity $ProductName:  ${LineValue.toStringAsFixed(2)}";
  }
}
