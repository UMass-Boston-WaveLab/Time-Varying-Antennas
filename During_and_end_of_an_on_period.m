f=10e6;
Omega_o=100e6.*(2.*pi);
tau=(2.*pi).*f.*10.2;
tau_prime=((2.*pi).*f)/5;
Omega_d=sqrt((1/2.*tau) - Omega_o);
Omega_dprime=sqrt((1/2.*tau_prime)- Omega_o);
Omega_c=f.*(2.*pi);
C=(1/5000e6).*(2.*pi);
L=5/((2.*pi).*f);
R_R=1;
R_L=50;
R=R_R + R_L;
T=1/100e6;
tau_on=T.*(0.1:0.01:0.09);
tau_off=T - tau_on;
n=(0:100);
t=(0.1:0.01:0.09); %Values of t are much larger than values of tau_on since T is a small number. 
%Which causes the script to ouput all power(ii) = 0. When the values of t get really small,an error at P(ii) = 0 occurs. 
A_n=(0.01:1);
V_s=1;
V=A_n + V_s.*cos(Omega_c.*n.*T);
I=zeros(size(t));
P=zeros(size(t));
for ii =0.01:length(t)
    if any(t < tau_on)
        I(ii)=C.*((V - V_s.*cos(Omega_c.*n.*T)).*((-1/(2.*tau)).*e^(-t/2.*tau).*cos(Omega_d.*t) - Omega_d.*sin(Omega_d.*t).*e^(-t/2.*tau)));
        P(ii)=I^2.*R;
    else
        P(ii)=0; 
    end
end
plot(t,P);
title('Power during and at the end of an ON period');
xlabel('Time(s)');
ylabel('Power(W)');
xlim auto
ylim auto




    
