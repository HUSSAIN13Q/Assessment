
// ### Objective:

// > Build a vending machine program that allows users to select items, check prices, make payments, and receive change. The machine should handle various edge cases like insufficient funds and out-of-stock items. You are required to use variables, arrays, functions, conditional statements, and object-oriented programming (OOP) concepts in your solution.
// > 

// ---

// ### Setup

// 1. **Create an `Item` class** that represents an item in the vending machine:
//     - Attributes: `String name`, `double price`
//     - Method: `displayItem()` (returns a string displaying the name and price of the item)
// 2. **Create an `ItemStock` class** that links an `Item` to its stock:
//     - Attributes
//         - `Item item` (an object of type `Item`)
//         - `int stock` (amount of the item in stock)
//     - Methods
//         - `isInStock()` (returns a boolean if the stock is greater than 0)
// 3. **Create a `VendingMachine` class** with the following attributes:
//     - `List<ItemStock> items` (array of available items with stock)
//     - `double balance` (stores the current user’s balance)

// ### Vending Machine Features

// 1. **Function: `addItem(Item item, int stock)`**
//     - Adds an item to the vending machine with the specified stock.
// 2. **Function: `selectItem(String itemName)`**
//     - Allows the user to choose an item by name.
//     - Checks if the item is in stock and displays its price.
// 3. **Function: `insertMoney(double amount)`**
//     - Allows the user to insert money into the machine.
// 4. **Function: `dispenseItem(String itemName)`**
//     - Dispenses the item if the user has enough balance and the item is in stock.
//     - Deducts the price from the user’s balance and reduces the stock of the item.
//     - Returns change if necessary.
// 5. **Function: `getChange()`**
//     - Returns the remaining balance to the user.

// ### Handling Edge Cases

// 1. If the user selects an item that is out of stock, display an appropriate message.
// 2. If the user’s balance is insufficient, notify the user and ask for more money.
// 3. If the balance is sufficient, deduct the item price and dispense the item.

// ### Test the vending machine

// 1. You must have warehouse with your `ItemStock` objects that combine items and their stock.
// 2. Initialize the vending machine with: 
//     1. The warehouse of `ItemStock's`, each with a corresponding `Item` object and stock quantity.
//     2. Track the user’s balance using a `double` staring with zero.

// ### **Sample output**

// ```bash
// Welcome to the Vending Machine!

// Items Available:
// 1. Soda - $2.50 (Stock: 10)
// 2. Chips - $1.50 (Stock: 5)
// 3. Candy - $1.00 (Stock: 0) // Out of stock

// Insert money: $3.00

// Select item: Soda
// Dispensing Soda...
// Remaining balance: $0.50

// Do you want another item? (yes/no): no
// Returning change: $0.50
// Thank you for using the vending machine!
// ```

// <aside>
// 💡 **Hints**

// 1. Use can use `stdout.write('Insert money:')` and `stdin.readLineSync()` to interact with the terminal.
// 2. Use `print('')` to display text to the users. 

// Read more about the **dart:io** library and **Standard output, error, and input streams** [here](https://api.dart.dev/stable/3.5.3/dart-io/dart-io-library.html) 

// </aside>

// <aside>
// 🎁 **Bonus!**

// 1. **Refill Stock Feature**: Add a function that allows the vending machine owner to restock items.
// 2. **Display Remaining Stock**: Add a function that displays the number of remaining items for each product.
// 3. **Discount System**: Implement a discount system where certain items can have a promotional discount applied.
// </aside>


// ### Setup
class Item {
  String name="";
  double price=0;
  Item(this.name,this.price);
  String displayItem(){
    return "$name+ ${price.toStringAsFixed(1)}";
 }
}
class ItemStock {
  Item item;
  int stock;
  ItemStock(this.item, this.stock);

  bool isInStock(){
     if (stock>0) {
      return true;
      } else {
        return false;
        }
    }
  

}


 //### Vending Machine Features

class VendingMachine{

  List<ItemStock> items=[];
  double balance=0;

  void addItem(Item item,int stock){
    items.add(ItemStock(item,stock));

    
  }

   ItemStock? selectItem(String itemName) {
    for (var available in items) {
      if (available.item.name == itemName) {
        return available;
        }
        }
        return null ;
   
 }
    

  void insertMoney(double amount) {
       balance += amount;
      print('Your current balance $balance');
  }

  void dispenseItem(String itemName){
    var input = selectItem(itemName);
    if (input != null && input.isInStock()) {
      if (balance < input.item.price) {
         print("YOU ARE BROKE");
      } 
      else {
        balance -= input.item.price;
        input.stock=input.stock-1;
        print("what is left $balance");
      }
    } else {
      print("out of stock");
    }
  }

  void getChange() {
     print('your change is $balance');
     balance=0;
   }

    }

  void main() {
   VendingMachine vendingMachine = VendingMachine();
   vendingMachine.addItem(Item("Tic Tac", 2.5),4);
   vendingMachine.addItem(Item("THE DRINK OF VALHALLA sunkist",100), 1);
   vendingMachine.addItem(Item("Coca cola jelly", 0.200),7);
   vendingMachine.addItem(Item("ketco chips", 0.5),14);

   for (var stock in vendingMachine.items) {// i used chatgpt for this for loop
     print(stock.item.displayItem());
     print("stock${stock.stock}");
   }
   vendingMachine.insertMoney(100);
   vendingMachine.dispenseItem("ketco chips");
   vendingMachine.getChange();
 }

 



 
    
  