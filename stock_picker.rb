
# Stock Picker
turnip_prices = [601,90,60,60,100,120,240,600,90,60,40,600,50,40]

def biggest_difference(prices)

  stocks = {
    buy_day: [],
    sell_day: [],
    difference: [],
  }

  prices.each_with_index { |price, day|
    for i in day..prices.length
      difference = prices[day + i].to_i - price.to_i
      if difference <= 0
        next
      else
        stocks[:buy_day].push(prices.index(price))
        stocks[:sell_day].push(prices.index(prices[day + i]))
        stocks[:difference].push(difference)
      end
    end
  }

  best_profit = stocks[:difference].to_a.max
  date = stocks[:difference].index(best_profit)

  p "Buy the #{stocks[:buy_day][date]} and \
  sell on the #{stocks[:sell_day][date]} for a \
  profit of #{stocks[:difference][date]}"

end

biggest_difference(turnip_prices)
