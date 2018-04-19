f = 10e6;
omega_o = 100e6.*(2.*pi);
Omega_d = 100e6.*(2.*pi);
Omega_dprime = 100e6.*(2.*pi);
tau = (2.*pi).*f.*10.2;
tau_prime = ((2.*pi).*f)/5;
Omega_c = f.*(2.*pi);
C = (1/5000e7).*(2.*pi);
L = 5/((2.*pi).*f);
R_R = 1;
R_L = 50;
R = R_R + R_L;
T = 1/100e7;
tau_on = T.*(0.1:0.01:0.09);
tau_off = T - tau_on;
n = (0:100);
t = (0:100);
A_n = (0:100);
V_s = 1;
V = A_n + V_s.*cos(Omega_c.*n.*T);
I=zeros(size(t));
P=zeros(size(t));
for ii = 0:length(t)
    if any(t < tau_on)
        I(ii) = C.*((V - V_s.*cos(Omega_c.*n.*T)).*((-1/(2.*tau)).*e^(-t/2.*tau).*cos(Omega_d.*t) - Omega_d.*sin(Omega_d.*t).*e^(-t/2.*tau)));
        P(ii) = I^2.*R;
    else
        P(ii) = 0; 
    end
end
plot(t,P)




    