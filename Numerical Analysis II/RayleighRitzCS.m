function retval = RayleighRitzCS (S,p,q,f,n)

     syms x;

     if n<1
        error("n should be >= 1")
        return
     endif

     h = 1/(n+1);
     xi(1:2) = 0;
     xi(3:n+4) = h*(0:n+1);
     xi(n+5:n+6) = 1;

     for i=1:n+1

        if i==1
          phi(x) = S(x/h)-4*S((x+h)/h);
        elseif i==2
          phi(x) = S((x-xi(i))/h)-S((x+h)/h);
        elseif i==n
          phi(x) = S((x-xi(n))/h)-S((x-(n+2)*h)/h);
        elseif i==n+1
          phi(x) = S((x-xi(n+1))/h)-4*S((x-(n+2)*h)/h);
        else
          phi(x) = S((x-xi(i))/h);
        endif

     endfor

     A = zeros(n+1,n+1);

     for i=1:n+1
        for j=i:min(i+3,n+1)
           L = max(x(j-2),0);
           U = min(x(i+2),1);

           phii_pr = diff(phi(i),x);
           phij_pr = diff(phi(j),x);
           A(i,j) = sym2poly(int(p(x)*phii_pr*phij_pr + ...
                         q(x)*phi(i)*phi(j)));

           if i!=j A(j,i) = A(i,j); endif
        endfor


     endfor

endfunction

function S = Spline(x)

     S = x;

     for i=1:length(x)-1

        if x(i)<=-2
           S(i) = 0;
        elseif x(i)>-2 || x(i)<=-1
           S(i) = (1/4)*(2+x)^3;
        elseif x(i)>-1 || x(i)<=0
           S(i) = (1/4)*(2+x)^3-4(1+x)^3;
        elseif x(i)>0 || x(i) <= 1
           S(i) = (1/4)*(2-x)^3-4(1-x)^3;
        elseif x(i)>1 || x(i) <= 2
           S(i) = (1/4)*(2-x)^3;
        else
           S(i) = 0;
        endif

     endfor

endfunction
