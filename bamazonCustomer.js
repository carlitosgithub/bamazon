var mysql = require("mysql");
var inquirer = require("inquirer");

// create the connection information for the sql database
var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "PASS",
  database: "bamazon"
});

// connect to the mysql server and sql database
connection.connect(function (err) {
  if (err) throw err;
  console.log('Connected as ID ' + connection.threadId);
  listItems();
});
function listItems() {
  connection.query("SELECT * FROM products", function (err, res) {
    console.log("Check out our Selection..");
    console.table(res);
    questions();
  });
}


function questions() {
  inquirer
    .prompt([
      {
        type: "input",
        message: "what is the item's ID you like to purchase? ",
        name: "itemID"
      },
      {
        type: "input",
        message: "How many units would you like to buy?",
        name: "unitsBuy"
      }

    ])
    .then(function (response) {

      var item = response.itemID - 1;
      //console.log(response);
      connection.query("SELECT * FROM products ", function (err, res) {
        if (err) throw err;
        var quantity = res[item].stock_quantity - response.unitsBuy;
        var product = res[item].product_name;
        var total = res[item].price * response.unitsBuy;
        //console.log("quantity  " + quantity + " product  " + product)

        if (res[item].stock_quantity >= response.unitsBuy) {
          connection.query("UPDATE products SET ? WHERE ?", [{ stock_quantity: quantity }, { item_id: item + 1 }],
            function (err, res) {
              console.log("You are buying " + response.unitsBuy + " " + product + "!");
              console.log("Your total is $" + total + " dollars");
              console.log("Stock left:  " + quantity);
              console.log("Transaction Completed. Thank you!");
              connection.end();
            });
        } else if (res[item].stock_quantity < response.unitsBuy) {
          console.log("Sorry, we do not have the stock to fulfill your request, please try again! \n");
          questions()
        } else {
          console.log("Oops! Something went wrong!");
        }
      });
    });
}
