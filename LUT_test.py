import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import struct


x = np.arange(-250, 250)

def sigmoid (x):        # original sigmoid function
    z = np.exp(-x)
    y = 1 / (1 + z)

    return y

print(sigmoid(-1))
print(sigmoid(0))
print(sigmoid(1))

def mod_sigmoid (x):        # modified sigmoid function

    y = 0.5 * (x / (1 + np.abs(x)) + 1)

    return y

def double_to_hex(f):

    return hex(struct.unpack('<Q', struct.pack('<d', f))[0])

data = {'y': sigmoid(x)}

df = pd.DataFrame(data, columns= ['y'])

df.to_csv (r'C:/Users/yoons\Desktop/FPGA_NeuralNet/mod_sigmoid.csv', index= False, header= True)

plt.figure()
plt.title("Original Sigmoid"), plt.xlabel("x"), plt.ylabel("y")
plt.plot(x, sigmoid(x), "r")
plt.plot(x, mod_sigmoid(x), "b")
plt.legend("modified")
plt.legend("original")
plt.savefig("LUT_out.png")


# convert float to hex
in_file = open('sigmoid_fp.txt', 'r')
content = in_file.read().splitlines()
in_file.close()

# print(content)      # floating point values of sigmoid


for i in range (len(content)):
    foo = float(content[i])

    content[i] = double_to_hex(foo)


with open("sigmoid_hex.txt", "w") as file_out:
    for line in content:
        file_out.write("".join(line[2:]) + "\n")


