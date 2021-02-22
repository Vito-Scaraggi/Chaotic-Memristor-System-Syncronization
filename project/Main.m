% 'The synchronization of identical Memristors systems via Lyapunov direct method'
% author: Vito Scaraggi

classdef Main < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                    matlab.ui.Figure
        GridLayout                  matlab.ui.container.GridLayout
        TabGroup                    matlab.ui.container.TabGroup
        SettingsTab                 matlab.ui.container.Tab
        GridLayout2                 matlab.ui.container.GridLayout
        ModeLabel                   matlab.ui.control.Label
        ModeDropDown_2              matlab.ui.control.DropDown
        MasterLabel_2               matlab.ui.control.Label
        coeff1EditField_2           matlab.ui.control.NumericEditField
        coeff1EditField_2Label      matlab.ui.control.Label
        coeff2EditField             matlab.ui.control.NumericEditField
        coeff2EditFieldLabel        matlab.ui.control.Label
        GraphicsDropDown_2          matlab.ui.control.DropDown
        GraphicsDropDown_2Label     matlab.ui.control.Label
        ParametersTab               matlab.ui.container.Tab
        GridLayout4                 matlab.ui.container.GridLayout
        TimestepEditField_2         matlab.ui.control.NumericEditField
        TimestepEditField_2Label    matlab.ui.control.Label
        StepnumberSpinner           matlab.ui.control.Spinner
        StepnumberSpinnerLabel      matlab.ui.control.Label
        TimedifferenceSpinner       matlab.ui.control.Spinner
        TimedifferenceSpinnerLabel  matlab.ui.control.Label
        InitialconditionsLabel      matlab.ui.control.Label
        System1Label                matlab.ui.control.Label
        System2Label_2              matlab.ui.control.Label
        x1EditField                 matlab.ui.control.NumericEditField
        x1EditField_2Label          matlab.ui.control.Label
        x2EditField                 matlab.ui.control.NumericEditField
        x2EditFieldLabel            matlab.ui.control.Label
        y1EditField                 matlab.ui.control.NumericEditField
        y1EditFieldLabel            matlab.ui.control.Label
        y2EditField                 matlab.ui.control.NumericEditField
        y2EditFieldLabel            matlab.ui.control.Label
        z1EditField                 matlab.ui.control.NumericEditField
        z1EditFieldLabel            matlab.ui.control.Label
        z2EditField                 matlab.ui.control.NumericEditField
        z2EditFieldLabel            matlab.ui.control.Label
        w1EditField                 matlab.ui.control.NumericEditField
        w1EditFieldLabel            matlab.ui.control.Label
        w2EditField                 matlab.ui.control.NumericEditField
        w2EditFieldLabel            matlab.ui.control.Label
        RANDOMButton                matlab.ui.control.Button
        GridLayout3                 matlab.ui.container.GridLayout
        SUBMITButton                matlab.ui.control.Button
        STARTANIMATIONButton        matlab.ui.control.Button
        CLEARButton                 matlab.ui.control.Button
        CLEARANIMATIONButton        matlab.ui.control.Button
        DropDown                    matlab.ui.control.DropDown
        Panel                       matlab.ui.container.Panel
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)
            
            set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
            set(groot, 'defaultLegendInterpreter','latex');
            set(0,'defaultTextInterpreter','latex');
            set(0,'defaultAxesFontSize',16);
            %set(groot,'defaultTextFontSize',20);
            
            global a1 a2 a3 a4 g q;
            a1 = gobjects(1);
            a2 = gobjects(1);
            a3 = gobjects(1);
            a4 = gobjects(1);
            g = gobjects(1);
            q = gobjects(1);
            
            global aalpha beta gamma a b;
            aalpha = 4;
            beta = 1;
            gamma = 0.65;
            a = 0.2;
            b = 10;
            global old;
            old = [0.25 0.204 0.5 0.593];
            global state;
            global xo1 yo1 zo1 wo1 xo2 yo2 zo2 wo2;
            global coeff1 coeff2 time_step step_number time_diff gtype null;
            
            coeff1 = 0;
            coeff2 = 0;
            time_step = 0.01;
            step_number = 1000;
            time_diff = 0;
            gtype = '2D plots (1)';
            null = true;
            xo1 = 0;
            yo1 = 0;
            zo1 = 0;
            wo1 = 0;

            xo2 = 0;
            yo2 = 0;
            zo2 = 0;
            wo2 = 0;
            
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
            
            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Color = [0.9 0.9 0.9];
            app.UIFigure.Units = 'normalized';
            app.UIFigure.Position = [0.25 0.204 0.5 0.593];
            app.UIFigure.Name = 'The synchronization of identical Memristors systems via Lyapunov direct method';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @Event.UIFigureSizeChanged, true);
            app.UIFigure.HandleVisibility = 'on';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'0.5x', '1x'};
            app.GridLayout.RowHeight = {'5x', '1x'};
            app.GridLayout.ColumnSpacing = 0.5;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0.5 0.5 0.5 0.5];
            app.GridLayout.BackgroundColor = [0.149 0.149 0.149];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.GridLayout);
            app.TabGroup.AutoResizeChildren = 'off';
            app.TabGroup.Layout.Row = 1;
            app.TabGroup.Layout.Column = 1;

            % Create SettingsTab
            app.SettingsTab = uitab(app.TabGroup);
            app.SettingsTab.AutoResizeChildren = 'off';
            app.SettingsTab.Title = 'Settings';
            app.SettingsTab.BackgroundColor = [0.149 0.149 0.149];

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.SettingsTab);
            app.GridLayout2.ColumnWidth = {'1x', '2x', '1x'};
            app.GridLayout2.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout2.ColumnSpacing = 5;
            app.GridLayout2.BackgroundColor = [0.149 0.149 0.149];

            % Create ModeLabel
            app.ModeLabel = uilabel(app.GridLayout2);
            app.ModeLabel.FontColor = [0.902 0.902 0.902];
            app.ModeLabel.Layout.Row = 1;
            app.ModeLabel.Layout.Column = 1;
            app.ModeLabel.Text = 'Mode';

            % Create ModeDropDown_2
            app.ModeDropDown_2 = uidropdown(app.GridLayout2);
            app.ModeDropDown_2.Items = {'No sync', 'Master-slave sync', 'Active sync'};
            app.ModeDropDown_2.ValueChangedFcn = createCallbackFcn(app, @Event.ModeDropDown_2ValueChanged, true);
            app.ModeDropDown_2.Tooltip = {''};
            app.ModeDropDown_2.BackgroundColor = [0.7843 0.7843 0.7843];
            app.ModeDropDown_2.Layout.Row = 1;
            app.ModeDropDown_2.Layout.Column = [2 3];
            app.ModeDropDown_2.Value = 'No sync';

            % Create MasterLabel_2
            app.MasterLabel_2 = uilabel(app.GridLayout2);
            app.MasterLabel_2.FontColor = [0.902 0.902 0.902];
            app.MasterLabel_2.Visible = 'off';
            app.MasterLabel_2.Layout.Row = 2;
            app.MasterLabel_2.Layout.Column = 1;
            app.MasterLabel_2.Text = 'Master';

            % Create DropDown
            app.DropDown = uidropdown(app.GridLayout2);
            app.DropDown.Items = {'System 1', 'System 2'};
            app.DropDown.Visible = 'off';
            app.DropDown.ValueChangedFcn = createCallbackFcn(app, @Event.MasterSelectionChanged, true);
            app.DropDown.BackgroundColor = [0.7843 0.7843 0.7843];
            app.DropDown.Layout.Row = 2;
            app.DropDown.Layout.Column = [2 3];
            app.DropDown.Value = 'System 1';

            % Create coeff1EditField_2
            app.coeff1EditField_2 = uieditfield(app.GridLayout2, 'numeric');
            app.coeff1EditField_2.Limits = [-1 1];
            app.coeff1EditField_2.Editable = 'off';
            app.coeff1EditField_2.BackgroundColor = [0.7843 0.7843 0.7843];
            app.coeff1EditField_2.Layout.Row = 3;
            app.coeff1EditField_2.Layout.Column = 2;

            % Create coeff1EditField_2Label
            app.coeff1EditField_2Label = uilabel(app.GridLayout2);
            app.coeff1EditField_2Label.BackgroundColor = [0.149 0.149 0.149];
            app.coeff1EditField_2Label.FontColor = [0.902 0.902 0.902];
            app.coeff1EditField_2Label.Tooltip = {'measures how much system 1 is affected by system 2'};
            app.coeff1EditField_2Label.Layout.Row = 3;
            app.coeff1EditField_2Label.Layout.Column = 1;
            app.coeff1EditField_2Label.Text = 'coeff1';

            % Create coeff2EditField
            app.coeff2EditField = uieditfield(app.GridLayout2, 'numeric');
            app.coeff2EditField.Limits = [-1 1];
            app.coeff2EditField.Editable = 'off';
            app.coeff2EditField.BackgroundColor = [0.7843 0.7843 0.7843];
            app.coeff2EditField.Layout.Row = 4;
            app.coeff2EditField.Layout.Column = 2;

            % Create coeff2EditFieldLabel
            app.coeff2EditFieldLabel = uilabel(app.GridLayout2);
            app.coeff2EditFieldLabel.FontColor = [0.902 0.902 0.902];
            app.coeff2EditFieldLabel.Tooltip = {'measures how much system 2 is affected by system 1'};
            app.coeff2EditFieldLabel.Layout.Row = 4;
            app.coeff2EditFieldLabel.Layout.Column = 1;
            app.coeff2EditFieldLabel.Text = 'coeff2';

            % Create GraphicsDropDown_2
            app.GraphicsDropDown_2 = uidropdown(app.GridLayout2);
            app.GraphicsDropDown_2.Items = {'2D plots (1)', '2D plots (2)', '3D plots', 'Error state plots'};
            app.GraphicsDropDown_2.BackgroundColor = [0.7843 0.7843 0.7843];
            app.GraphicsDropDown_2.Layout.Row = 5;
            app.GraphicsDropDown_2.Layout.Column = [2 3];
            app.GraphicsDropDown_2.Value = '2D plots (1)';

            % Create GraphicsDropDown_2Label
            app.GraphicsDropDown_2Label = uilabel(app.GridLayout2);
            app.GraphicsDropDown_2Label.FontColor = [0.902 0.902 0.902];
            app.GraphicsDropDown_2Label.Layout.Row = 5;
            app.GraphicsDropDown_2Label.Layout.Column = 1;
            app.GraphicsDropDown_2Label.Text = 'Graphics';

            % Create ParametersTab
            app.ParametersTab = uitab(app.TabGroup);
            app.ParametersTab.AutoResizeChildren = 'off';
            app.ParametersTab.Title = 'Parameters';
            app.ParametersTab.BackgroundColor = [0.149 0.149 0.149];
            app.ParametersTab.ForegroundColor = [0.149 0.149 0.149];

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.ParametersTab);
            app.GridLayout4.ColumnWidth = {'1x', '1x', '1x', '1x'};
            app.GridLayout4.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout4.BackgroundColor = [0.149 0.149 0.149];

            % Create TimestepEditField_2
            app.TimestepEditField_2 = uieditfield(app.GridLayout4, 'numeric');
            app.TimestepEditField_2.Limits = [0.0001 1];
            app.TimestepEditField_2.BackgroundColor = [0.7843 0.7843 0.7843];
            app.TimestepEditField_2.Layout.Row = 1;
            app.TimestepEditField_2.Layout.Column = [3 4];
            app.TimestepEditField_2.Value = 0.01;

            % Create TimestepEditField_2Label
            app.TimestepEditField_2Label = uilabel(app.GridLayout4);
            app.TimestepEditField_2Label.BackgroundColor = [0.149 0.149 0.149];
            app.TimestepEditField_2Label.FontColor = [0.902 0.902 0.902];
            app.TimestepEditField_2Label.Layout.Row = 1;
            app.TimestepEditField_2Label.Layout.Column = [1 2];
            app.TimestepEditField_2Label.Text = 'Time step';

            % Create StepnumberSpinner
            app.StepnumberSpinner = uispinner(app.GridLayout4);
            app.StepnumberSpinner.Limits = [1 100000];
            app.StepnumberSpinner.BackgroundColor = [0.7843 0.7843 0.7843];
            app.StepnumberSpinner.Layout.Row = 2;
            app.StepnumberSpinner.Layout.Column = [3 4];
            app.StepnumberSpinner.Value = 1000;
            app.StepnumberSpinner.ValueDisplayFormat = '%.0f';
            
            % Create StepnumberSpinnerLabel
            app.StepnumberSpinnerLabel = uilabel(app.GridLayout4);
            app.StepnumberSpinnerLabel.FontColor = [0.902 0.902 0.902];
            app.StepnumberSpinnerLabel.Layout.Row = 2;
            app.StepnumberSpinnerLabel.Layout.Column = [1 2];
            app.StepnumberSpinnerLabel.Text = 'Step number';

            % Create TimedifferenceSpinner
            app.TimedifferenceSpinner = uispinner(app.GridLayout4);
            app.TimedifferenceSpinner.Limits = [-100000 100000];
            app.TimedifferenceSpinner.BackgroundColor = [0.7843 0.7843 0.7843];
            app.TimedifferenceSpinner.Layout.Row = 3;
            app.TimedifferenceSpinner.Layout.Column = [3 4];
            app.TimedifferenceSpinner.ValueDisplayFormat = '%.0f';
            
            % Create TimedifferenceSpinnerLabel
            app.TimedifferenceSpinnerLabel = uilabel(app.GridLayout4);
            app.TimedifferenceSpinnerLabel.FontColor = [0.902 0.902 0.902];
            app.TimedifferenceSpinnerLabel.Tooltip = {'If it''s greater than 0, system 1 starts after the specified step number; system 2 starts at 0-step.'; 'If it''s lower than 0, considering the absolute value, system 2 starts after the specified step number; system 1 starts at 0-step.'; 'If it''s equal to 0 systems start at the same time.'};
            app.TimedifferenceSpinnerLabel.Layout.Row = 3;
            app.TimedifferenceSpinnerLabel.Layout.Column = [1 2];
            app.TimedifferenceSpinnerLabel.Text = 'Time delta';

            % Create InitialconditionsLabel
            app.InitialconditionsLabel = uilabel(app.GridLayout4);
            app.InitialconditionsLabel.FontColor = [0.902 0.902 0.902];
            app.InitialconditionsLabel.Layout.Row = 4;
            app.InitialconditionsLabel.Layout.Column = [1 2];
            app.InitialconditionsLabel.Text = 'Initial conditions';

            % Create System1Label
            app.System1Label = uilabel(app.GridLayout4);
            app.System1Label.FontColor = [0.902 0.902 0.902];
            app.System1Label.Layout.Row = 5;
            app.System1Label.Layout.Column = [1 2];
            app.System1Label.Text = 'System 1';

            % Create System2Label_2
            app.System2Label_2 = uilabel(app.GridLayout4);
            app.System2Label_2.FontColor = [0.902 0.902 0.902];
            app.System2Label_2.Layout.Row = 5;
            app.System2Label_2.Layout.Column = [3 4];
            app.System2Label_2.Text = 'System 2';

            % Create x1EditField
            app.x1EditField = uieditfield(app.GridLayout4, 'numeric');
            app.x1EditField.Limits = [-1 1];
            app.x1EditField.BackgroundColor = [0.7843 0.7843 0.7843];
            app.x1EditField.Layout.Row = 6;
            app.x1EditField.Layout.Column = 2;

            % Create x1EditField_2Label
            app.x1EditField_2Label = uilabel(app.GridLayout4);
            app.x1EditField_2Label.HorizontalAlignment = 'center';
            app.x1EditField_2Label.FontColor = [0.902 0.902 0.902];
            app.x1EditField_2Label.Layout.Row = 6;
            app.x1EditField_2Label.Layout.Column = 1;
            app.x1EditField_2Label.Interpreter = 'latex';
            app.x1EditField_2Label.Text = '$x_1$';

            % Create x2EditField
            app.x2EditField = uieditfield(app.GridLayout4, 'numeric');
            app.x2EditField.Limits = [-1 1];
            app.x2EditField.BackgroundColor = [0.7843 0.7843 0.7843];
            app.x2EditField.Layout.Row = 6;
            app.x2EditField.Layout.Column = 4;

            % Create x2EditFieldLabel
            app.x2EditFieldLabel = uilabel(app.GridLayout4);
            app.x2EditFieldLabel.HorizontalAlignment = 'center';
            app.x2EditFieldLabel.FontColor = [0.902 0.902 0.902];
            app.x2EditFieldLabel.Layout.Row = 6;
            app.x2EditFieldLabel.Layout.Column = 3;
            app.x2EditFieldLabel.Interpreter = 'latex';
            app.x2EditFieldLabel.Text = '$x_2$';

            % Create y1EditField
            app.y1EditField = uieditfield(app.GridLayout4, 'numeric');
            app.y1EditField.Limits = [-1 1];
            app.y1EditField.BackgroundColor = [0.7843 0.7843 0.7843];
            app.y1EditField.Layout.Row = 7;
            app.y1EditField.Layout.Column = 2;

            % Create y1EditFieldLabel
            app.y1EditFieldLabel = uilabel(app.GridLayout4);
            app.y1EditFieldLabel.HorizontalAlignment = 'center';
            app.y1EditFieldLabel.FontColor = [0.902 0.902 0.902];
            app.y1EditFieldLabel.Layout.Row = 7;
            app.y1EditFieldLabel.Layout.Column = 1;
            app.y1EditFieldLabel.Interpreter = 'latex';
            app.y1EditFieldLabel.Text = '$y_1$';

            % Create y2EditField
            app.y2EditField = uieditfield(app.GridLayout4, 'numeric');
            app.y2EditField.Limits = [-1 1];
            app.y2EditField.BackgroundColor = [0.7843 0.7843 0.7843];
            app.y2EditField.Layout.Row = 7;
            app.y2EditField.Layout.Column = 4;

            % Create y2EditFieldLabel
            app.y2EditFieldLabel = uilabel(app.GridLayout4);
            app.y2EditFieldLabel.HorizontalAlignment = 'center';
            app.y2EditFieldLabel.FontColor = [0.902 0.902 0.902];
            app.y2EditFieldLabel.Layout.Row = 7;
            app.y2EditFieldLabel.Layout.Column = 3;
            app.y2EditFieldLabel.Interpreter = 'latex';
            app.y2EditFieldLabel.Text = '$y_2$';

            % Create z1EditField
            app.z1EditField = uieditfield(app.GridLayout4, 'numeric');
            app.z1EditField.Limits = [-1 1];
            app.z1EditField.BackgroundColor = [0.7843 0.7843 0.7843];
            app.z1EditField.Layout.Row = 8;
            app.z1EditField.Layout.Column = 2;

            % Create z1EditFieldLabel
            app.z1EditFieldLabel = uilabel(app.GridLayout4);
            app.z1EditFieldLabel.HorizontalAlignment = 'center';
            app.z1EditFieldLabel.FontColor = [0.902 0.902 0.902];
            app.z1EditFieldLabel.Layout.Row = 8;
            app.z1EditFieldLabel.Layout.Column = 1;
            app.z1EditFieldLabel.Interpreter = 'latex';
            app.z1EditFieldLabel.Text = '$z_1$';

            % Create z2EditField
            app.z2EditField = uieditfield(app.GridLayout4, 'numeric');
            app.z2EditField.Limits = [-1 1];
            app.z2EditField.BackgroundColor = [0.7843 0.7843 0.7843];
            app.z2EditField.Layout.Row = 8;
            app.z2EditField.Layout.Column = 4;

            % Create z2EditFieldLabel
            app.z2EditFieldLabel = uilabel(app.GridLayout4);
            app.z2EditFieldLabel.HorizontalAlignment = 'center';
            app.z2EditFieldLabel.FontColor = [0.902 0.902 0.902];
            app.z2EditFieldLabel.Layout.Row = 8;
            app.z2EditFieldLabel.Layout.Column = 3;
            app.z2EditFieldLabel.Interpreter = 'latex';
            app.z2EditFieldLabel.Text = '$z_2$';

            % Create w1EditField
            app.w1EditField = uieditfield(app.GridLayout4, 'numeric');
            app.w1EditField.Limits = [-1 1];
            app.w1EditField.BackgroundColor = [0.7843 0.7843 0.7843];
            app.w1EditField.Layout.Row = 9;
            app.w1EditField.Layout.Column = 2;

            % Create w1EditFieldLabel
            app.w1EditFieldLabel = uilabel(app.GridLayout4);
            app.w1EditFieldLabel.HorizontalAlignment = 'center';
            app.w1EditFieldLabel.FontColor = [0.902 0.902 0.902];
            app.w1EditFieldLabel.Layout.Row = 9;
            app.w1EditFieldLabel.Layout.Column = 1;
            app.w1EditFieldLabel.Interpreter = 'latex';
            app.w1EditFieldLabel.Text = '$w_1$';

            % Create w2EditField
            app.w2EditField = uieditfield(app.GridLayout4, 'numeric');
            app.w2EditField.Limits = [-1 1];
            app.w2EditField.BackgroundColor = [0.7843 0.7843 0.7843];
            app.w2EditField.Layout.Row = 9;
            app.w2EditField.Layout.Column = 4;

            % Create w2EditFieldLabel
            app.w2EditFieldLabel = uilabel(app.GridLayout4);
            app.w2EditFieldLabel.HorizontalAlignment = 'center';
            app.w2EditFieldLabel.FontColor = [0.902 0.902 0.902];
            app.w2EditFieldLabel.Layout.Row = 9;
            app.w2EditFieldLabel.Layout.Column = 3;
            app.w2EditFieldLabel.Interpreter = 'latex';
            app.w2EditFieldLabel.Text = '$w_2$';

            % Create RANDOMButton
            app.RANDOMButton = uibutton(app.GridLayout4, 'push');
            app.RANDOMButton.ButtonPushedFcn = createCallbackFcn(app, @Event.RANDOMButtonPushed, true);
            app.RANDOMButton.BackgroundColor = [0.7882 0.1255 0.1255];
            app.RANDOMButton.FontColor = [0.902 0.902 0.902];
            app.RANDOMButton.Layout.Row = 10;
            app.RANDOMButton.Layout.Column = [2 3];
            app.RANDOMButton.Text = 'RANDOM';
            
            % Create Panel
            app.Panel = uipanel(app.GridLayout);
            app.Panel.ForegroundColor = [0.7843 0.7843 0.7843];
            app.Panel.BackgroundColor = [0.149 0.149 0.149];
            app.Panel.Layout.Row = 2;
            app.Panel.Layout.Column = 1;
            
            % Create GridLayout3
            app.GridLayout3 = uigridlayout(app.Panel);
            app.GridLayout3.ColumnWidth = {'1x', '2x'};
            app.GridLayout3.BackgroundColor = [0.149 0.149 0.149];

            % Create SUBMITButton
            app.SUBMITButton = uibutton(app.GridLayout3, 'push');
            app.SUBMITButton.ButtonPushedFcn = createCallbackFcn(app, @Event.SUBMITButtonPushed, true);
            app.SUBMITButton.BackgroundColor = [0.7882 0.1255 0.1255];
            app.SUBMITButton.FontColor = [0.902 0.902 0.902];
            app.SUBMITButton.Layout.Row = 1;
            app.SUBMITButton.Layout.Column = 1;
            app.SUBMITButton.Text = 'SUBMIT';

            % Create STARTANIMATIONButton
            app.STARTANIMATIONButton = uibutton(app.GridLayout3, 'push');
            app.STARTANIMATIONButton.ButtonPushedFcn = createCallbackFcn(app, @Event.STARTANIMATIONButtonPushed, true);
            app.STARTANIMATIONButton.BackgroundColor = [0.7882 0.1255 0.1255];
            app.STARTANIMATIONButton.FontColor = [0.902 0.902 0.902];
            app.STARTANIMATIONButton.Layout.Row = 1;
            app.STARTANIMATIONButton.Layout.Column = 2;
            app.STARTANIMATIONButton.Text = 'START ANIMATION';

            % Create CLEARButton
            app.CLEARButton = uibutton(app.GridLayout3, 'push');
            app.CLEARButton.ButtonPushedFcn = createCallbackFcn(app, @Event.CLEARButtonPushed, true);
            app.CLEARButton.BackgroundColor = [0.7882 0.1255 0.1255];
            app.CLEARButton.FontColor = [0.902 0.902 0.902];
            app.CLEARButton.Layout.Row = 2;
            app.CLEARButton.Layout.Column = 1;
            app.CLEARButton.Text = 'CLEAR';

            % Create CLEARANIMATIONButton
            app.CLEARANIMATIONButton = uibutton(app.GridLayout3, 'push');
            app.CLEARANIMATIONButton.ButtonPushedFcn = createCallbackFcn(app, @Event.CLEARANIMATIONButtonPushed, true);
            app.CLEARANIMATIONButton.BackgroundColor = [0.7882 0.1255 0.1255];
            app.CLEARANIMATIONButton.FontColor = [0.902 0.902 0.902];
            app.CLEARANIMATIONButton.Layout.Row = 2;
            app.CLEARANIMATIONButton.Layout.Column = 2;
            app.CLEARANIMATIONButton.Text = 'CLEAR ANIMATION';
            
            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Main
            close all; clc;
            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end