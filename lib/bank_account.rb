class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    @@all = []
    
    def initialize(name, balance=1000, status="open")
        @name = name
        @balance = balance
        @status = status
        @@all << self
    end

    def deposit(deposit)
        @deposit = deposit
        self.balance += @deposit 
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        self.status == "open" && self.balance > 0
    end

    def close_account
        self.status = "closed"
    end

end
