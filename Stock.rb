require './drinks'

class Stock 
  attr_accessor :drinks, :sales, :slot_money

  def initialize 
    @beverage = Drinks.new
    @drinks = []
    @drinks.push(@beverage.coke, @beverage.water, @beverage.redbull)
    @sales = 0
    @slot_money = 0
  end


  def able_to_buy #購入できるドリンクの情報を表示
    @drinks.each do |drink|
      if drink[:stock] == 0
        puts "#{drink[:name]}は在庫がありません。"
      elsif @slot_money >= drink[:price]
        puts "#{drink[:name]}を購入できます。"
      else
        puts "#{drink[:name]}を購入するには、"+(drink[:price]-@slot_money).to_s+"円不足しています。"
      end
    end
  end


  def stock_info
    @drinks.each_with_index do |drink, i|
      puts "#{i + 1}: #{drink[:name]}, #{drink[:price]}円, 在庫:#{drink[:stock]}"
    end
  end
end

