% 'The synchronization of identical Memristors systems via Lyapunov direct method'
% Class that implements useful auxiliary methods
% author: Vito Scaraggi

classdef Util
    methods(Access = public, Static)
        
        %Function that evaluates program state

        function b = cond(app, mode)
            global state; 
            b = true;
            b = b && (state.coeff1 == app.coeff1EditField_2.Value);
            b = b && (state.coeff2 == app.coeff2EditField.Value);
            b = b && (state.time_step == app.TimestepEditField_2.Value);
            b = b && (state.step_number == app.StepnumberSpinner.Value);
            b = b && (state.time_diff == app.TimedifferenceSpinner.Value);
            b = b && (state.xo1 == app.x1EditField.Value);
            b = b && (state.yo1 == app.y1EditField.Value);
            b = b && (state.zo1 == app.z1EditField.Value);
            b = b && (state.wo1 == app.w1EditField.Value);
            b = b && (state.xo2 == app.x2EditField.Value);
            b = b && (state.yo2 == app.y2EditField.Value);
            b = b && (state.zo2 == app.z2EditField.Value);
            b = b && (state.wo2 == app.w2EditField.Value);
            b= b && ~state.null;
            if(mode == 0) 
                b = b && strcmp(state.gtype,app.GraphicsDropDown_2.Value);
            end
        end

        %Code that sets animation speed

        function s = step(step_number)
        s = max(1,step_number/33);
        end
        
    end
end