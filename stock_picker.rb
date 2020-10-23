
# Stock Picker
turnip_prices = [601,90,60,60,100,120,240,600,90,60,40,600,50,40]

def turnip_guide(prices)

  turnps = {
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
        turnps[:buy_day].push(prices.index(price))
        turnps[:sell_day].push(prices.index(prices[day + i]))
        turnps[:difference].push(difference)
      end
    end
  }

  best_profit = turnps[:difference].to_a.max
  date = turnps[:difference].index(best_profit)

  p "Buy the #{turnps[:buy_day][date]} and \
  sell on the #{turnps[:sell_day][date]} for a \
  profit of #{turnps[:difference][date]} bells."

end

turnip_guide(turnip_prices)
