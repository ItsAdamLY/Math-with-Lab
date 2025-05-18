function [tt,uv] = RungeKutta4(odefun,tspan,y0,Nh)

   tt=linspace(tspan(1),tspan(2),Nh+1);

   h=(tspan(2)-tspan(1))/Nh; hh=h*0.5;

   if h<0
      tt=flip(tt);
   endif

   u=zeros(length(y0),Nh+1);

   u(:,1)=y0(:);

   for i=2:Nh+1

      y = u(:,i-1);
      k1 = odefun(tt(i-1),y);
      k2 = odefun(tt(i-1)+h/2,y+hh*k1);
      k3 = odefun(tt(i-1)+h/2,y+hh*k2);
      k4 = odefun(tt(i-1)+h,y+h*k3);
      u(:,i) = y+h*(k1+2*(k2+k3)+k4)/6;

   end

   uv = u.';

   tt=tt';

end
