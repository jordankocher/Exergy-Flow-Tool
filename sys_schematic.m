function [] = sys_schematic(Q_s,T_s,T_r,T_0,S_gen,ax)
    cla(ax)
    Q_1 = (Q_s)/Q_s;
    Q_2 = (Q_s/T_s*T_0)/Q_s;
    Q_4 = (S_gen*T_0)/Q_s;
    Q_5a = Q_s/T_s*(T_r-T_0)/Q_s;
    Q_5b = S_gen*(T_r-T_0)/Q_s;
    W = (Q_s*(1-T_r/T_s) - S_gen*T_r)/Q_s;

    set(ax,"XLim",[-1.25 1.25])
    set(ax,"YLim",[-1.25 1.25])
    patch(ax,[-0.5 0.5 0.5 -0.5],[0.5 0.5 -0.5 -0.5],[1 1 1],"EdgeColor","k","LineWidth",2,"LineStyle","--")
    hold(ax,"on")
    %Heat input
    plot(ax,[0.125*sin(linspace(pi,-7*pi/2,89)) 0.125/2+0.125/2*sin(linspace(-7*pi/2,-9*pi/2,11))]/2,[linspace(1,0.6444,89) linspace(0.6444,0.6,11)],"Color","r","LineWidth",2,"LineStyle","-")
    patch(ax,[-0.05 0.05 0],[0.6 0.6 0.5],"r","EdgeColor","none")
    %Work output
    plot(ax,[linspace(0.6,0.6444,11) linspace(0.6444,1,89)]-0.1,[0.125*sin(linspace(pi,-7*pi/2,89)) 0.125/2+0.125/2*sin(linspace(-7*pi/2,-9*pi/2,11))]/2,"Color",[255 217 102]/255,"LineWidth",2,"LineStyle","-")
    patch(ax,[0.9 0.9 1],[-0.05 0.05 0],[255 217 102]/255,"EdgeColor","none")
    %T_0 necessary heat rejection
    plot(ax,[0.125*sin(linspace(pi,-7*pi/2,89)) 0.125/2+0.125/2*sin(linspace(-7*pi/2,-9*pi/2,11))]/2-0.5,[linspace(1,0.6444,89) linspace(0.6444,0.6,11)]-1.5,"Color",[143 170 220]/255,"LineWidth",2,"LineStyle","-")
    patch(ax,[-0.05 0.05 0]-0.5,[0.6 0.6 0.5]-1.5,[143 170 220]/255,"EdgeColor","none")
    %S_gen necessary heat rejection
    plot(ax,[0.125*sin(linspace(pi,-7*pi/2,89)) 0.125/2+0.125/2*sin(linspace(-7*pi/2,-9*pi/2,11))]/2-0.25,[linspace(1,0.6444,89) linspace(0.6444,0.6,11)]-1.5,"Color",[143 170 220]/255,"LineWidth",2,"LineStyle","-")
    patch(ax,[-0.05 0.05 0]-0.25,[0.6 0.6 0.5]-1.5,[143 170 220]/255,"EdgeColor","none")
    %T_0 exergetic heat rejection
    plot(ax,[0.125*sin(linspace(pi,-7*pi/2,89)) 0.125/2+0.125/2*sin(linspace(-7*pi/2,-9*pi/2,11))]/2+0.25,[linspace(1,0.6444,89) linspace(0.6444,0.6,11)]-1.5,"Color",[226 103 20]/255,"LineWidth",2,"LineStyle","-")
    patch(ax,[-0.05 0.05 0]+0.25,[0.6 0.6 0.5]-1.5,[226 103 20]/255,"EdgeColor","none")
    %S_gen exergetic heat rejection
    plot(ax,[0.125*sin(linspace(pi,-7*pi/2,89)) 0.125/2+0.125/2*sin(linspace(-7*pi/2,-9*pi/2,11))]/2+0.5,[linspace(1,0.6444,89) linspace(0.6444,0.6,11)]-1.5,"Color",[226 103 20]/255,"LineWidth",2,"LineStyle","-")
    patch(ax,[-0.05 0.05 0]+0.5,[0.6 0.6 0.5]-1.5,[226 103 20]/255,"EdgeColor","none")
    %Text
    t_1 = text(ax,0,1,string(round(Q_s*Q_1,1))+" W");
    t_1.HorizontalAlignment = "center";
    t_1.VerticalAlignment = "bottom";
    t_2 = text(ax,-0.5,-1,string(round(Q_s*Q_2,1))+" W");
    t_2.HorizontalAlignment = "right";
    t_2.VerticalAlignment = "top";
    t_3 = text(ax,-0.25,-1,string(round(Q_s*Q_4,1))+" W");
    t_3.HorizontalAlignment = "center";
    t_3.VerticalAlignment = "top";
    t_4 = text(ax,0.25,-1,string(round(Q_s*Q_5a,1))+" W");
    t_4.HorizontalAlignment = "center";
    t_4.VerticalAlignment = "top";
    t_5 = text(ax,0.5,-1,string(round(Q_s*Q_5b,1))+" W");
    t_5.HorizontalAlignment = "left";
    t_5.VerticalAlignment = "top";
    t_6 = text(ax,1,0,string(round(Q_s*W,1))+" W");
    t_6.HorizontalAlignment = "left";
    t_6.VerticalAlignment = "middle";
    t_7 = text(ax,0,0,string(round(S_gen,1))+" W/K");
    t_7.HorizontalAlignment = "center";
    t_7.VerticalAlignment = "middle";
    t_8 = text(ax,0,-1.1,"("+string(round(Q_s*(Q_2+Q_4+Q_5a+Q_5b),1))+" W Total)");
    t_8.HorizontalAlignment = "center";
    t_8.VerticalAlignment = "top";
    hold(ax,"off")
end