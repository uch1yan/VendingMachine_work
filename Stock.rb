class Stock 
  include Drinks
  attr_accessor :drinks, :sales, :slot_money

  def initialize 
    @drinks = []
    @drinks.push(coke, water, redbull)
    @sales = 0
    @slot_money = 0
  end


  def able_to_buy #お金投入時点んで購入できるドリンクの情報を表示
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
    # puts "#{coke[:name]}の在庫は#{coke[:stock]}本です。"
    # puts "#{water[:name]}の在庫は#{water[:stock]}本です。"
    # puts "#{redbull[:name]}の在庫は#{redbull[:stock]}本です。"
  end
    # @drinks.each do |drink|
    #   puts "商品名:#{drink[:name]} 価格:#{drink[:price]} 在庫:#{drink[:stock]}"
    # end

end

