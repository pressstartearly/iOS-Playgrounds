// Created by: Caleb Chapman
// Class: CSC308
// Date: Jan 28th, 2021
// Project Name: Homework1

var products = ["Icecream Sunday":("Desert", 5.99), "Steak Dinner":("Entree", 40.00), "Coke":("Drink", 2.99)]

func lowestPrice(products: [String:(category: String, price: Double)]) -> (name: String, price: Double) {
    // Initialize tuple to store the current highest priced item for loop with a default value
    var lowestPricedItem: (name: String, price: Double) = ("null",0.00)
    
    // Loop through all products
    for product in products {
        // if it's the default value we know that it's the first item
        if lowestPricedItem == ("null", 0.00) {
            lowestPricedItem = (product.key, product.value.price)
        }
        // else lets check if it's a lower price. If it is lower then we shall replace the lowest priced item with the name and cost of the current item.
        else if lowestPricedItem.price > product.value.price {
            lowestPricedItem = (product.key, product.value.price)
        }
    }
    return lowestPricedItem
}

func highestPrice(products: [String:(category: String, price: Double)]) -> (name: String, price: Double) {
    // Initialize tuple to store the current highest priced item for loop with a default value
    var highestPricedItem: (name: String, price: Double) = ("null",0.00)
    
    // Loop through all products
    for product in products {
        // if it's the default value we know that it's the first item
        if highestPricedItem == ("null", 0.00) {
            highestPricedItem = (product.key, product.value.price)
        }
        // else lets check if it's a higher price. If it is higher then we shall replace the highest priced item with the name and cost of the current item.
        else if highestPricedItem.price < product.value.price {
            highestPricedItem = (product.key, product.value.price)
        }
    }
    return highestPricedItem
}

// Runs the selected function. 0 for lowest price and anything else for highest price
func price(products: [String:(category: String, price: Double)], task: Int)->(name: String, price: Double)
{
    switch task {
    case 0:
        return lowestPrice(products: products)
    default:
        return highestPrice(products: products)
    }
}

// Testing lowest price funtion
print("Lowest Priced Item:")
print(price(products: products, task: 0))

// Testing highest price function
print("\nHighest Priced Item:")
print(price(products: products, task: 1))
