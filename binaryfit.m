function C1= binaryfit(u,epsilon) 


H =0.5*(1+(2/pi)*atan(u./epsilon)); %compute the Heaveside function values 
a= H.*u;
numer_1=sum(a(:)); 
denom_1=sum(H(:));
C1 = numer_1/denom_1;
% 
% b=(1-H).*u;
% numer_2=sum(b(:));
% c=1-H;
% denom_2=sum(c(:));
% C2 = numer_2/denom_2;
