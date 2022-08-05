This is a simple sales program - it takes input and produces a receipt showing sales tax and totals.

The tax rules are:
No Tax on books, medical items, food
GST (10%) - general products
Extra 5% - Imported products  (i.e. 15% total tax for general goods)
Round sales tax per line to the nearest 5 cents.

Your task?  To get it working :-)
[Extra credit - move rounding from line level to sale total and including a rounding figure on the receipt]

Tests & expected results:

Test 1:
-------
1 book at 12.49
1 music CD at 14.99
1 packet of chips at 0.85

Result:
	1 book: 12.49
	1 music CD: 16.49
	1 packet of chips: 0.85
	Sales Taxes: 1.50
	Total: 29.83

Test 2:
-------
1 imported box of chips at 10.00
1 imported transfomer at 47.50

Result:
	1 imported box of chips: 10.50
	1 imported transformer: 54.65
	Sales Taxes: 7.65
	Total: 65.15

Test 3:
-------
1 barrell of imported oil at 27.99
1 bottle of perfume at 18.99
1 packet of headache tablets at 9.75
1 box of imported chocolates at 11.25

Result:
	1 imported barrell of oil: 32.19
	1 bottle of perfume: 20.89
	1 packet of headache tablets: 9.75
	1 imported box of chocolates: 11.85
	Sales Taxes: 6.70
	Total: 74.68

Test 4:
-------
10 imported bottles of whiskey at 27.99
10 bottles of local whiskey at 18.99
10 packets of iodine tablets at 9.75
10 boxes of imported potato chips at 11.25

Result:
	10 imported bottles of whiskey: 321.90
	10 bottles of local whiskey: 208.90
	10 packets of iodine tablets: 97.50
	10 imported boxes of potato chips: 118.15
	Sales Taxes: 66.65
	Total: 746.45

Tets 5:
-------
js s jss s

Result:
	Nicely handled error
	
Test 6:
-------
<just hit enter>

Result:
	A blank receipt (showing 0.00 amounts)
