function [M2,M5,M4] = funcionRungeKutta3(funcionMatematica,x,y,h,n)

f=str2func(['@(x,y)' funcionMatematica]);
%pedimos los limites al usuario y los capturamos
x=str2double(x);
y=str2double(y);
h=str2double(h);
n=str2double(n);
x0=x;
y0=y;
k1=0;
k2=0;
k3=0;
yii=0;
xi=0;

for i=1:n
    yiSiguiente= yii;
    if(i==1)
        k1= f(x0,y0);
        xk2= x0+(1/2)*h;
        yk2= y0+(1/2)*k1*h;
        k2=f(xk2, yk2);
        xk3= x0+h;
        yk3= y0-k1*h+2*k2*h;
        k3=f(xk3, yk3);
       
        %%yii= yi+1
        yii= y0+(h/6)*(k1+4*k2+k3);
        xi=x0;
     
        M2 = num2cell([i,k1,xk2,yk2,k2,xk3,yk3,k3,yii]);
        M5(i)=(xi);
        M4(i)=(yii);
    else
       
        xi=xi+h;
        yi= yiSiguiente;
     
        k1= f(xi,yi);
        xk2= xi+(1/2)*h;
        yk2= yi+(1/2)*k1*h;
        k2=f(xk2, yk2);
        xk3= xi+h;
        yk3= yi-k1*h+2*k2*h;
        k3=f(xk3, yk3);
       
        yii= yi+(h/6)*(k1+4*k2+k3);
        
        M3=num2cell([i,k1,xk2,yk2,k2,xk3,yk3,k3,yii]);
        M2 = [M2;M3];
        M5(i)=(xi);
        M4(i)=(yii);
    end
end
end
