require './drinks'

class Stock 
  attr_reader :drinks
  attr_accessor :money_data

  def initialize 
    @beverage = Drinks.new
    @drinks = @beverage.drinks
    @money_data = 0
  end


  def able_to_buy #購入できるドリンクの情報を表示
    @drinks.each do |drink|
      if drink[:stock] == 0
        puts "#{drink[:name]}は在庫がありません。"
      elsif @money_data >= drink[:price]
        puts "#{drink[:name]}を購入できます。"
      else
        puts "#{drink[:name]}を購入するには、"+(drink[:price]- @money_data).to_s+"円不足しています。"
      end
    end
  end
end

