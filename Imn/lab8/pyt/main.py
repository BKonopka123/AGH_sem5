import numpy as np
import matplotlib.pyplot as plt
import re
import math

vx = []
vy = []
with open("plots/v_x.txt") as file:
	for line in file.readlines():
			vx.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/v_y.txt") as file:
	for line in file.readlines():
			vy.append([float(i) for i in line.split(' ') if i != '\n'])

c0 = []
c01 = []
xsr0 = []
xsr01 = []
t = []
with open("plots/c_0.txt") as file:
	for line in file.readlines():
			c0.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/c_01.txt") as file:
	for line in file.readlines():
			c01.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/xsr_0.txt") as file:
	for line in file.readlines():
			xsr0.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/xsr_01.txt") as file:
	for line in file.readlines():
			xsr01.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/tgrid.txt") as file:
	for line in file.readlines():
			t.append([float(i) for i in line.split(' ') if i != '\n'])
		
u01 = []
u02 = []
u03 = []
u04 = []
u05 = []
u011 = []
u012 = []
u013 = []
u014 = []
u015 = []
with open("plots/u_0_1.txt") as file:
	for line in file.readlines():
			u01.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_0_2.txt") as file:
	for line in file.readlines():
			u02.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_0_3.txt") as file:
	for line in file.readlines():
			u03.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_0_4.txt") as file:
	for line in file.readlines():
			u04.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_0_5.txt") as file:
	for line in file.readlines():
			u05.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_1_1.txt") as file:
	for line in file.readlines():
			u011.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_1_2.txt") as file:
	for line in file.readlines():
			u012.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_1_3.txt") as file:
	for line in file.readlines():
			u013.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_1_4.txt") as file:
	for line in file.readlines():
			u014.append([float(i) for i in line.split(' ') if i != '\n'])
with open("plots/u_1_5.txt") as file:
	for line in file.readlines():
			u015.append([float(i) for i in line.split(' ') if i != '\n'])



figure1, ((ax1), (ax2)) = plt.subplots(2, 1, figsize=(5, 5))
ax1.imshow(vx, cmap='jet')
ax1.set_xlim(0,400)
ax1.set_ylim(0,90)
ax1.title.set_text('Vx')
ax1.set_xlabel('x')
ax1.set_ylabel('y')

ax2.imshow(vy, cmap='jet')
ax2.set_xlim(0,400)
ax2.set_ylim(0,90)
ax2.title.set_text('Vy')
ax2.set_xlabel('x')
ax2.set_ylabel('y')

figure1.colorbar(ax1.imshow(vx, cmap='jet', vmin=-5, vmax=45), ax=ax1, fraction=0.012, pad=0.01)
figure1.colorbar(ax2.imshow(vy, cmap='jet', vmin=-20, vmax=20), ax=ax2, fraction=0.012, pad=0.01)

plt.savefig("Vx_Vy.png",bbox_inches='tight',transparent=False)

figure2, ((ax3), (ax4)) = plt.subplots(2, 1, figsize=(5, 10))
ax3.plot(t, c0, label='D=0.0')
ax3.plot(t, c01, label='D=0.1')
ax3.set_xlim([0,0.6])
ax3.set_ylim([0.5,1.05])
ax3.title.set_text('c(tn)')
ax3.set_xlabel('tn')
ax3.set_ylabel('c(tn)')
ax3.legend(loc='lower left')

ax4.plot(t, xsr0, label='D=0.0')
ax4.plot(t, xsr01, label='D=0.1')
ax4.set_xlim([0,0.6])
ax4.set_ylim([0,4])
ax4.title.set_text('xsr(tn)')
ax4.set_xlabel('tn')
ax4.set_ylabel('xsr(tn)')
ax4.legend(loc='lower left')

plt.savefig("C(tn)_Xsr(tn).png",bbox_inches='tight',transparent=False)

