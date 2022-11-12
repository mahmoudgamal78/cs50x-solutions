from cs50 import get_int


def get_credit_number():
    
    while True:
        n = get_int("Number: ")
        
        if n > 0:
            break
    return n


n = get_credit_number()
n = str(n)

# print(n)

# twice_digit ... every other digit multiplies by 22
twice_digit = 0

credit_digit_sum = 0

# print(len(str(n)))

for i in range(0, len(n)):
    
    # print("i is", i)
    
    # print("digit is", n[i])
    
    if i > 0 and (((i + 1) % 2) == 0):
        
        # print("every other from the last", n[len(n) - i - 1])
        
        twice_digit = int(n[len(n) - i - 1]) * 2
        
        if (twice_digit > 9):
            
            # if the product is over 9, you have to sum the two digits
            
            # print("twice digit ", twice_digit)
            
            # print("str(twice_digit)[0] ", str(twice_digit)[0])
            
            twice_digit = int(str(twice_digit)[0]) + int(str(twice_digit)[1])
            
            # print("twice digit ", twice_digit)
            
        credit_digit_sum = credit_digit_sum + twice_digit
            
    else:
        credit_digit_sum = credit_digit_sum + int(n[len(n) - i - 1])
        
        
# print("credit_digit_sum ", credit_digit_sum)

# print(int(n[0:1]))

if ((credit_digit_sum % 10) == 0) and ((len(n) == 13) or (len(n) == 15) or (len(n) == 16)):
    
    # print("yes")
    
    # print(int(n[0:1]))
    
    if ((len(n) == 15) and ((int(n[0:2]) == 34) or (int(n[0:2]) == 37))):
        print("AMEX\n")
        
    else:
        
        if ((len(n) == 16) and ((int(n[0:2]) >= 51) and (int(n[0:2]) <= 55))):
            
            print("MASTERCARD\n")
        
        else:
            
            if ((len(n) == 13) or (len(n) == 16)) and (int(n[0]) == 4):
                
                print("VISA\n")

else:
    print("INVALID\n")
    