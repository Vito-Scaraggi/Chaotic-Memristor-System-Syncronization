% 'The synchronization of identical Memristors systems via Lyapunov direct method'
% Class that implements static methods for applying Runge-Kutta method of the 4th order
% author: Vito Scaraggi

classdef Calc
    methods(Access = public, Static)
        
        %Code that calculates Runge-Kutta coefficients

        function k = kbuild(x1,y1,z1,w1,x2,y2,z2,w2)
            global coeff1 coeff2 index1 index2 i;
            k = zeros(8);

            k(1) = Calc.f1(x1,y1,w1);
            k(2) = Calc.f2(x1,z1);
            k(3) = Calc.f3(y1,z1);
            k(4) = Calc.f4(x1);

            if(i>=index2)
                k(1) = k(1) + coeff1*Calc.v1(x2,x1,y2,y1,w2,w1);
                k(2) = k(2) + coeff1*Calc.v2(x2,x1,y2,y1,z2,z1);
                k(3) = k(3) + coeff1*Calc.v3(y2,y1,z2,z1);
                k(4) = k(4) + coeff1*Calc.v4(x2,x1,w2,w1);
            end

            k(5) = Calc.f1(x2,y2,w2);
            k(6) = Calc.f2(x2,z2);
            k(7) = Calc.f3(y2,z2);
            k(8) = Calc.f4(x2);

            if(i>=index1)
                k(5) = k(5) + coeff2*Calc.v1(x1,x2,y1,y2,w1,w2);
                k(6) = k(6) + coeff2*Calc.v2(x1,x2,y1,y2,z1,z2);
                k(7) = k(7) + coeff2*Calc.v3(y1,y2,z1,z2);
                k(8) = k(8) + coeff2*Calc.v4(x1,x2,w1,w2);
            end
        end

        %Code that applies Runge-Kutta Fourth method

        function y = rungeKutta4(x,k1,k2,k3,k4)
            global time_step;
            y = x + time_step/6*(k1 + 2*k2 + 2*k3 + k4); 
        end

        %Equation 1 of the memristor chaotic system

        function k = f1(x,y,w)
            global aalpha;
            k = aalpha*(y - Calc.W(w)*x);
        end

        %Equation 2 of the memristor chaotic system

        function k = f2(x,z)
            k = z - x;
        end

        %Equation 3 of the memristor chaotic system

        function k = f3(y,z)
            global beta gamma;
            k = -beta*y + gamma*z;
        end

        %Equation 4 of the memristor chaotic system

        function k = f4(x)
            k = x;
        end

        %Auxiliary function W

        function k = W(w)
            global a b;
            global state;
            k = 0;
            if abs(w) < 1
                k = a;
            end
            if abs(w) > 1
                k = b;
            end
            if k == 0
                state.wException = true;
            end
        end

        %Control function 1

        function k = v1(x1,x2,y1,y2,w1,w2)
            global aalpha;
            k = -aalpha*(y2-y1) + aalpha*Calc.W(w2)*x2 - aalpha*Calc.W(w1)*x1 - x2 + x1;
        end

        %Control function 2

        function k = v2(x1,x2,y1,y2,z1,z2)
            k = z1 - z2 + x2 - x1 + y1 - y2;
        end

        %Control function 3

        function k = v3(y1,y2,z1,z2)
            global beta gamma;
            k = beta*(y2-y1) - (z2-z1)*(gamma+1);
        end

        %Control function 4

        function k = v4(x1,x2,w1,w2)
            k = x1 - x2 + w1 - w2;
        end
        
    end
end