figure3, ((ax5, ax6, ax7, ax8, ax9), (ax10, ax11, ax12, ax13, ax14)) = plt.subplots(2, 5, figsize=(25, 5))
ax5.imshow(u01, cmap='jet')
ax5.set_xlim(0,400)
ax5.set_ylim(0,90)
ax5.title.set_text('U1 D=0.0')
ax5.set_xlabel('x')
ax5.set_ylabel('y')

ax6.imshow(u02, cmap='jet')
ax6.set_xlim(0,400)
ax6.set_ylim(0,90)
ax6.title.set_text('U2 D=0.0')
ax6.set_xlabel('x')
ax6.set_ylabel('y')

ax7.imshow(u03, cmap='jet')
ax7.set_xlim(0,400)
ax7.set_ylim(0,90)
ax7.title.set_text('U3 D=0.0')
ax7.set_xlabel('x')
ax7.set_ylabel('y')

ax8.imshow(u04, cmap='jet')
ax8.set_xlim(0,400)
ax8.set_ylim(0,90)
ax8.title.set_text('U4 D=0.0')
ax8.set_xlabel('x')
ax8.set_ylabel('y')

ax9.imshow(u05, cmap='jet')
ax9.set_xlim(0,400)
ax9.set_ylim(0,90)
ax9.title.set_text('U5 D=0.0')
ax9.set_xlabel('x')
ax9.set_ylabel('y')

ax10.imshow(u011, cmap='jet')
ax10.set_xlim(0,400)
ax10.set_ylim(0,90)
ax10.title.set_text('U1 D=0.1')
ax10.set_xlabel('x')
ax10.set_ylabel('y')

ax11.imshow(u012, cmap='jet')
ax11.set_xlim(0,400)
ax11.set_ylim(0,90)
ax11.title.set_text('U2 D=0.1')
ax11.set_xlabel('x')
ax11.set_ylabel('y')

ax12.imshow(u013, cmap='jet')
ax12.set_xlim(0,400)
ax12.set_ylim(0,90)
ax12.title.set_text('U3 D=0.1')
ax12.set_xlabel('x')
ax12.set_ylabel('y')

ax13.imshow(u014, cmap='jet')
ax13.set_xlim(0,400)
ax13.set_ylim(0,90)
ax13.title.set_text('U4 D=0.1')
ax13.set_xlabel('x')
ax13.set_ylabel('y')

ax14.imshow(u015, cmap='jet')
ax14.set_xlim(0,400)
ax14.set_ylim(0,90)
ax14.title.set_text('U5 D=0.1')
ax14.set_xlabel('x')
ax14.set_ylabel('y')

figure3.colorbar(ax5.imshow(u01, cmap='jet', vmin=0, vmax=1), ax=ax5, fraction=0.012, pad=0.01)
figure3.colorbar(ax6.imshow(u02, cmap='jet', vmin=0, vmax=1), ax=ax6, fraction=0.012, pad=0.01)
figure3.colorbar(ax7.imshow(u03, cmap='jet', vmin=0, vmax=1), ax=ax7, fraction=0.012, pad=0.01)
figure3.colorbar(ax8.imshow(u04, cmap='jet', vmin=0, vmax=1), ax=ax8, fraction=0.012, pad=0.01)
figure3.colorbar(ax9.imshow(u05, cmap='jet', vmin=0, vmax=1), ax=ax9, fraction=0.012, pad=0.01)
figure3.colorbar(ax10.imshow(u011, cmap='jet', vmin=0, vmax=1), ax=ax10, fraction=0.012, pad=0.01)
figure3.colorbar(ax11.imshow(u012, cmap='jet', vmin=0, vmax=1), ax=ax11, fraction=0.012, pad=0.01)
figure3.colorbar(ax12.imshow(u013, cmap='jet', vmin=0, vmax=1), ax=ax12, fraction=0.012, pad=0.01)
figure3.colorbar(ax13.imshow(u014, cmap='jet', vmin=0, vmax=1), ax=ax13, fraction=0.012, pad=0.01)
figure3.colorbar(ax14.imshow(u015, cmap='jet', vmin=0, vmax=1), ax=ax14, fraction=0.012, pad=0.01)

plt.savefig("U.png",bbox_inches='tight',transparent=False)


