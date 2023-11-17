import numpy as np
import matplotlib.pyplot as plt
import re
import math

f = open("data.txt", "r") 

#zad1_1
t11 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
x11 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
v11 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
dt11 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]

t12 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
x12 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
v12 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
dt12 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]

t21 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
x21 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
v21 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
dt21 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]

t22 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
x22 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
v22 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
dt22 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]

figure, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(13, 10))
ax1.plot(t11, x11, label='TOL 10^(-2)')
ax1.plot(t12, x12, label='TOL 10^(-5)')
ax1.set_xlim([0,40])
ax1.set_ylim([-2.5,2.5])
ax1.title.set_text('Metoda Trapezow')
ax1.set_xlabel('t')
ax1.set_ylabel('x(t)')
ax1.legend(loc='upper right')

ax2.plot(t11, v11, label='TOL 10^(-2)')
ax2.plot(t12, v12, label='TOL 10^(-5)')
ax2.set_xlim([0,40])
ax2.set_ylim([-8,8])
ax2.title.set_text('Metoda Trapezow')
ax2.set_xlabel('t')
ax2.set_ylabel('v(t)')
ax2.legend(loc='upper right')

ax3.plot(t11, dt11, 'o-', markersize=3, label='TOL 10^(-2)')
ax3.plot(t12, dt12, 'o-', markersize=3, label='TOL 10^(-5)')
ax3.set_xlim([0,40])
ax3.set_ylim([0,1])
ax3.title.set_text('Metoda Trapezow')
ax3.set_xlabel('t')
ax3.set_ylabel('dt(t)')
ax3.legend(loc='upper right')

ax4.plot(x11, v11, label='TOL 10^(-2)')
ax4.plot(x12, v12, label='TOL 10^(-5)')
ax4.set_xlim([-2.5,2.5])
ax4.set_ylim([-8,8])
ax4.title.set_text('Metoda Trapezow')
ax4.set_xlabel('x')
ax4.set_ylabel('v(x)')
ax4.legend(loc='upper right')
plt.savefig("Metoda_trapezow.png",bbox_inches='tight',transparent=False)

figure, ((ax5, ax6), (ax7, ax8)) = plt.subplots(2, 2, figsize=(13, 10))
ax5.plot(t21, x21, label='TOL 10^(-2)')
ax5.plot(t22, x22, label='TOL 10^(-5)')
ax5.set_xlim([0,40])
ax5.set_ylim([-2.5,2.5])
ax5.title.set_text('Metoda RK2')
ax5.set_xlabel('t')
ax5.set_ylabel('x(t)')
ax5.legend(loc='upper right')

ax6.plot(t21, v21, label='TOL 10^(-2)')
ax6.plot(t22, v22, label='TOL 10^(-5)')
ax6.set_xlim([0,40])
ax6.set_ylim([-8,8])
ax6.title.set_text('Metoda RK2')
ax6.set_xlabel('t')
ax6.set_ylabel('v(t)')
ax6.legend(loc='upper right')

ax7.plot(t21, dt21,'o-', markersize=3, label='TOL 10^(-2)')
ax7.plot(t22, dt22,'o-', markersize=3, label='TOL 10^(-5)')
ax7.set_xlim([0,40])
ax7.set_ylim([0,1])
ax7.title.set_text('Metoda RK2')
ax7.set_xlabel('t')
ax7.set_ylabel('dt(t)')
ax7.legend(loc='upper right')

ax8.plot(x21, v21, label='TOL 10^(-2)')
ax8.plot(x22, v22, label='TOL 10^(-5)')
ax8.set_xlim([-2.5,2.5])
ax8.set_ylim([-8,8])
ax8.title.set_text('Metoda RK2')
ax8.set_xlabel('x')
ax8.set_ylabel('v(x)')
ax8.legend(loc='upper right')
plt.savefig("Metoda_RK2.png",bbox_inches='tight',transparent=False)



