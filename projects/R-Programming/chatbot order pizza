# Chatbot Order Pizza Project

pizza_menu <- c("Veggie Cheese", "Hawaiian Triple Cheese", "Chicken Triple Cheese", "Seafood & Hokkaido Cheese", "Bacon & Hokkaido Cheese")
pizza_prices <- c(199, 219, 219, 299, 299)
pizza_size <- c("Small", "Medium", "Large")
customers_totalcost <- 0
order_summary <- vector("character", length = 0)
pizza_order <- data.frame(pizza_menu, pizza_prices)

pizza_chatbot <- function() {
    print("Hi! Welcome to Let's cheese together Pizzeria. Please type 'Yeah' to choose your pizza menu." )
  while (TRUE) {
    customers_welcome <- tolower(readLines("stdin", n = 1))

    if (customers_welcome == "Yeah") {{break}
      print(pizza_order)
      print("Let's choose your pizza menu!")
      customers_choose <- tolower(readLines("stdin", n = 1))

    if(customers_choose %in% pizza_order$pizza_menu) {
      customers_price <- pizza_order[pizza_order$pizza_menu == customers_choose, 2]
      print(paste("Great choice! Here is your pizza menu", customers_choose, "and here is the price of your pizza.", customers_price))
      customers_totalcost <- customers_totalcost + customers_price
      order_summary <- c(order_summary, paste(customers_choose, "-", customers_price))
    } else {
      print("I'm sorry, but we don't have what you're looking for.")
      next 
    }

    print("Let's choose your pizza size! (Small + 20, Medium + 40, Large + 60)")
    customers_size <- tolower(readLines("stdin", n = 1))
    
    if(customers_size %n% pizza_size){
      print(paste("Great choice! Here is your pizza size", customers_size))
      if (customers_size == "Small") {
      customers_totalcost <- customers_totalcost + 20
      } else if (customers_size == "Medium") {
      customers_totalcost <- customers_totalcost + 40  
      } else if (customers_size == "Large") {
      customers_totalcost <- customers_totalcost + 60    
      }
    } else {
      print("I'm sorry, but we don't have what you're looking for.")

      next
    }

  print("Would you like to order anything else? (Yeah/Nope)")
  customers_else <- tolower(readLines("stdin", n = 1))

  if (customers_else == "Nope") {
    break
  }
}
}


  print("Let's summarize your order:")
  print(order_summary)
  print(paste("Total cost:", customers_totalcost))
  print("Thank you for your order. Let's cheese together again soon :).")
  }

pizza_chatbot ()
