% 'The synchronization of identical Memristors systems via Lyapunov direct method'
% Class that implements static methods for plotting graphics
% author: Vito Scaraggi

classdef Graphics 
    methods (Access = public, Static)
        
        %Code that plots 2D graphics
        function plots2D1(app,x1,x2,y1,y2,z1,z2,w1,w2,t,index1,index2)
            global g;
            delete(g);
            g = uigridlayout(app.GridLayout);
            g.ColumnWidth = {'1x', '1x'};
            g.RowHeight = {'1x', '1x'};
            g.Layout.Row = 1;
            g.Layout.Column = 2;
            g.Padding = [4 4 4 4];
            g.ColumnSpacing = 1;
            g.RowSpacing = 1;
            g.BackgroundColor = [0.149 0.149 0.149];

            ax1 = uiaxes(g,'Visible','off');
            ax1.Title.String = '$\mathrm{State\,} x_1, x_2 \mathrm{\,over\,time}$';
            ax1.Title.FontWeight = 'normal';
            ax1.Title.Color = [0.9 0.9 0.9];
            ax1.XLabel.String = '$t$';
            ax1.YLabel.String = '$x$';
            ax1.NextPlot = 'add';
            ax1.GridAlpha = 0.25;
            ax1.XGrid = 'on';
            ax1.YGrid = 'on';
            ax1.Layout.Row = 1;
            ax1.Layout.Column = 1;
            ax1.XAxis.Color = [0.9 0.9 0.9];
            ax1.YAxis.Color = [0.9 0.9 0.9];
            ax1.Color = [0.149 0.149 0.149];

            ax2 = uiaxes(g,'Visible','off');
            ax2.Title.String = '$\mathrm{State\,} y_1, y_2 \mathrm{\,over\,time}$';
            ax2.Title.FontWeight = 'normal';
            ax2.Title.Color = [0.9 0.9 0.9];
            ax2.XLabel.String = '$t$';
            ax2.YLabel.String = '$y$';
            ax2.NextPlot = 'add';
            ax2.GridAlpha = 0.25;
            ax2.XGrid = 'on';
            ax2.YGrid = 'on';
            ax2.Layout.Row = 1;
            ax2.Layout.Column = 2;
            ax2.XAxis.Color = [0.9 0.9 0.9];
            ax2.YAxis.Color = [0.9 0.9 0.9];
            ax2.Color = [0.149 0.149 0.149];

            ax3 = uiaxes(g,'Visible','off');
            ax3.Title.String = '$\mathrm{State\,} z_1, z_2 \mathrm{\,over\,time}$';
            ax3.Title.FontWeight = 'normal';
            ax3.Title.Color = [0.9 0.9 0.9];
            ax3.XLabel.String = '$t$';
            ax3.YLabel.String = '$z$';
            ax3.NextPlot = 'add';
            ax3.GridAlpha = 0.25;
            ax3.XGrid = 'on';
            ax3.YGrid = 'on';
            ax3.Layout.Row = 2;
            ax3.Layout.Column = 1;
            ax3.XAxis.Color = [0.9 0.9 0.9];
            ax3.YAxis.Color = [0.9 0.9 0.9];
            ax3.Color = [0.149 0.149 0.149];

            ax4 = uiaxes(g,'Visible','off');
            ax4.Title.String = '$\mathrm{State\,} w_1, w_2 \mathrm{\,over\,time}$';
            ax4.Title.FontWeight = 'normal';
            ax4.Title.Color = [0.9 0.9 0.9];
            ax4.XLabel.String = '$t$';
            ax4.YLabel.String = '$w$';
            ax4.NextPlot = 'add';
            ax4.GridAlpha = 0.25;
            ax4.XGrid = 'on';
            ax4.YGrid = 'on';
            ax4.Layout.Row = 2;
            ax4.Layout.Column = 2;
            ax4.XAxis.Color = [0.9 0.9 0.9];
            ax4.YAxis.Color = [0.9 0.9 0.9];
            ax4.Color = [0.149 0.149 0.149];

            g1 = plot(ax1,t(index1:end),x1(index1:end),'color','#ff3333','displayName','$x_1$','lineWidth',1.1);
            g2 = plot(ax1,t(index2:end),x2(index2:end),'color','#3385ff','displayName','$x_2$','lineWidth',1.1);
            plot (ax1,t(index1),x1(index1),'gx','markerSize',9,'lineWidth',1.1);
            plot (ax1,t(index2),x2(index2),'gx','markerSize',9,'lineWidth',1.1);
            legend(ax1,[g1 g2],'location','northeastoutside','textColor',[0.9 0.9 0.9]);
            legend(ax1,'boxoff');

            g1 = plot(ax2,t(index1:end),y1(index1:end),'color','#ff3333','displayName','$y_1$','lineWidth',1.1);
            g2 = plot(ax2,t(index2:end),y2(index2:end),'color','#3385ff','displayName','$y_2$','lineWidth',1.1);
            plot (ax2,t(index1),y1(index1),'gx','markerSize',9,'lineWidth',1.1);
            plot (ax2,t(index2),y2(index2),'gx','markerSize',9,'lineWidth',1.1);
            legend(ax2,[g1 g2],'location','northeastoutside','textColor',[0.9 0.9 0.9]);
            legend(ax2,'boxoff');

            g1 = plot(ax3,t(index1:end),z1(index1:end),'color','#ff3333','displayName','$z_1$','lineWidth',1.1);
            g2 = plot(ax3,t(index2:end),z2(index2:end),'color','#3385ff','displayName','$z_2$','lineWidth',1.1);
            plot (ax3,t(index1),z1(index1),'gx','markerSize',9,'lineWidth',1.1);
            plot (ax3,t(index2),z2(index2),'gx','markerSize',9,'lineWidth',1.1);
            legend(ax3,[g1 g2],'location','northeastoutside','textColor',[0.9 0.9 0.9]);
            legend(ax3,'boxoff');

            g1 = plot(ax4,t(index1:end),w1(index1:end),'color','#ff3333','displayName','$w_1$','lineWidth',1.1);
            g2 = plot(ax4,t(index2:end),w2(index2:end),'color','#3385ff','displayName','$w_2$','lineWidth',1.1);
            plot (ax4,t(index1),w1(index1),'gx','markerSize',9,'lineWidth',1.1);
            plot (ax4,t(index2),w2(index2),'gx','markerSize',9,'lineWidth',1.1);
            legend(ax4,[g1 g2],'location','northeastoutside','textColor',[0.9 0.9 0.9]);
            legend(ax4,'boxoff');

            ax1.Visible = 'on';
            ax2.Visible = 'on';
            ax3.Visible = 'on';
            ax4.Visible = 'on';
        end

        %Code that plots 2D graphics

        function plots2D2(app,x1,x2,y1,y2,z1,z2,w1,w2)
            global g;
            delete(g);
            g = uigridlayout(app.GridLayout);
            g.ColumnWidth = {'1x', '1x'};
            g.RowHeight = {'1x', '1x'};
            g.Layout.Row = 1;
            g.Layout.Column = 2;
            g.Padding = [4 4 4 4];
            g.ColumnSpacing = 1;
            g.RowSpacing = 1;
            g.BackgroundColor = [0.149 0.149 0.149];

            ax1 = uiaxes(g,'Visible','off');
            ax1.Title.String = '$\mathrm{State\,} x_1, x_2$';
            ax1.Title.FontWeight = 'normal';
            ax1.XLabel.String = '$x_1$';
            ax1.YLabel.String = '$x_2$';
            ax1.NextPlot = 'add';
            ax1.GridAlpha = 0.25;
            ax1.XGrid = 'on';
            ax1.YGrid = 'on';
            ax1.Layout.Row = 1;
            ax1.Layout.Column = 1;
            ax1.Title.Color = [0.9 0.9 0.9];
            ax1.XAxis.Color = [0.9 0.9 0.9];
            ax1.YAxis.Color = [0.9 0.9 0.9];
            ax1.Color = [0.149 0.149 0.149];

            ax2 = uiaxes(g,'Visible','off');
            ax2.Title.String = '$\mathrm{State\,} y_1, y_2$';
            ax2.Title.FontWeight = 'normal';
            ax2.XLabel.String = '$y_1$';
            ax2.YLabel.String = '$y_2$';
            ax2.NextPlot = 'add';
            ax2.GridAlpha = 0.25;
            ax2.XGrid = 'on';
            ax2.YGrid = 'on';
            ax2.Layout.Row = 1;
            ax2.Layout.Column = 2;
            ax2.Title.Color = [0.9 0.9 0.9];
            ax2.XAxis.Color = [0.9 0.9 0.9];
            ax2.YAxis.Color = [0.9 0.9 0.9];
            ax2.Color = [0.149 0.149 0.149];

            ax3 = uiaxes(g,'Visible','off');
            ax3.Title.String = '$$\mathrm{State\,} z_1, z_2$';
            ax3.Title.FontWeight = 'normal';
            ax3.XLabel.String = '$z_1$';
            ax3.YLabel.String = '$z_2$';
            ax3.NextPlot = 'add';
            ax3.GridAlpha = 0.25;
            ax3.XGrid = 'on';
            ax3.YGrid = 'on';
            ax3.Layout.Row = 2;
            ax3.Layout.Column = 1;
            ax3.Title.Color = [0.9 0.9 0.9];
            ax3.XAxis.Color = [0.9 0.9 0.9];
            ax3.YAxis.Color = [0.9 0.9 0.9];
            ax3.Color = [0.149 0.149 0.149];

            ax4 = uiaxes(g,'Visible','off');
            ax4.Title.String = '$\mathrm{State\,} w_1, w_2$';
            ax4.Title.FontWeight = 'normal';
            ax4.XLabel.String = '$w_1$';
            ax4.YLabel.String = '$w_2$';
            ax4.NextPlot = 'add';
            ax4.GridAlpha = 0.25;
            ax4.XGrid = 'on';
            ax4.YGrid = 'on';
            ax4.Layout.Row = 2;
            ax4.Layout.Column = 2;
            ax4.Title.Color = [0.9 0.9 0.9];
            ax4.XAxis.Color = [0.9 0.9 0.9];
            ax4.YAxis.Color = [0.9 0.9 0.9];
            ax4.Color = [0.149 0.149 0.149];

            plot(ax1,x1,x2,'color','#ff3333','lineWidth',1.1);
            plot (ax1,x1(1),x2(1),'gx','markerSize',9,'lineWidth',1.1);

            plot(ax2,y1,y2,'color','#ff3333','lineWidth',1.1);
            plot (ax2,y1(1),y2(1),'gx','markerSize',9,'lineWidth',1.1);

            plot(ax3,z1,z2,'color','#ff3333','lineWidth',1.1);
            plot (ax3,z1(1),z2(1),'gx','markerSize',9,'lineWidth',1.1);

            plot(ax4,w1,w2,'color','#ff3333','lineWidth',1.1);
            plot (ax4,w1(1),w2(1),'gx','markerSize',9,'lineWidth',1.1);

            ax1.Visible = 'on';
            ax2.Visible = 'on';
            ax3.Visible = 'on';
            ax4.Visible = 'on';
        end

        %Code that plots 3D graphics

        function plots3D(app,x1,x2,y1,y2,z1,z2,w1,w2,index1,index2)
            global g;
            delete(g);
            g = uigridlayout(app.GridLayout);
            g.ColumnWidth = {'1x', '1x'};
            g.RowHeight = {'1x'};
            g.Layout.Row = 1;
            g.Layout.Column = 2;
            g.Padding = [4 4 4 4];
            g.ColumnSpacing = 1;
            g.RowSpacing = 1;
            g.BackgroundColor = [0.149 0.149 0.149];

            global ax1 ax2;
            ax1 = uiaxes(g,'Visible','off');
            ax1.Title.String = '$\mathrm{States\,}x,y,z$';
            ax1.Title.FontWeight = 'normal';
            ax1.XLabel.String = '$x$';
            ax1.YLabel.String = '$y$';
            ax1.ZLabel.String = '$z$';
            ax1.NextPlot = 'add';
            ax1.Layout.Row = 1;
            ax1.Layout.Column = 1;
            ax1.View = [45,30];
            ax1.Title.Color = [0.9 0.9 0.9];
            ax1.XAxis.Color = [0.9 0.9 0.9];
            ax1.YAxis.Color = [0.9 0.9 0.9];
            ax1.ZAxis.Color = [0.9 0.9 0.9];
            ax1.Color = [0.149 0.149 0.149];

            ax2 = uiaxes(g,'Visible','off');
            ax2.Title.String = '$\mathrm{States\,}x,y,w$';
            ax2.Title.FontWeight = 'normal';
            ax2.XLabel.String = '$x$';
            ax2.YLabel.String = '$y$';
            ax2.ZLabel.String = '$w$';
            ax2.NextPlot = 'add';
            ax2.Layout.Row = 1;
            ax2.Layout.Column = 2;
            ax2.View = [45,-30];
            ax2.Title.Color = [0.9 0.9 0.9];
            ax2.XAxis.Color = [0.9 0.9 0.9];
            ax2.YAxis.Color = [0.9 0.9 0.9];
            ax2.ZAxis.Color = [0.9 0.9 0.9];
            ax2.Color = [0.149 0.149 0.149];

            g1 = plot3(ax1,x1(index1:end),y1(index1:end),z1(index1:end),'color','#ff3333','displayName','$\mathrm{system\,1}$','lineWidth',1.1);
            g2 = plot3(ax1,x2(index2:end),y2(index2:end),z2(index2:end),'color','#3385ff','displayName','$\mathrm{system\,2}$','lineWidth',1.1);
            plot3(ax1,x1(index1),y1(index1),z1(index1),'color','g','marker','x','markerSize',18,'linewidth',1.1);
            plot3(ax1,x2(index2),y2(index2),z2(index2),'color','g','marker','x','markerSize',18,'linewidth',1.1);
            legend(ax1,[g1 g2],'location','northeastoutside','textColor',[0.9 0.9 0.9]);
            legend(ax1,'boxoff');

            g1 = plot3(ax2,x1(index1:end),y1(index1:end),w1(index1:end),'color','#ff3333','displayName','$\mathrm{system\,1}$','lineWidth',1.1);
            g2 = plot3(ax2,x2(index2:end),y2(index2:end),w2(index2:end),'color','#3385ff','displayName','$\mathrm{system\,2}$','lineWidth',1.1);
            plot3(ax2,x1(index1),y1(index1),w1(index1),'color','g','marker','x','markerSize',18,'linewidth',1.1);
            plot3(ax2,x2(index2),y2(index2),w2(index2),'color','g','marker','x','markerSize',18,'linewidth',1.1);
            legend(ax2,[g1 g2],'location','northeastoutside','textColor',[0.9 0.9 0.9]);
            legend(ax2,'boxoff');

            ax1.Visible = 'on';
            ax2.Visible = 'on';

        end

        %Code that plots graphics about error states

        function errorPlots(app,xp,yp,zp,wp,t)   
            global g;
            delete(g);
            g = uigridlayout(app.GridLayout);
            g.ColumnWidth = {'1x'};
            g.RowHeight = {'1x', '1x'};
            g.Layout.Row = 1;
            g.Layout.Column = 2;
            g.Padding = [4 4 4 4];
            g.ColumnSpacing = 1;
            g.RowSpacing = 1;
            g.BackgroundColor = [0.149 0.149 0.149];

            ax1 = uiaxes(g,'Visible','off');
            ax1.Title.String = '$\mathrm{Error\,states\,over\,time}$';
            ax1.Title.FontWeight = 'normal';
            ax1.XLabel.String = '$t$';
            ax1.YLabel.String = '$\mathrm{error\,states}$';
            ax1.NextPlot = 'add';
            ax1.GridAlpha = 0.25;
            ax1.XGrid = 'on';
            ax1.YGrid = 'on';
            ax1.Layout.Row = 1;
            ax1.Layout.Column = 1;
            ax1.Title.Color = [0.9 0.9 0.9];
            ax1.XAxis.Color = [0.9 0.9 0.9];
            ax1.YAxis.Color = [0.9 0.9 0.9];
            ax1.Color = [0.149 0.149 0.149];

            ax2 = uiaxes(g,'Visible','off');
            ax2.Title.String = '$\mathrm{Sum\,of\,error\,states\,over\,time}$';
            ax2.Title.FontWeight = 'normal';
            ax2.XLabel.String = '$t$';
            ax2.YLabel.String = '$\parallel x_\perp\parallel + \parallel y_\perp\parallel + \parallel z_\perp\parallel + \parallel w_\perp\parallel$';
            ax2.NextPlot = 'add';
            ax2.GridAlpha = 0.25;
            ax2.XGrid = 'on';
            ax2.YGrid = 'on';
            ax2.Layout.Row = 2;
            ax2.Layout.Column = 1;
            ax2.Title.Color = [0.9 0.9 0.9];
            ax2.XAxis.Color = [0.9 0.9 0.9];
            ax2.YAxis.Color = [0.9 0.9 0.9];
            ax2.Color = [0.149 0.149 0.149];

            plot(ax1,t,xp,'color','#ff3333','displayName','$x_\perp$','lineWidth',1.1);
            plot(ax1,t,yp,'color','#3385ff','displayName','$y_\perp$','lineWidth',1.1);
            plot(ax1,t,zp,'color','#33ff33','displayName','$z_\perp$','lineWidth',1.1);
            plot(ax1,t,wp,'color','#d24dff','displayName','$w_\perp$','lineWidth',1.1);
            legend(ax1,'location','northeastoutside','textColor',[0.9 0.9 0.9]);
            legend(ax1,'boxoff');

            plot(ax2,t,abs(xp)+abs(yp)+abs(zp)+abs(wp),'color','#ff3333','lineWidth',1.1);

            ax1.Visible = 'on';
            ax2.Visible = 'on';

        end
    end
end