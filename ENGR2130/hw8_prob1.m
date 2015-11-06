% HW #8, Problem 1 (Cengel Thermodynamics, McGraw-Hill Connect)
clear; clc; format compact; format short;

TH = 25 + 273;
TL = -6 + 273;
QH = 255;
QL = QH - QH*((TH-TL)/TH);
SH = QH/TH
SL = -QL/TL
Stot = SH+SL