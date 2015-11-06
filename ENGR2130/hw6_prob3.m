% HW #6, Problem 3 (Cengel Thermodynamics, McGraw-Hill Connect)
clear; clc; format compact; format short;

hf = 105.29;
hfg = 162.68;
m_dot_mult = 3.2;

h1 = 66.18;
h2 = 291.36;
h3 = (m_dot_mult * h1 + h2) / (1 + m_dot_mult)
x = (h3 - hf) / hfg