f=10e6;
Omega_o=100e6.*(2.*pi);
tau=(0.098)/((2.*pi).*f);
tau_prime=5/((2.*pi).*f);
Omega_d=sqrt((1/2.*tau).^2 - (Omega_o).^2);
Omega_dprime=sqrt((1/2.*tau_prime).^2- (Omega_o).^2);
Omega_c=f.*(2.*pi);
C=(1/5000e6).*(2.*pi);
L=5/((2.*pi).*f);
R_R=1;
R_L=50;
R=R_R + R_L;
T=1/100e6;
tau_on=T.*(0.5);
tau_off=T - tau_on;
n=(0:100);
t=(0:T/1000:T);
p=exp(-((tau_on/(2.*tau)) + (tau_off/(2.*tau_prime)))).*cos(Omega_d.*tau_on).*cos(Omega_dprime.*tau_off);
V_o=1;
V_s=1;
W=zeros(size(n));
V=zeros(size(n));
I=zeros(size(t));
P=zeros(size(t));
for jj = 1:length(n)
    for ii =1:length(t)
            W(jj) = ((p.^(-1).*exp(1i.*(Omega_c.*T)) - p.^(-n(jj)).*exp(1i.*(Omega_c.*n(jj).*T)))/(1-p.^(-1).*exp(1i.*(Omega_c.*T)))) + ((p.^(-1).*exp(-1i.*(Omega_c.*T)) - p.^(-n(jj)).*exp(-1i.*(Omega_c.*n(jj).*T)))/(1-p.^(-1).*exp(-1i.*(Omega_c.*T))));
            V(jj)= p.^(n(jj)).*V_o + (p.^(n(jj))- p.^(n(jj)+1)).*(V_s/2).*(W(jj));
        if any(t < tau_on)
            I(ii,jj)=C.*((V(jj) - V_s.*cos(Omega_c.*n(jj).*T)).*((-1/(2.*tau)).*e^(-t(ii)/2.*tau).*cos(Omega_d.*t(ii)) - Omega_d.*sin(Omega_d.*t).*e^(-t(ii)/2.*tau)));
            P(ii,jj)=I(ii,jj)^2.*R_L;
        else
        P(ii,jj)=0; 
        end
    end
end
plot(t,P);
title('Power during and at the end of an ON period');
xlabel('Time(s)');
ylabel('Power(W)');
xlim auto
ylim auto




    
