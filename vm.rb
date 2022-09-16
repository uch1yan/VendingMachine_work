require './Stock'

class VendingMachine 
  attr_accessor :stock, :drink, :drinks, :slot_money

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @sales = 0
    @slot_money = 0
    @stock = Stock.new
  end

  def slot_money_setting(money) #自販機にお金を投入する処理。MONEYに含まれていないお金が投入された場合は返却する
    puts MONEY.include?(money) ? @slot_money += money : "#{money}円は使用できません" 
    money_transfer   
  end 

  def choose_drink(want_to_buy) #ユーザーがドリンクを選ぶ処理
    @drink = want_to_buy
  end
  
  def buy_drink #choose_drinkで選んだドリンクを実際に購入する処理
    @stock.drinks.each do |drink|
      if @drink == drink[:name] && @slot_money >= drink[:price] && drink[:stock] > 0
        puts "#{drink[:name]}を購入しました。"
        drink[:stock] -= 1
        @sales += drink[:price]
        @slot_money -= drink[:price]
        money_transfer  
        break
      end
    end
  end

  def change #お釣りを返す処理
    puts "釣り銭は#{@slot_money}円です。"
    @slot_money = 0
    money_transfer  
  end

  def sales_amount #売上確認するための処理
    puts @sales
  end

  private

  def money_transfer #slot_moneyをstockクラスで使えるようにするために値をmoney_dataに格納する処理
    @stock.money_data = @slot_money
  end

end