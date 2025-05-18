function retval = ShootingBVP (odefun, a, b, alp, bet, TK)

     [t,y] = ode45(odefun, tspan, [alp TK 0 1])


endfunction
