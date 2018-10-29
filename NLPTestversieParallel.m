%SC42055 Assignment 3: Nonlinear Programming
%Jorge Bonekamp: 4474554
%Dylan Kalisvaart: 4466748

clear all
close all
clc
format long
%% Initializing and defining global constants
%Defining all constants globally
global Da1 Da2 Da3 Db1 Db2 Db3 E1 E2 E3
global T lambda L tau mu Cr rho_m alfa K a v_f rho_c Vdef Dr
global rho_init v_init wr_init x0

%Defining the student-dependent constants
student_par=zeros(3 ) + [5, 5, 4;7,4,8;6,4.5,6];
Da1 = 5;
Da2 = 5;
Da3 = 4;
Db1 = 7;
Db2 = 4;
Db3 = 8;

E1 = (Da1 + Db1)/2;
E2 = (Da2 + Db2)/2;
E3 = (Da3 + Db3)/2;

%Defining model parameters
T = 10/3600;        % h                 % Simulation time step
lambda = 3;         % lane              % Number of lanes of a segment
L = 1;              % km                % Segment length
tau = 10/3600;      % h                 % METANET model parameter
mu = 80;            % km^2/h            % METANET model parameter
Cr = 2000;          % veh/h             % METANET model parameter
rho_m = 120;        % veh/(km lane)     % METANET model parameter
alfa = 0.1;         % -                 % METANET, compliance to speed limit panels
K = 10;             % -                 % METANET model parameter
a = 2;              % -                 % METANET model parameter
v_f = 110;          % km/h              % METANET, steady state free flow speed
rho_c = 28;         % veh/(km lane)     % METANET, critical density
Vdef = 120;         % km/h              % Default speed limit
Dr = 1500;          % veh/h             % Ramp demand, constant for all k
rho_init = 30;      % veh/km            % Initial densities
v_init = 90;        % km/h              % Initial speeds
wr_init = 0;        % -                 % Initial ramp metering rate

%% Initializing vectors
x0 = [rho_init; rho_init; rho_init; rho_init; v_init; v_init; v_init; v_init; wr_init];
x_initk = [0; 0; 0; 0; 0; 0; 0; 0; 0; 120; 0];
lbk = zeros(11,1);
lbk(10,1) = 60;
ubk = Inf*ones(11,1);
ubk(10,1) = 120;
x_initguess = zeros(11*59,1);
lb = zeros(11*59,1);
ub = zeros(11*59,1);
options=optimoptions('fmincon', 'Algorithm', 'interior-point', 'MaxFunEvals', 1000000);

for k = 1:11:58*11+1
    x_initguess(k:k+10)=x_initk;
    lb(k:k+10)=lbk;
    ub(k:k+10)=ubk;
end

optionsga = optimoptions('ga', 'UseVectorized', false, 'UseParallel', true);
[xga,fvalga,flagga,outputga] = ga(@ObjectiveFunction, 11*59, [], [], [], [], lb, ub, @EqualityConstraint,optionsga);
%%
[x,fval,flag,output] = fmincon(@ObjectiveFunction, x_initguess, [], [], [], [], lb, ub, @EqualityConstraint,options);
GoalFun = ObjectiveFunction(x);
[c, ceq] = EqualityConstraint(x);
error = ceq'*ceq;
