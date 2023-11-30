import numpy as np
import matplotlib.pyplot as plt
import re
import math

f = open("data.txt", "r") 

V16 = []
V8 = []
V4 = []
V2 = []
V1 = []
S16 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
it16 = [int(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
for i in range(0, 9):
    V16.append([float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())])
S8 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
it8 = [int(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
for i in range(0, 17):
    V8.append([float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())])
S4 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
it4 = [int(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
for i in range(0, 33):
    V4.append([float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())])
S2 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
it2 = [int(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
for i in range(0, 65):
    V2.append([float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())])
S1 = [float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
it1 = [int(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())]
for i in range(0, 129):
    V1.append([float(s) for s in re.findall(r'-?\d+\.?\d*', f.readline())])
itt16 = [i for i in range(0,it16[0])]
itt8 = [i for i in range(it16[0],it8[0])]
itt4 = [i for i in range(it8[0],it4[0])]
itt2 = [i for i in range(it4[0],it2[0])]
itt1 = [i for i in range(it2[0],it1[0])]

print("Liczba iteracji = ")
print(it1[0])

figure, ((ax1, ax2, ax3), (ax4, ax5, ax6)) = plt.subplots(2, 3, figsize=(20, 10))
ax1.imshow(V16, cmap='jet')
ax1.set_xlim(-0.5,8.5)
ax1.set_ylim(-0.5,8.5)
ax1.title.set_text('k=16')
ax1.set_xlabel('x')
ax1.set_ylabel('y')

ax2.imshow(V8, cmap='jet')
ax2.set_xlim(-0.5,16.5)
ax2.set_ylim(-0.5,16.5)
ax2.title.set_text('k=8')
ax2.set_xlabel('x')
ax2.set_ylabel('y')

ax3.imshow(V4, cmap='jet')
ax3.set_xlim(-0.5,32.5)
ax3.set_ylim(-0.5,32.5)
ax3.title.set_text('k=4')
ax3.set_xlabel('x')
ax3.set_ylabel('y')

ax4.imshow(V2, cmap='jet')
ax4.set_xlim(-0.5,64.5)
ax4.set_ylim(-0.5,64.5)
ax4.title.set_text('k=2')
ax4.set_xlabel('x')
ax4.set_ylabel('y')

ax5.imshow(V1, cmap='jet')
ax5.set_xlim(-0.5,128.5)
ax5.set_ylim(-0.5,128.5)
ax5.title.set_text('k=1')
ax5.set_xlabel('x')
ax5.set_ylabel('y')

ax6.plot(itt16, S16, label='k=16')
ax6.plot(itt8, S8, label='k=8')
ax6.plot(itt4, S4, label='k=4')
ax6.plot(itt2, S2, label='k=2')
ax6.plot(itt1, S1, label='k=1')
ax6.set_xlabel('it')
ax6.set_ylabel('S')
ax6.title.set_text('S(it)')
ax6.legend(loc='upper right')
ax6.set_xlim([0,600])
ax6.set_ylim([4.2,5.6])

figure.colorbar(ax1.imshow(V16, cmap='jet'), ax=ax1, fraction=0.046, pad=0.025)
figure.colorbar(ax2.imshow(V8, cmap='jet'), ax=ax2, fraction=0.046, pad=0.025)
figure.colorbar(ax3.imshow(V4, cmap='jet'), ax=ax3, fraction=0.046, pad=0.025)
figure.colorbar(ax4.imshow(V2, cmap='jet'), ax=ax4, fraction=0.046, pad=0.025)
figure.colorbar(ax5.imshow(V1, cmap='jet'), ax=ax5, fraction=0.046, pad=0.025)

plt.savefig("lab5.png",bbox_inches='tight',transparent=False)






