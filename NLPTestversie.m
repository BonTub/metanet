%SC42055 Assignment 2: Quadratic Programming
%Jorge Bonekamp: 4474554
%Dylan Kalisvaart: 4466748

clear all
close all
clc
%% Initializing and defining global constants
clear all
close all
clc
format long

% 
pkg load optim;
pkg load control;

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
rho_init = 20;      % veh/km            % Initial densities
v_init = 90;        % km/h              % Initial speeds
wr_init = 0;        % -                 % Initial ramp metering rate

%% Initializing vectors
x0 = [rho_init; rho_init; rho_init; rho_init; v_init; v_init; v_init; v_init; wr_init];
x_initk = [0; 0; 0; 0; 0; 0; 0; 0; 0; 120; 0];
lbk = zeros(11,1);
lbk(10,1) = 60;
ubk = Inf*ones(11,1);
ubk(10,1) = 120;
optoptions = options('Algorithm', 'sqp', 'MaxFunEvals', 1000000);
x_initguess = zeros(11*60,1);
lb = zeros(11*60,1);
ub = zeros(11*60,1);

for k = 1:11:59*11+1
    x_initguess(k:k+10)=x_initk;
    lb(k:k+10)=lbk;
    ub(k:k+10)=ubk;
end

%%
%[x,fval,flag,output] = fmincon(@ObjectiveFunction, x_initguess, [], [], [], [], lb, ub, @EqualityConstraint,optoptions);
[x,obj,info,iter,nf, lam] = sqp( x_initguess,@ObjectiveFunction,[],[],lb,ub,100000);
%[x,fval,flag,output] = nonlin_min(@ObjectiveFunction, x_initguess, [], [], [], [], lb, ub, @EqualityConstraint,optoptions);
%optoptions2 = options('Algorithm', 'sqp','lbound',lb,'ubound',ub,'f_equc_idx' , @EqualityConstraint, 'MaxFunEvals', 1000000)
%[x, OBJF, CVG, OUTP] = fminbnd(@ObjectiveFunction, x_initguess, optoptions2 )
%%
%% Plotting VSL Results
count = 0;
for k = 0:1:58
     count = count +1;
     VSLS(count)=x(10+k*11);
end
t=1:1:59;
plot(t,VSLS)
%% Plotting density results
count = 0;
for k = 0:1:58
     count = count +1;
     RHOS(1:4,count)=x(1+k*11:k*11+4);
end
plot(t,RHOS)
%% Plotting Speeds results
count = 0;
for k = 0:1:58
     count = count +1;
     SPEEDS(1:4,count)=x(5+k*11:k*11+8);
end
plot(t,SPEEDS)
