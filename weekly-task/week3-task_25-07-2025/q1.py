# 1. BankAccount Class Implementation
class BankAccount:
    def __init__(self, accountno, name, balance):
        self.__accountno = accountno
        self.__name = name
        self.__balance = balance

    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            return True
        return False

    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            return True
        return False

    def set_accountno(self, accountno):
        self.__accountno = accountno

    def get_accountno(self):
        return self.__accountno

    def set_name(self, name):
        self.__name = name

    def get_name(self):
        return self.__name

    def set_balance(self, balance):
        if balance >= 0:
            self.__balance = balance

    def get_balance(self):
        return self.__balance 

if __name__ == "__main__":
    # Create a BankAccount object
    acc1 = BankAccount(12345, "Alice", 1000)
    acc2 = BankAccount(67890, "Bob", 500)

    # Deposit money
    acc1.deposit(200)
    acc2.deposit(300)

    # Withdraw money
    acc1.withdraw(150)
    acc2.withdraw(1000)  # Should fail, not enough balance

    # Print account details
    print(f"Account 1: {acc1.get_accountno()}, {acc1.get_name()}, Balance: {acc1.get_balance()}")
    print(f"Account 2: {acc2.get_accountno()}, {acc2.get_name()}, Balance: {acc2.get_balance()}") 
