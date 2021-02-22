% author: Vito Scaraggi
classdef Event 
    methods(Access = public, Static)
        
        % Value changed function: ModeDropDown_2
        
        function ModeDropDown_2ValueChanged(app, event)
            value = app.ModeDropDown_2.Value;
            switch value
                case 'No sync'
                    app.MasterLabel_2.Visible = 'off';
                    app.DropDown.Visible = 'off';
                    app.coeff1EditField_2.Editable = false;
                    app.coeff1EditField_2.Value = 0;
                    app.coeff2EditField.Editable = false;
                    app.coeff2EditField.Value = 0;
                case 'Master-slave sync'
                    app.MasterLabel_2.Visible = 'on';
                    app.DropDown.Visible = 'on';
                    value2 = app.DropDown.Value;
                    switch value2
                        case 'System 1'
                            app.coeff1EditField_2.Editable = true;
                            app.coeff1EditField_2.Value = 1;
                            app.coeff2EditField.Editable = false;
                            app.coeff2EditField.Value = 0;
                        case 'System 2'
                            app.coeff2EditField.Editable = true;
                            app.coeff2EditField.Value = 1;
                            app.coeff1EditField_2.Editable = false;
                            app.coeff1EditField_2.Value = 0;
                    end
                case 'Active sync'
                    app.MasterLabel_2.Visible = 'off';
                    app.DropDown.Visible = 'off';
                    app.coeff1EditField_2.Editable = true;
                    app.coeff2EditField.Editable = true;
                    app.coeff1EditField_2.Value = 0.13;
                    app.coeff2EditField.Value = 0.13;
            end
        end

        % Selection changed function: ButtonGroup_2
        
        function MasterSelectionChanged(app, event)
            value = app.DropDown.Value;
            switch value
                case 'System 1'
                    app.coeff1EditField_2.Editable = true;
                    app.coeff1EditField_2.Value = 1;
                    app.coeff2EditField.Editable = false;
                    app.coeff2EditField.Value = 0;
                case 'System 2'
                    app.coeff2EditField.Editable = true;
                    app.coeff2EditField.Value = 1;
                    app.coeff1EditField_2.Editable = false;
                    app.coeff1EditField_2.Value = 0;
            end
        end

        % Button pushed function: RANDOMButton
        
        function RANDOMButtonPushed(app, event)
            app.x1EditField.Value = round(-1 + 2*rand,3);
            app.y1EditField.Value = round(-1 + 2*rand,3);
            app.z1EditField.Value = round(-1 + 2*rand,3);
            app.w1EditField.Value = round(-1 + 2*rand,3);
            app.x2EditField.Value = round(-1 + 2*rand,3);
            app.y2EditField.Value = round(-1 + 2*rand,3);
            app.z2EditField.Value = round(-1 + 2*rand,3);
            app.w2EditField.Value = round(-1 + 2*rand,3);
        end
        
        % Button pushed function: SUBMITButton
        
        function CLEARButtonPushed(app, event)
            global g q state;
            delete([g q]);
            state.null = true;
        end
        
        % Button pushed function: SUBMITButton
        
        function CLEARANIMATIONButtonPushed(app, event)
            global a1 a2 a3 a4 q;
            delete([a1 a2 a3 a4 q]);
        end
        
        % Button pushed function: SUBMITButton
        
        function STARTANIMATIONButtonPushed(app, event)
            app.STARTANIMATIONButton.Enable = 'off';
            app.CLEARButton.Enable = 'off';
            app.SUBMITButton.Enable = 'off';
            app.CLEARANIMATIONButton.Enable = 'off';
            
            global x1 y1 z1 w1 x2 y2 z2 w2;
            global a1 a2 a3 a4 q;
            global ax1 ax2;
            global step_number;
            global index1 index2;
            flag = Util.cond(app,0);
            
            if(strcmp(app.GraphicsDropDown_2.Value,'3D plots') && flag)
                
                delete([a1 a2 a3 a4 q]);
                q = uigridlayout(app.GridLayout);
                q.ColumnWidth = {'0.33x','0.33x', '1x', '0.33x', '1x', '0.33x', '1x', '0.33x', '1x', '0.33x', '1x', '0.33x','1x'};
                q.RowHeight = {'1x','1x', '1x', '1x'};
                q.Layout.Row = 2; 
                q.Layout.Column = 2;
                q.Padding = [4 4 4 4];
                q.ColumnSpacing = 2.5;
                q.RowSpacing = 5;
                q.BackgroundColor = [0.149 0.149 0.149];
                
                label_1_1 = uilabel(q);
                label_1_1.Layout.Row = 2; 
                label_1_1.Layout.Column = 2;
                label_1_1.Interpreter = 'latex';
                label_1_1.FontColor = [0.9 0.9 0.9];
                label_1_1.HorizontalAlignment = 'center';
                label_1_1.Text = '$x_1$';
                field_1_1 = uieditfield(q, 'numeric','editable','off');
                field_1_1.Layout.Row = 2; 
                field_1_1.Layout.Column = 3;
                
                new = app.UIFigure.Position;
                old = [0.25 0.204 0.5 0.593];
                oldFontSize = label_1_1.FontSize;
                coeff = (new(3)/old(3)+new(4)/old(4))/2;
                newFontSize = coeff * oldFontSize;
                label_1_1.FontSize = newFontSize;
                field_1_1.FontSize = newFontSize;
                
                label_1_2 = uilabel(q);
                label_1_2.Layout.Row = 2; 
                label_1_2.Layout.Column = 4;
                label_1_2.Interpreter = 'latex';
                label_1_2.FontColor = [0.9 0.9 0.9];
                label_1_2.HorizontalAlignment = 'center';
                label_1_2.Text = '$y_1$';
                label_1_2.FontSize = newFontSize;
                field_1_2 = uieditfield(q, 'numeric','editable','off');
                field_1_2.Layout.Row = 2; 
                field_1_2.Layout.Column = 5;
                field_1_2.FontSize = newFontSize;
                
                label_1_3 = uilabel(q);
                label_1_3.Layout.Row = 2; 
                label_1_3.Layout.Column = 6;
                label_1_3.Interpreter = 'latex';
                label_1_3.FontColor = [0.9 0.9 0.9];
                label_1_3.HorizontalAlignment = 'center';
                label_1_3.Text = '$z_1$';
                label_1_3.FontSize = newFontSize;
                field_1_3 = uieditfield(q, 'numeric','editable','off');
                field_1_3.Layout.Row = 2; 
                field_1_3.Layout.Column = 7;
                field_1_3.FontSize = newFontSize;
                
                label_1_4 = uilabel(q);
                label_1_4.Layout.Row = 2; 
                label_1_4.Layout.Column = 8;
                label_1_4.Interpreter = 'latex';
                label_1_4.FontColor = [0.9 0.9 0.9];
                label_1_4.HorizontalAlignment = 'center';
                label_1_4.Text = '$w_1$';
                label_1_4.FontSize = newFontSize;
                field_1_4 = uieditfield(q, 'numeric','editable','off');
                field_1_4.Layout.Row = 2; 
                field_1_4.Layout.Column = 9;
                field_1_4.FontSize = newFontSize;
                
                label_1_5 = uilabel(q);
                label_1_5.Layout.Row = 2; 
                label_1_5.Layout.Column = 10;
                label_1_5.Interpreter = 'latex';
                label_1_5.FontColor = [0.9 0.9 0.9];
                label_1_5.HorizontalAlignment = 'center';
                label_1_5.Text = '$n$';
                label_1_5.FontSize = newFontSize;
                field_1_5 = uieditfield(q, 'numeric','editable','off');
                field_1_5.Layout.Row = 2; 
                field_1_5.Layout.Column = 11;
                field_1_5.FontSize = newFontSize;
                
                label_2_1 = uilabel(q);
                label_2_1.Layout.Row = 3; 
                label_2_1.Layout.Column = 2;
                label_2_1.Interpreter = 'latex';
                label_2_1.FontColor = [0.9 0.9 0.9];
                label_2_1.HorizontalAlignment = 'center';
                label_2_1.Text = '$x_2$';
                label_2_1.FontSize = newFontSize;
                field_2_1 = uieditfield(q, 'numeric','editable','off');
                field_2_1.Layout.Row = 3; 
                field_2_1.Layout.Column = 3;
                field_2_1.FontSize = newFontSize;
                
                label_2_2 = uilabel(q);
                label_2_2.Layout.Row = 3; 
                label_2_2.Layout.Column = 4;
                label_2_2.Interpreter = 'latex';
                label_2_2.FontColor = [0.9 0.9 0.9];
                label_2_2.HorizontalAlignment = 'center';
                label_2_2.Text = '$y_2$';
                label_2_2.FontSize = newFontSize;
                field_2_2 = uieditfield(q, 'numeric','editable','off');
                field_2_2.Layout.Row = 3; 
                field_2_2.Layout.Column = 5;
                field_2_2.FontSize = newFontSize;
                
                label_2_3 = uilabel(q);
                label_2_3.Layout.Row = 3; 
                label_2_3.Layout.Column = 6;
                label_2_3.Interpreter = 'latex';
                label_2_3.FontColor = [0.9 0.9 0.9];
                label_2_3.HorizontalAlignment = 'center';
                label_2_3.Text = '$z_1$';
                label_2_3.FontSize = newFontSize;
                field_2_3 = uieditfield(q, 'numeric','editable','off');
                field_2_3.Layout.Row = 3; 
                field_2_3.Layout.Column = 7;
                field_2_3.FontSize = newFontSize;
                
                label_2_4 = uilabel(q);
                label_2_4.Layout.Row = 3; 
                label_2_4.Layout.Column = 8;
                label_2_4.Interpreter = 'latex';
                label_2_4.FontColor = [0.9 0.9 0.9];
                label_2_4.HorizontalAlignment = 'center';
                label_2_4.Text = '$w_1$';
                label_2_4.FontSize = newFontSize;
                field_2_4 = uieditfield(q, 'numeric','editable','off');
                field_2_4.Layout.Row = 3; 
                field_2_4.Layout.Column = 9;
                field_2_4.FontSize = newFontSize;
                
                j = 1;
                k = 1;
                j1 = index1;
                j2 = index2;
                
                for i=floor(1:Util.step(step_number):step_number+1)
                    
                    if(j >= index1)
                        a1(k) = plot3(ax1,x1(j1:i),y1(j1:i),z1(j1:i),'color','#ff751a','lineWidth',1.1,'HandleVisibility','off');
                        m1 = plot3(ax1,x1(i),y1(i),z1(i),'marker','o','markerSize',9,'markerEdgeColor','#fff','MarkerFaceColor','#ff751a','HandleVisibility','off');
                    end
                    
                    if(j >= index2)
                        a2(k) = plot3(ax1,x2(j2:i),y2(j2:i),z2(j2:i),'color','#9966ff','lineWidth',1.1,'HandleVisibility','off');
                        m2 = plot3(ax1,x2(i),y2(i),z2(i),'marker','o','markerSize',9,'markerEdgeColor','#fff','MarkerFaceColor','#9966ff','HandleVisibility','off');
                    end
                    
                    field_1_1.Value = x1(i);
                    field_1_2.Value = y1(i);
                    field_1_3.Value = z1(i);
                    field_1_4.Value = w1(i);
                    field_1_5.Value = i;
                    field_2_1.Value = x2(i);
                    field_2_2.Value = y2(i);
                    field_2_3.Value = z2(i);
                    field_2_4.Value = w2(i);
                    
                    drawnow;
                    pause(0.05);
                    
                    if(j >= index1)
                        delete(m1);
                        j1 = i;
                    end
                    if(j >= index2)
                        delete(m2);
                        j2 = i;
                    end
                    k = k + 1;
                    j = i;
                end
                
                pause(1);
                k = 1;
                j = 1;
                j1 = index1;
                j2 = index2;
                
                for i=floor(1:Util.step(step_number):step_number+1)
                    
                    if(j >= index1)  
                        a3(k) = plot3(ax2,x1(j1:i),y1(j1:i),w1(j1:i),'color','#ff751a','lineWidth',1.1,'HandleVisibility','off');
                        m1 = plot3(ax2,x1(i),y1(i),w1(i),'marker','o','markerSize',9,'markerEdgeColor','#fff','MarkerFaceColor','#ff751a','HandleVisibility','off');
                    end
                    if(j >= index2)
                         a4(k) = plot3(ax2,x2(j2:i),y2(j2:i),w2(j2:i),'color','#9966ff','lineWidth',1.1,'HandleVisibility','off');
                         m2 = plot3(ax2,x2(i),y2(i),w2(i),'marker','o','markerSize',9,'markerEdgeColor','#fff','MarkerFaceColor','#9966ff','HandleVisibility','off');
                    end
                    
                    field_1_1.Value = x1(i);
                    field_1_2.Value = y1(i);
                    field_1_3.Value = z1(i);
                    field_1_4.Value = w1(i);
                    field_1_5.Value = i;
                    field_2_1.Value = x2(i);
                    field_2_2.Value = y2(i);
                    field_2_3.Value = z2(i);
                    field_2_4.Value = w2(i);
                    
                    drawnow;
                    
                    pause(0.05);
                    
                    if(j >= index1)
                        delete(m1);
                        j1 = i;
                    end
                    if(j >= index2)
                        delete(m2);
                        j2 = i;
                    end
                    j = i;
                    k = k + 1;
                end
            else
                delete(q);
                q = uigridlayout(app.GridLayout);
                q.ColumnWidth = {'1x'};
                q.RowHeight = {'1x'};
                q.Layout.Row = 2; 
                q.Layout.Column = 2;
                q.Padding = [4 4 4 4];
                q.ColumnSpacing = 1;
                q.RowSpacing = 1;
                q.BackgroundColor = [0.149 0.149 0.149];
                
                if flag
                    l = uilabel(q,'FontColor','#ff3333','Text',' >>> ERROR : Unavailable animation. Select 3D plots','VerticalAlignment','center');
                else
                    l = uilabel(q,'FontColor','#ff3333','Text',' >>> ERROR : State of the program has been changed. Press SUBMIT button first','VerticalAlignment','center');
                end
                
                new = app.UIFigure.Position;
                old = [0.25 0.204 0.5 0.593];
                oldFontSize = l.FontSize;
                coeff = (new(3)/old(3)+new(4)/old(4))/2;
                newFontSize = coeff * oldFontSize;
                l.FontSize = newFontSize;
            end
            
            app.STARTANIMATIONButton.Enable = 'on';
            app.CLEARButton.Enable = 'on';
            app.SUBMITButton.Enable = 'on';
            app.CLEARANIMATIONButton.Enable = 'on';
            
        end
        
        % Button pushed function: SUBMITButton
        
        function SUBMITButtonPushed(app, event)
            
            app.STARTANIMATIONButton.Enable = 'off';
            app.CLEARButton.Enable = 'off';
            app.SUBMITButton.Enable = 'off';
            app.CLEARANIMATIONButton.Enable = 'off';
            
            global g q;
            delete(q);
            global coeff1 coeff2 time_step step_number time_diff gtype null;
            global state;
            global xo1 yo1 zo1 wo1 xo2 yo2 zo2 wo2;
            
            coeff1 = app.coeff1EditField_2.Value;
            coeff2 = app.coeff2EditField.Value;
            time_step = app.TimestepEditField_2.Value;
            step_number = app.StepnumberSpinner.Value;
            time_diff = app.TimedifferenceSpinner.Value;
            gtype = app.GraphicsDropDown_2.Value;
            xo1 = app.x1EditField.Value;
            yo1 = app.y1EditField.Value;
            zo1 = app.z1EditField.Value;
            wo1 = app.w1EditField.Value;
            xo2 = app.x2EditField.Value;
            yo2 = app.y2EditField.Value;
            zo2 = app.z2EditField.Value;
            wo2 = app.w2EditField.Value;
            
            global x1 y1 z1 w1 x2 y2 z2 w2 t;
            global xp yp zp wp;
            global index1 index2 i;
            
            if abs(time_diff) > step_number
                null = true;
                delete(g);
                g = uigridlayout(app.GridLayout);
                g.ColumnWidth = {'1x'};
                g.RowHeight = {'1x'};
                g.Layout.Row = 1;
                g.Layout.Column = 2;
                g.Padding = [4 4 4 4];
                g.ColumnSpacing = 1;
                g.RowSpacing = 1;
                g.BackgroundColor = [0.149 0.149 0.149];
                l = uilabel(g,'FontColor','#ff3333','Text',' >>> ERROR : time_difference is greater than step_number','VerticalAlignment','top');
                new = app.UIFigure.Position;
                old = [0.25 0.204 0.5 0.593];
                oldFontSize = l.FontSize;
                coeff = (new(3)/old(3)+new(4)/old(4))/2;
                newFontSize = coeff * oldFontSize;
                l.FontSize = newFontSize;
            else
                null = false;
                
                if ~Util.cond(app,1)    
                    x1 = zeros(1,step_number);
                    y1 = zeros(1,step_number);
                    z1 = zeros(1,step_number);
                    w1 = zeros(1,step_number);

                    x2 = zeros(1,step_number);
                    y2 = zeros(1,step_number);
                    z2 = zeros(1,step_number);
                    w2 = zeros(1,step_number);

                    xp = zeros(1,step_number);
                    yp = zeros(1,step_number);
                    zp = zeros(1,step_number);
                    wp = zeros(1,step_number);

                    t = zeros(1,step_number);

                    if time_diff >= 0
                        index1 = 1+time_diff;
                        index2 = 1;
                    else
                        index1 = 1;
                        index2 = 1-time_diff;
                    end

                    x1(index1) = app.x1EditField.Value;
                    x2(index2) = app.x2EditField.Value;
                    y1(index1) = app.y1EditField.Value;
                    y2(index2) = app.y2EditField.Value;
                    z1(index1) = app.z1EditField.Value;
                    z2(index2) = app.z2EditField.Value;
                    w1(index1) = app.w1EditField.Value;
                    w2(index2) = app.w2EditField.Value;

                    xp(1) = x2(1) - x1(1);
                    yp(1) = y2(1) - y1(1);
                    zp(1) = z2(1) - z1(1);
                    wp(1) = w2(1) - w1(1);
                    t(1) = 0;

                    for i=1:step_number

                        k1 = Calc.kbuild(x1(i),y1(i),...
                                    z1(i),w1(i),...
                                    x2(i),y2(i),...
                                    z2(i),w2(i));

                        k2 = Calc.kbuild(x1(i)+time_step*k1(1)/2,y1(i)+time_step*k1(2)/2,...
                                    z1(i)+time_step*k1(3)/2,w1(i)+time_step*k1(4)/2,...
                                    x2(i)+time_step*k1(5)/2,y2(i)+time_step*k1(6)/2,...
                                    z2(i)+time_step*k1(7)/2,w2(i)+time_step*k1(8)/2);

                        k3 = Calc.kbuild(x1(i)+time_step*k2(1)/2,y1(i)+time_step*k2(2)/2,...
                                    z1(i)+time_step*k2(3)/2,w1(i)+time_step*k2(4)/2,...
                                    x2(i)+time_step*k2(5)/2,y2(i)+time_step*k2(6)/2,...
                                    z2(i)+time_step*k2(7)/2,w2(i)+time_step*k2(8)/2);

                        k4 = Calc.kbuild(x1(i)+time_step*k3(1),y1(i)+time_step*k3(2),...
                                    z1(i)+time_step*k3(3),w1(i)+time_step*k3(4),...
                                    x2(i)+time_step*k3(5),y2(i)+time_step*k3(6),...
                                    z2(i)+time_step*k3(7),w2(i)+time_step*k3(8));

                        if(i>=index1) 
                            x1(i+1) = Calc.rungeKutta4(x1(i),k1(1),k2(1),k3(1),k4(1));
                            y1(i+1) = Calc.rungeKutta4(y1(i),k1(2),k2(2),k3(2),k4(2));
                            z1(i+1) = Calc.rungeKutta4(z1(i),k1(3),k2(3),k3(3),k4(3));
                            w1(i+1) = Calc.rungeKutta4(w1(i),k1(4),k2(4),k3(4),k4(4));
                        end

                        if(i>=index2)
                            x2(i+1) = Calc.rungeKutta4(x2(i),k1(5),k2(5),k3(5),k4(5));
                            y2(i+1) = Calc.rungeKutta4(y2(i),k1(6),k2(6),k3(6),k4(6));
                            z2(i+1) = Calc.rungeKutta4(z2(i),k1(7),k2(7),k3(7),k4(7));
                            w2(i+1) = Calc.rungeKutta4(w2(i),k1(8),k2(8),k3(8),k4(8));
                        end

                        xp(i+1) = x2(i+1) - x1(i+1);
                        yp(i+1) = y2(i+1) - y1(i+1);
                        zp(i+1) = z2(i+1) - z1(i+1);
                        wp(i+1) = w2(i+1) - w1(i+1);

                        t(i+1) = t(i) +time_step;
                    end
                end
                
                type = app.GraphicsDropDown_2.Value;

                switch type
                    case '2D plots (1)'
                        Graphics.plots2D1(app,x1,x2,y1,y2,z1,z2,w1,w2,t,index1,index2);
                    case '2D plots (2)'
                        Graphics.plots2D2(app,x1,x2,y1,y2,z1,z2,w1,w2);
                    case '3D plots'
                        Graphics.plots3D(app,x1,x2,y1,y2,z1,z2,w1,w2,index1,index2);
                    case 'Error state plots'
                        Graphics.errorPlots(app,xp,yp,zp,wp,t);
                end
                new = app.UIFigure.Position;
                old = [0.25 0.204 0.5 0.593];
                h = findobj(g, '-property', 'FontSize');
                hFontSize = cell2mat(get(h,'FontSize'));
                coeff = (new(3)/old(3)+new(4)/old(4))/2;
                newFontSize = coeff * hFontSize;
                set(h,{'FontSize'}, num2cell(newFontSize));
            
            end
            state.coeff1 = coeff1;
            state.coeff2 = coeff2;
            state.time_step = time_step;
            state.step_number = step_number;
            state.time_diff = time_diff;
            state.xo1 = xo1;
            state.yo1 = yo1;
            state.zo1 = zo1;
            state.wo1 = wo1;
            state.xo2 = xo2;
            state.yo2 = yo2;
            state.zo2 = zo2;
            state.wo2 = wo2;
            state.gtype = gtype;
            state.null = null;
            
            app.STARTANIMATIONButton.Enable = 'on';
            app.CLEARButton.Enable = 'on';
            app.SUBMITButton.Enable = 'on';
            app.CLEARANIMATIONButton.Enable = 'on';
        end

        % Size changed function: UIFigure
        
        function UIFigureSizeChanged(app, event)
            new = app.UIFigure.Position;
            global old;
            h = findobj(app.UIFigure, '-property', 'FontSize');
            hFontSize = cell2mat(get(h,'FontSize'));
            coeff = (new(3)/old(3)+new(4)/old(4))/2;
            newFontSize = coeff * hFontSize;
            set(h,{'FontSize'}, num2cell(newFontSize));
            old = new;
        end
        
    end
end