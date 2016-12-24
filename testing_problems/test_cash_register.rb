require "minitest/autorun"
require_relative 'cash_register'
require_relative 'transaction'
require 'Pry'
class CashRegisterTest < MiniTest::Test 

  def test_accept_money
    register = CashRegister.new(1000)
    deposit_transaction = Transaction.new(10)
    previous_amount = register.total_money

    deposit_transaction = Transaction.new(10)
    deposit_transaction.amount_paid = 10
    deposit = register.accept_money(deposit_transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 10, current_amount
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(10)
    previous_amount = register.total_money
    transaction.amount_paid = 20
    
    amount_of_change = register.change(transaction)
    
    assert_equal 10, amount_of_change
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(10)

    assert_output "You've paid $10.\n" do
      register.give_receipt(transaction)
    end
  end

  

end

