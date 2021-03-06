require "pry"

class Transfer
  # your code here
  
  attr_accessor :sender, :receiver, :amount
  attr_reader :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    #binding.pry
    
    if @status == 'pending' && self.valid? && @sender.balance >= @amount
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = 'complete'
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end

end
