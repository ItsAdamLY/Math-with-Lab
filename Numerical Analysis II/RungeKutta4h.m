function [tt,uv] = RungeKutta4h(odefun,tspan,y0,h)

   Nh=(tspan(2)-tspan(1))/abs(h); hh=h*0.5;

   tt=linspace(tspan(1),tspan(2),Nh+1);

   if h<0
      tt=flip(tt);
   endif

   u=zeros(Nh+1,length(y0));

   u(1,:)=y0;

   for i=2:Nh+1

      y = u(i-1,:);

      k1 = h*odefun(tt(i-1),y);
      k2 = h*odefun(tt(i-1)+hh,y+hh*k1);
      k3 = h*odefun(tt(i-1)+hh,y+hh*k2);
      k4 = h*odefun(tt(i-1)+h,y+k3);

      u(i,:) = y+h*(k1+2*(k2+k3)+k4)/6;

   end

   uv = u;

   tt=tt';

end
