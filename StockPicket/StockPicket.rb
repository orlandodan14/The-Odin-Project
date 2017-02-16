def stock_picker(prices)
  days = (0..(prices.length - 1)).to_a
  gain = 0
  $best_days = []
  
  days.each do |buy_day|
    days.each do |sell_day|
      if sell_day > buy_day && prices[sell_day] - prices[buy_day] > gain
          gain = prices[sell_day] - prices[buy_day]
          $best_days = [buy_day, sell_day]
      end
    end
  end
end

stock_picker([17,3,6,4,15,8,6,1,10])
puts "#{$best_days}: Day '#{$best_days[0]}' for BUY and day '#{$best_days[1]}' for SELL."