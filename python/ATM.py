class ATM:
  def __init__(self,name,balance,ID,pin):
      self.name = name
      self.balance = int(balance)
      self.ID = int(ID)
      self.pin = int(pin)
def change_name(self,new_name):
    self.name = new_name
    print(f"New name: {self.name}")
def check_balance(self):
    print(f"Account: {self.name}\n balance: {self.balance}")
def check_ID(self):
    print(f"Account: {self.name}\n ID: {self.ID}")
def change_pin(self,new_pin):
    self.pin = new_pin
    print(f"Account: {self.name}\n Change New Pin success")
def deposit(self,money):
    self.balance += money
    print(f"Account: {self.name} balance: {self.balance} \n success")
    
scb = ATM("jirawat.L","20000","1","1234") 
print(scb.name,scb.balance,scb.ID,scb.pin)

scb.change_name("jice")

scb.check_balance()

scb.deposit(50000)

scb.change_pin(32649)

scb.deposit(-10000)
