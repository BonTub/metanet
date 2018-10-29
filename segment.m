%SC42055 Assignment 2: Quadratic Programming
%Jorge Bonekamp: 4474554
%SC42055 Assignment 3: Nonlinear Programming
%Jorge Bonekamp: 4474554
%Dylan Kalisvaart: 4466748


function [rho_s, v_s]= segment( q_in,q_out, v_in, v_out ,rho )
global  segmentdata;    % L	ength 
			% Lambda number of lanes
			% fanout lanenumber changes[-1|0|1]
			% rampon rampon/off 	    [-1|0|1]
global  student_par;

rho_s = zeros(3,1,"float")
  v_s = zeros(3,1,"float")

#global  
rho0_s= zeros(3,1) +  20.0;  % matlab idiomatic vector initialize
  v0_s= zeros(3,1) + 110.0;  % matlab idiomatic vector initialize



 rho_s = rho+T/(lambda*L)*(7000+100*E1-lambda*xk(1)*xk(5)) 

if k < 12
	    f1 = xk(1)+T/(lambda*L)*(7000+100*E1-lambda*xk(1)*xk(5));
    elseif k >= 12
	        f1 = xk(1)+T/(lambda*L)*(2000+100*E2-lambda*xk(1)*xk(5));
	end
	f2 = xk(2)+T/(lambda*L)*(lambda*xk(1)*xk(5)-lambda*xk(2)*xk(6));
	f3 = xk(3)+T/(lambda*L)*(lambda*xk(2)*xk(6)-lambda*xk(3)*xk(7));
	f4 = xk(4)+T/(lambda*L)*(lambda*xk(3)*xk(7)-lambda*xk(4)*xk(8)+min([xk(11)*Cr,Dr+xk(9)/T, Cr*(rho_m-xk(4))/(rho_m-rho_c)]));
	f5 = xk(5)+T/tau*(min(Vdef*(1+alfa), v_f*exp(-1/a*(xk(1)/rho_c)^a))-xk(5))-mu*T/(tau*L)*(xk(2)-xk(1))/(xk(1)+K);
	f6 = xk(6)+T/tau*(min(xk(10)*(1+alfa), v_f*exp(-1/a*(xk(2)/rho_c)^a))-xk(6))+T/L*xk(6)*(xk(5)-xk(6))-mu*T/(tau*L)*(xk(3)-xk(2))/(xk(2)+K);
	f7 = xk(7)+T/tau*(min(xk(10)*(1+alfa), v_f*exp(-1/a*(xk(3)/rho_c)^a))-xk(7))+T/L*xk(7)*(xk(6)-xk(7))-mu*T/(tau*L)*(xk(4)-xk(3))/(xk(3)+K);
	f8 = xk(8)+T/tau*(min(Vdef*(1+alfa), v_f*exp(-1/a*(xk(4)/rho_c)^a))-xk(8))+T/L*xk(8)*(xk(7)-xk(8));
	f9 = xk(9)+T*(Dr-min([xk(11)*Cr,Dr+xk(9)/T, Cr*(rho_m-xk(4))/(rho_m-rho_c)]));
	f10 = xkplus(10);
	f11 = 1;

	f = [f1; f2; f3; f4; f5; f6; f7; f8; f9; f10; f11];
	ceqk = xkplus-f;


