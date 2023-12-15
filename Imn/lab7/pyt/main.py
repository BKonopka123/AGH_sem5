import numpy as np
import matplotlib.pyplot as plt
import re
import math

xgrid_file = open("plots/xgrid.txt", "r") 
ygrid_file = open("plots/ygrid.txt", "r")

xgrid = [float(s) for s in re.findall(r'-?\d+\.?\d*', xgrid_file.readline())]
ygrid = [float(s) for s in re.findall(r'-?\d+\.?\d*', ygrid_file.readline())]

psi_minus_one = []
psi_minus_four = []
psi_four = []
u_minus_one = []
u_minus_four = []
u_four = []
v_minus_one = []
v_minus_four = []
v_four = []
zeta_minus_one = []
zeta_minus_four = []
zeta_four = []

with open("plots/psi_-1000.txt") as file:
	for line in file.readlines():
			psi_minus_one.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/psi_-4000.txt") as file:
	for line in file.readlines():
            psi_minus_four.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/psi_4000.txt") as file:
	for line in file.readlines():
            psi_four.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_-1000.txt") as file:
	for line in file.readlines():
            u_minus_one.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_-4000.txt") as file:
	for line in file.readlines():
            u_minus_four.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_4000.txt") as file:
	for line in file.readlines():
            u_four.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/v_-1000.txt") as file:
	for line in file.readlines():
            v_minus_one.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/v_-4000.txt") as file:
	for line in file.readlines():
            v_minus_four.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/v_4000.txt") as file:
	for line in file.readlines():
            v_four.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/zeta_-1000.txt") as file:
	for line in file.readlines():
            zeta_minus_one.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/zeta_-4000.txt") as file:
	for line in file.readlines():
            zeta_minus_four.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/zeta_4000.txt") as file:
	for line in file.readlines():
            zeta_four.append([float(i) for i in line.split(' ') if i != '\n'])

figure1, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(19, 14))

contour_plot1 = ax1.contour(psi_minus_one, cmap='inferno', levels=20)
contour_plot1.set_clim(-55, -50)
ax1.set_xlim(0, 200)
ax1.set_ylim(0, 90)
ax1.title.set_text('Q=-1000, psi Contour')
ax1.set_xlabel('x')
ax1.set_ylabel('y')
ax1.set_aspect('equal', adjustable='box')

contour_plot2 = ax2.contour(zeta_minus_one, cmap='inferno', levels=60)
contour_plot2.set_clim(-200, 350)
ax2.set_xlim(0,200)
ax2.set_ylim(0,90)
ax2.title.set_text('Q=-1000, zeta')
ax2.set_xlabel('x')
ax2.set_ylabel('y')
ax2.set_aspect('equal', adjustable='box')

ax3.imshow(u_minus_one, cmap='jet')
ax3.set_xlim(0,200)
ax3.set_ylim(0,90)
ax3.title.set_text('Q=-1000, u')
ax3.set_xlabel('x')
ax3.set_ylabel('y')

ax4.imshow(v_minus_one, cmap='jet')
ax4.set_xlim(0,200)
ax4.set_ylim(0,90)
ax4.title.set_text('Q=-1000, v')
ax4.set_xlabel('x')
ax4.set_ylabel('y')

figure1.colorbar(contour_plot1, ax=ax1, fraction=0.022, pad=0.01)
figure1.colorbar(contour_plot2, ax=ax2, fraction=0.022, pad=0.01)
figure1.colorbar(ax3.imshow(u_minus_one, cmap='jet', vmin=-2, vmax=16), ax=ax3, fraction=0.022, pad=0.01)
figure1.colorbar(ax4.imshow(v_minus_one, cmap='jet', vmin=-6, vmax=1), ax=ax4, fraction=0.022, pad=0.01)

plt.savefig("Q=-1000.png",bbox_inches='tight',transparent=False)

figure2, ((ax5, ax6), (ax7, ax8)) = plt.subplots(2, 2, figsize=(19, 14))

contour_plot1 = ax5.contour(psi_minus_four, cmap='inferno', levels=16)
contour_plot2.set_clim(-218, -202)
ax5.set_xlim(0,200)
ax5.set_ylim(0,90)
ax5.title.set_text('Q=-4000, psi')
ax5.set_xlabel('x')
ax5.set_ylabel('y')
ax5.set_aspect('equal', adjustable='box')

contour_plot2 = ax6.contour(zeta_minus_four, cmap='inferno', levels=60)
contour_plot2.set_clim(-700, 1100)
ax6.set_xlim(0,200)
ax6.set_ylim(0,90)
ax6.title.set_text('Q=-4000, zeta')
ax6.set_xlabel('x')
ax6.set_ylabel('y')
ax6.set_aspect('equal', adjustable='box')

ax7.imshow(u_minus_four, cmap='jet')
ax7.set_xlim(0,200)
ax7.set_ylim(0,90)
ax7.title.set_text('Q=-4000, u')
ax7.set_xlabel('x')
ax7.set_ylabel('y')

ax8.imshow(v_minus_four, cmap='jet')
ax8.set_xlim(0,200)
ax8.set_ylim(0,90)
ax8.title.set_text('Q=-4000, v')
ax8.set_xlabel('x')
ax8.set_ylabel('y')

figure2.colorbar(contour_plot1, ax=ax5, fraction=0.022, pad=0.01)
figure2.colorbar(contour_plot2, ax=ax6, fraction=0.022, pad=0.01)
figure2.colorbar(ax7.imshow(u_minus_four, cmap='jet', vmin=-10, vmax=70), ax=ax7, fraction=0.022, pad=0.01)
figure2.colorbar(ax8.imshow(v_minus_four, cmap='jet', vmin=-14, vmax=4), ax=ax8, fraction=0.022, pad=0.01)

plt.savefig("Q=-4000.png",bbox_inches='tight',transparent=False)

figure3, ax9 = plt.subplots(1, 1)

contour_plot = ax9.contour(psi_four, cmap='inferno', levels=16)
contour_plot.set_clim(202, 218)
ax9.set_xlim(0,200)
ax9.set_ylim(0,90)
ax9.title.set_text('Q=4000, psi')
ax9.set_xlabel('x')
ax9.set_ylabel('y')
ax9.set_aspect('equal', adjustable='box')

figure3.colorbar(contour_plot, ax=ax9, fraction=0.022, pad=0.01)

plt.savefig("Q=4000.png",bbox_inches='tight',transparent=False)