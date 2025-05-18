function c = fftn8(y)

N=length(y);

if N ~= 8

  error(" This function only accept data size 8");

endif

W=exp(-2*pi*1i/N);

c=zeros(N,1);

% first stage

Y0=y(1)+y(3); Y2=y(1)-y(3); Y4=y(5)+y(7); Y6=y(5)-y(7);

Y1=y(2)+y(4); Y3=y(2)-y(4); Y5=y(6)+y(8); Y7=y(6)-y(8);

% second stage

W2=W^2;

Z0=Y0+Y4; Z2=Y2+W2*Y6; Z4=Y4-W2*Y0; Z6=Y6-W2*Y2;

Z1=Y1+Y5; Z3=Y3+W2*Y7; Z5=Y5-W2*Y1; Z7=Y7-W2*Y3;

% third stage

W3=W*W2;

c(1)=Z0+Z1; c(2)=Z2+W3*Z3; c(3)=Z4+W3*Z5; c(4)=Z6+W3*Z7;

c(5)=Z0-Z1; c(6)=Z2-W3*Z3; c(7)=Z4-W3*Z5; c(8)=Z6-W3*Z7;

c=real(c);

endfunction
