class atm:
    
    def __init__(self,name,balance,pw):
        self.name = name
        self.balance = balance
        self.pw = pw
    def change_name(self,new):
        self.name = new
        print(f"Account: {new}")
    def check_balance(self):
        print(f"Account: {self.name} \n Balance: {self.balance}")
    def change_pw(self,pin):
        self.pw = pin
        print(f"Account: {self.name} \n pw: {pin}")
    def deposit(self,money):
        self.balance += money
        print(f"Account: {self.name} \n Balance: {self.balance}")

   
scb = atm("jirawat.L",20000,1234) 
print(scb.name,scb.balance,scb.pw)

scb.change_name("jice")

scb.check_balance()

scb.deposit(1000)

scb.change_pw(32649)

scb.deposit(-20000)
