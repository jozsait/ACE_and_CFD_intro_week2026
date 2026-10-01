%% clear up variables
clear all;
close all;
clc;

%% define input parameters

% gravitational acceleration [m/2^s]
g = 9.81;

% surface area [m^2]
S = 1.0;

% water density [kg/m^3]
rho = 1000;

% loss coefficient [Pa s^2 / kg^2]
Cl = 1000;

% initial water level [m]
h0 = 4;

%% calculated parameters

alpha = -sqrt(g/S^2/rho/Cl);
Ci_prime = sqrt(h0);

t_e = -2*sqrt(h0)/alpha;

%% solutions

t_past = linspace(-0.2*t_e,0);

t0 = 0;
t1 = t_e;
t = linspace(t0,t1,51);

h = alpha^2*t.^2/4 + alpha*t*sqrt(h0) + h0;
h_ave = (alpha^2 *t_e^3/12 + alpha*sqrt(h0)*t_e^2/2  + h0*t_e) / (t_e-t0);
disp({'the numerically computed average height of the water is:', mean(h)})
disp({'the analytically computed average height of the water is:', mean(h_ave)})

%% visualisations
plot(t,h,'-k','LineWidth',2)
hold on
plot(t_past,t_past*0+h0,'-r','LineWidth',2)
plot(t,t*0+h_ave,'--g','LineWidth',2)
xlim([-0.2*t_e,t_e])
ylim([0,1.05*h0])
xlabel('t [s]')
ylabel('h [m]')