require './Stock'

class VendingMachine 
  include Drinks
  attr_accessor :user_slot_money, :sales, :stock, :drink, :drinks

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @user_slot_money = 0
    @stock = Stock.new
  end

  def slot_money_setting(money) #自販機にお金を投入する処理。MONEYに含まれていないお金が投入された場合は返却する
    @user_slot_money += money
    puts MONEY.include?(money) ? @stock.slot_money += @user_slot_money : "#{money}円は使用できません"    
  end 

  def choose_drink(want_to_buy) #ユーザーがドリンクを選ぶ処理
    @drink = want_to_buy
  end
  
  def buy_drink #choose_drinkで選んだドリンクを実際に購入する処理
    @stock.drinks.each do |drink|
      if @drink == drink[:name] && @stock.slot_money >= drink[:price] && drink[:stock] > 0
        puts "#{drink[:name]}を購入しました。"
        drink[:stock] -= 1
        @stock.sales += drink[:price]
        @stock.slot_money -= drink[:price]
        break
      end
    end
  end

  def change #お釣りを返す処理
    puts "釣り銭は#{@stock.slot_money}円です。"
    @slot_money = 0
  end

  def sales_amount #売上確認するための処理
    puts @stock.sales
  end
end