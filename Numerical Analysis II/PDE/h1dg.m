% Parameters
n = 50; % Number of spatial grid points
dx = 2*pi/n; % Spatial grid spacing
x = 0:dx:2*pi-dx; % Spatial grid points
alp2 = 1/16; % Given parameter alpha^2
h = 0.1; % Time step size
psteps = 11; % Number of time steps to plot
tmax = h * (psteps - 1); % Total simulation time

% Wave numbers
nv = fftshift(-n/2:1:n/2-1); % Wave numbers
mu = (1 - h * (1-alp2) * nv.^2) ./ (1 + alp2 * nv.^2 * h); % Fourier multiplier vector

% Initial condition
u0 = 2 * sin(x); % Initial condition in spatial domain
u = u0; % Current solution in spatial domain
uf = fft(u); % Fourier transform of the initial condition
t = 0:h:h*(psteps-1); % Time array
ua = zeros(psteps, n); % Array to store the solution for plotting
ua(1, :) = u0; % Store the initial condition

% Time integration loop
for i = 2:psteps % Integration loop
    uf = mu .* uf; % Update the Fourier coefficients
    u = ifft(uf); % Inverse Fourier transform to get the solution in spatial domain
    ua(i, :) = real(u); % Store the real part of the solution for plotting
end

% Plotting the solution
[X, T] = meshgrid(x, t); % Create a mesh grid for plotting
surf(X, T, ua); % Plot the solution
xlabel('x');
ylabel('t');
zlabel('u(x,t)');
title('Solution of the Parabolic PDE using Spectral Method');

