import numpy as np
import matplotlib.pyplot as plt
import re
import math

fig = plt.figure()

f = open("data.txt", "r") 

#t dla zadania 1 i 2
#u dal zadania 1
#z dla zadania 1
#u dla zadania 2
#z dla zadania 2
#u dla zadania 3
#z dla zadania 3

#zad1_1
t123 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
u1 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
z1 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
figure, (ax1) = plt.subplots(1)
ax1.plot(t123, u1, label='u(t)')
ax1.plot(t123, z1, label='v(t)')
ax1.title.set_text('Metoda Picarda')
ax1.set_xlabel('t')
ax1.set_ylabel('u(t), v(t)')
ax1.legend()
plt.savefig("zad1_1.png",bbox_inches='tight',transparent=False)

#zad1_2
u2 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
z2 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
figure, (ax2) = plt.subplots(1)
ax2.plot(t123, u1, label='u(t)')
ax2.plot(t123, z1, label='v(t)')
ax2.title.set_text('Iteracja Newtona')
ax2.set_xlabel('t')
ax2.set_ylabel('u(t), v(t)')
ax2.legend()
plt.savefig("zad1_2.png",bbox_inches='tight',transparent=False)

#zad2
u3 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
z3 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
figure, (ax3) = plt.subplots(1)
ax3.plot(t123, u1, label='u(t)')
ax3.plot(t123, z1, label='v(t)')
ax3.title.set_text('Niejawna RK2')
ax3.set_xlabel('t')
ax3.set_ylabel('u(t), v(t)')
ax3.legend()
plt.savefig("zad2.png",bbox_inches='tight',transparent=False)
