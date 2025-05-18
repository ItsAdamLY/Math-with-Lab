function x = MVGNewtonGPT(F, x0, max_iter, tol)
    % MVGNewton: Solve nonlinear system of equations using MVGNewton method

    % Inputs:
    %   F: Function handle to the system of equations F(x) = 0
    %   J: Function handle to the Jacobian matrix of F(x)
    %   x0: Initial guess
    %   max_iter: Maximum number of iterations
    %   tol: Tolerance for convergence

    x = x0(:);
    n = length(x0);

    for iter = 1:max_iter
        % Evaluate the system of equations and its Jacobian at the current point
        f_x = F(x);

        xs = sym('x', [3 1]);
        J = function_handle(jacobian(F(xs)), 'Vars', sym('x',[n 1]))
        J_x = J(x);

        % Solve the linear system J(x) * d = -F(x) for the update direction d
        d = J_x \ (-f_x)

        % Update the current point
        x = x + d;

        % Check for convergence
        if norm(d) < tol
            disp(['Converged in ', num2str(iter), ' iterations.']);
            return;
        end
    end

    % Display a warning if the maximum number of iterations is reached
    disp('Maximum number of iterations reached.');
end

