import numpy as np
import matplotlib.pyplot as plt
import re
import math

V5A = []
V5B = []
V5C = []
V6A = []
V6B = []
V6C = []
with open("5a.txt") as file:
	for line in file.readlines():
			V5A.append([float(i) for i in line.split(' ') if i != '\n'])
with open("5b.txt") as file:
	for line in file.readlines():
			V5B.append([float(i) for i in line.split(' ') if i != '\n'])
with open("5c.txt") as file:
	for line in file.readlines():
			V5C.append([float(i) for i in line.split(' ') if i != '\n'])
with open("6a.txt") as file:
	for line in file.readlines():
			V6A.append([float(i) for i in line.split(' ') if i != '\n'])
with open("6b.txt") as file:
	for line in file.readlines():
			V6B.append([float(i) for i in line.split(' ') if i != '\n'])
with open("6c.txt") as file:
	for line in file.readlines():
			V6C.append([float(i) for i in line.split(' ') if i != '\n'])

figure, ((ax1, ax2, ax3), (ax4, ax5, ax6)) = plt.subplots(2, 3, figsize=(20, 10))
ax1.imshow(V5A, cmap='seismic')
ax1.set_xlim(0,50)
ax1.set_ylim(0,50)
ax1.title.set_text('nx=ny=50, E1=1, E2=1')
ax1.set_xlabel('x')
ax1.set_ylabel('y')

ax2.imshow(V5B, cmap='seismic')
ax2.set_xlim(0,100)
ax2.set_ylim(0,100)
ax2.title.set_text('nx=ny=100, E1=1, E2=1')
ax2.set_xlabel('x')
ax2.set_ylabel('y')

ax3.imshow(V5C, cmap='seismic')
ax3.set_xlim(0,200)
ax3.set_ylim(0,200)
ax3.title.set_text('nx=ny=200, E1=1, E2=1')
ax3.set_xlabel('x')
ax3.set_ylabel('y')

ax4.imshow(V6A, cmap='seismic')
ax4.set_xlim(0,100)
ax4.set_ylim(0,100)
ax4.title.set_text('nx=ny=100, E1=1, E2=1')
ax4.set_xlabel('x')
ax4.set_ylabel('y')

ax5.imshow(V6B, cmap='seismic')
ax5.set_xlim(0,100)
ax5.set_ylim(0,100)
ax5.title.set_text('nx=ny=50, E1=1, E2=2')
ax5.set_xlabel('x')
ax5.set_ylabel('y')

ax6.imshow(V6C, cmap='seismic')
ax6.set_xlim(0,100)
ax6.set_ylim(0,100)
ax6.title.set_text('nx=ny=50, E1=1, E2=10')
ax6.set_xlabel('x')
ax6.set_ylabel('y')

figure.colorbar(ax1.imshow(V5A, cmap='seismic',vmin=-10,vmax=10), ax=ax1, fraction=0.046, pad=0.025)
figure.colorbar(ax2.imshow(V5B, cmap='seismic',vmin=-10,vmax=10), ax=ax2, fraction=0.046, pad=0.025)
figure.colorbar(ax3.imshow(V5C, cmap='seismic',vmin=-10,vmax=10), ax=ax3, fraction=0.046, pad=0.025)
figure.colorbar(ax4.imshow(V6A, cmap='seismic',vmin=-0.8,vmax=0.8), ax=ax4, fraction=0.046, pad=0.025)
figure.colorbar(ax5.imshow(V6B, cmap='seismic',vmin=-0.8,vmax=0.8), ax=ax5, fraction=0.046, pad=0.025)
figure.colorbar(ax6.imshow(V6C, cmap='seismic',vmin=-0.8,vmax=0.8), ax=ax6, fraction=0.046, pad=0.025)

plt.savefig("RESULT_5_6.png",bbox_inches='tight',transparent=False)

