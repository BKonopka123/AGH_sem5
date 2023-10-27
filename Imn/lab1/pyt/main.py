import numpy as np
import matplotlib.pyplot as plt
import re
import math

fig = plt.figure()

f = open("data.txt", "r") 

#data in file data.txt is in format:
#zad1_1_A - t for t=1.0
#zad1_1_A - t for t=0.1
#zad1_1_A - t for t=0.01
#zad1_1_A - t for analitical solution
#zad1_1_A - y for t=1.0
#zad1_1_A - y for t=0.1
#zad1_1_A - y for t=0.01
#zad1_1_A - y for analitical solution
#zad1_1_B - global error for t=1.0
#zad1_1_B - global error for t=0.1
#zad1_1_B - global errer for t=0.01
#zad1_2_A - y for t=1.0
#zad1_2_A - y for t=0.1
#zad1_2_A - y for t=0.01
#zad1_2_B - global error for t=1.0
#zad1_2_B - global error for t=0.1
#zad1_2_B - global error for t=0.01
#zad1_3_A - y for t=1.0
#zad1_3_A - y for t=0.1
#zad1_3_A - y for t=0.01
#zad1_3_B - global error for t=1.0
#zad1_3_B - global error for t=0.1
#zad1_3_B - global error for t=0.01
#zad2_1 - t
#zad2_1 - q for w_v = w_0*0.5
#zad2_1 - i for w_v = w_0*0.5
#zad2_1 - q for w_v = w_0*0.8
#zad2_1 - i for w_v = w_0*0.8
#zad2_1 - q for w_v = w_0*1.0
#zad2_1 - i for w_v = w_0*1.0
#zad2_1 - q for w_v = w_0*1.2
#zad2_1 - i for w_v = w_0*1.2

#zad1_1_A
t11A1 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())] 
t11A2 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())] 
t11A3 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())] 
t11Aanali = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]

y11A1 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())] 
y11A2 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())] 
y11A3 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())] 
y11Aanali = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]


figure, (ax1, ax2) = plt.subplots(2)
ax1.plot(t11A3, y11A3, 'o', label='y(t) t=0.01')
ax1.plot(t11A2, y11A2, 'o', label='y(t) t=0.1')
ax1.plot(t11A1, y11A1, 'o', label='y(t) t=1.0') 
ax1.plot(t11Aanali, y11Aanali, label='y(t) analitycznie') 
ax1.title.set_text('Zad 1_1 A')
ax1.set_xlabel('t axis')
ax1.set_ylabel('y(t) axis')
ax1.legend()

#zad1_1_B
y11B1 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())] 
y11B2 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
y11B3 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]

ax2.plot(t11A3, y11B3, label='global error t=0.01')
ax2.plot(t11A2, y11B2, label='global error t=0.1')
ax2.plot(t11A1, y11B1, label='global error t=1.0')
ax2.title.set_text('Zad 1_1 B')
ax2.set_xlabel('t axis')
ax2.set_ylabel('global error axis')
ax2.legend()

plt.savefig("zad1_1.png",bbox_inches='tight',transparent=False)

#zad1_2_A
y12A1 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
y12A2 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
y12A3 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]


figure, (ax1, ax2) = plt.subplots(2)
ax1.plot(t11A3, y12A3, 'o', label='y(t) t=0.01')
ax1.plot(t11A2, y12A2, 'o', label='y(t) t=0.1')
ax1.plot(t11A1, y12A1, 'o', label='y(t) t=1.0')
ax1.plot(t11Aanali, y11Aanali, label='y(t) analitycznie')
ax1.title.set_text('Zad 1_2 A')
ax1.set_xlabel('t axis')
ax1.set_ylabel('y(t) axis')
ax1.legend()




#zad1_2_B
y12B1 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
y12B2 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
y12B3 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]

ax2.plot(t11A3, y12B3, label='global error t=0.01')
ax2.plot(t11A2, y12B2, label='global error t=0.1')
ax2.plot(t11A1, y12B1, label='global error t=1.0')
ax2.title.set_text('Zad 1_2 B')
ax2.set_xlabel('t axis')
ax2.set_ylabel('global error axis')
ax2.legend()
plt.savefig("zad1_2.png",bbox_inches='tight',transparent=False)

#zad1_3_A
y13A1 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
y13A2 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
y13A3 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]


figure, (ax1, ax2) = plt.subplots(2)
ax1.plot(t11A3, y13A3, 'o', label='y(t) t=0.01')
ax1.plot(t11A2, y13A2, 'o', label='y(t) t=0.1')
ax1.plot(t11A1, y13A1, 'o', label='y(t) t=1.0')
ax1.plot(t11Aanali, y11Aanali, label='y(t) analitycznie')
ax1.title.set_text('Zad 1_3 A')
ax1.set_xlabel('t axis')
ax1.set_ylabel('y(t) axis')
ax1.legend()

#zad1_3_B
y13B1 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
y13B2 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
y13B3 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]

ax2.plot(t11A3, y13B3, label='global error t=0.01')
ax2.plot(t11A2, y13B2, label='global error t=0.1')
ax2.plot(t11A1, y13B1, label='global error t=1.0')
ax2.title.set_text('Zad 1_3 B')
ax2.set_xlabel('t axis')
ax2.set_ylabel('global error axis')
ax2.legend()
plt.savefig("zad1_3.png",bbox_inches='tight',transparent=False)


#zad2_1
t = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
q21 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
i21 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
q22 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
i22 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
q23 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
i23 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
q24 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
i24 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]

figure, (ax1, ax2) = plt.subplots(2)
ax1.plot(t, q21, label='q(t) w_v = w_0*0.5')
ax1.plot(t, q22, label='q(t) w_v = w_0*0.8')
ax1.plot(t, q23, label='q(t) w_v = w_0*1.0')
ax1.plot(t, q24, label='q(t) w_v = w_0*1.2')
ax1.title.set_text('Zad 2_1_Q')
ax1.set_xlabel('t axis')
ax1.set_ylabel('q(t) axis')
ax1.legend()

ax2.plot(t, i21, label='i(t) w_v = w_0*0.5')
ax2.plot(t, i22, label='i(t) w_v = w_0*0.8')
ax2.plot(t, i23, label='i(t) w_v = w_0*1.0')
ax2.plot(t, i24, label='i(t) w_v = w_0*1.2')
ax2.title.set_text('Zad 2_1_I')
ax2.set_xlabel('t axis')
ax2.set_ylabel('i(t) axis')
ax2.legend()
plt.savefig("zad2_1.png",bbox_inches='tight',transparent=False)

