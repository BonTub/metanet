%SC42055 Assignment 2: Quadratic Programming
%SC42055 Assignment 3: Nonlinear Programming
%Jorge Bonekamp: 4474554
%Dylan Kalisvaart: 4466748

function [xk1 ]= f ( xk , uk )
global  segmentdata;    % L	ength 
			% Lambda number of lanes
			% fanout lanenumber changes[-1|0|1]
			% rampon rampon/off 	    [-1|0|1]
global  student_par;

global n=4  % nsegments
rho_s= zeros(n,1,"float") +  20.0;  % matlab idiomatic vector initialize
  v_s= zeros(n,1,"float") + 110.0;  % matlab idiomatic vector initialize
  w_s= zeros(n,1,"float") +   0.0;  % matlab idiomatic vector initialize

%segmentstates:  
rho= xk(    1:n: 3 * n);
v  = xk(    2:n: 3 * n);
w  = xk(    3:n: 3 * n);

%controls:
VSL= zeros(n,1,"float") + 120.0;
VSL(2)=  uk(1);
VSL(3)= VSL(2);

qr = zeros(n,1,"float") +   0.0;
r  = zeros(n,1,"float") +   0.0;
r(4) = uk(2);

%qr(4)=min(r(4) * Cr,Dr+w(4)/T, Cr*(rho_m-rho(4))/(rho_m-rho_c));
qr=min(r * Cr ,Dr+w/T, Cr*(rho_m-rho)/(rho_m-rho_c));

%wr1(4)= wr(4) + T*(Dr- qr(4));
wr1= wr + T*(Dr- qr);

%rho1 = f2 = xk(2)+T/(lambda*L)*(lambda*xk(1)*xk(5)-lambda*xk(2)*xk(6));

%segment run	
qi = zeros(n,1,"float") +   0.0;
qo = zeros(n,1,"float") +   0.0;

for i = 1:n
	if i = 1
		qi =q0;
	else 
	qi = T*v(i-1)* rho(i-1)
	end
	if seq <n
		qo = T* v(i) *rho(i)
	else
		qo = T* v(i) *rho(i)
	end
end
dq= qi - q  +  qr;

%or vectoring shift 
q = v * rho*L*labda/T ;
qmin = shift (q, 1);
qmin(1) = q0;
dq = qmin-q+qr;

rho1 = rho + T/(lambda*L) * (dq );
rhoplus = shift(rho, n -1);
rhoplus(4) = rho(4);

Vspt = min((1+alfa)*VSL, v_f*exp(-1/a*(rho/rho_c)^a))

%vmin = zeros(n,1,"float") +   v;
%shift segments
vmin = shift(v,1);
vmin(1) = v(1);

v1   =   v +T/tau* (Vspt-v))+T/L*v* (vmin -v)-mu*T/(tau*L)* (rhoplus-rho) /(rho +K) 

xk1 = 




