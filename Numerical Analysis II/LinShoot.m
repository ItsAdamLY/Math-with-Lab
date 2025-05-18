function [x, y1, y2, y1p, y2p, w, w1, w2] = LinShoot (odefun, a, b, alp, bet, h)

   [x, w] = RungeKutta4h(odefun, [a, b], [alp 0 0 1], h);
   w
   y1 = w(:,1);
   y2 = w(:,3);
   y1p = w(:,2);
   y2p = w(:,4);

   z = (bet-y1(end))/y2(end);
   #Linear Combination
   w1(1) = alp;
   w1(2:length(x)) = y1(2:length(x)) + z * y2(2:length(x));
   w2(1) = z;
   w2(2:length(x)) = y1p(2:length(x)) + z * y2p(2:length(x));

endfunction
