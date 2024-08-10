function ax_return = exergy_flow_tool_v3(Q_s,T_s,T_r,T_0,S_gen,circuit_plot,ax)
%% Clear axes
ax1 = ax{1};
ax2 = ax{2};
ax3 = ax{3};
ax4 = ax{4};
ax5 = ax{5};
cla(ax1)
cla(ax2)
cla(ax3)
cla(ax4)
cla(ax5)
%% Plotting
Q_1 = (Q_s)/Q_s;
Q_2 = (Q_s/T_s*T_0)/Q_s;
Q_3 = (Q_s*(1-T_0/T_s))/Q_s;
Q_4 = (S_gen*T_0)/Q_s;
Q_5 = ((Q_s/T_s+S_gen)*(T_r-T_0))/Q_s;
W = (Q_s*(1-T_r/T_s) - S_gen*T_r)/Q_s;

R_1 = T_0^(-1);
R_2 = T_0^(-1);
R_3 = (T_r-T_0)^(-1);
V_1 = Q_s/T_s;
V_2 = S_gen;
V_3 = S_gen;
V_4 = Q_s/T_s;

%Straight bars, no gradient
set(ax1,"XLim",[-3*Q_1 4.5*Q_1])
set(ax1,"YLim",[-5.5*Q_1 2*Q_1])

patch(ax1,[0 Q_1 Q_1 0],[0 0 Q_1 Q_1],"red","EdgeColor","none");
patch(ax1,[-3*Q_1 -3*Q_1+Q_2 -3*Q_1+Q_2 -3*Q_1],[-3*Q_2 -3*Q_2 -5.5*Q_1+(Q_2+Q_4)/2 -5.5*Q_1+(Q_2+Q_4)/2],[143 170 220]/255,"EdgeColor","none");
patch(ax1,[-3*Q_1+Q_2 -3*Q_1+Q_2+Q_4 -3*Q_1+Q_2+Q_4 -3*Q_1+Q_2],[-3*Q_2-3*Q_4-Q_1 -3*Q_2-3*Q_4-Q_1 -5.5*Q_1+(Q_2+Q_4)/2 -5.5*Q_1+(Q_2+Q_4)/2],[143 170 220]/255,"EdgeColor","none");
patch(ax1,[Q_2+Q_4 Q_2+Q_4+Q_5 Q_2+Q_4+Q_5 Q_2+Q_4],-Q_1+[-3*Q_2 -3*Q_2 -3.5*Q_1+Q_5/2 -3.5*Q_1+Q_5/2],[226 103 20]/255,"EdgeColor","none")

%Arrows
patch(ax1,[-3*Q_1 -3*Q_1+Q_2+Q_4 -3*Q_1+(Q_2+Q_4)/2],-2*Q_1+[-3.5*Q_1+(Q_2+Q_4)/2 -3.5*Q_1+(Q_2+Q_4)/2 -3.5*Q_1],[143 170 220]/255,"EdgeColor","none");
patch(ax1,[Q_2+Q_4 Q_2+Q_4+Q_5 Q_2+Q_4+Q_5/2],-2*Q_1+[-3.5*Q_1+Q_5/2 -3.5*Q_1+Q_5/2 -3.5*Q_1],[226 103 20]/255,"EdgeColor","none");
patch(ax1,[3*Q_1-W/2 3*Q_1 3*Q_1-W/2],-Q_1+[-3*Q_2-W -3*Q_2-1.5*W -3*Q_2-2*W],[255 217 102]/255,"EdgeColor","none");

%Curves
patch(ax1,[-3*Q_1+2*Q_2+2*Q_2*cos(linspace(pi,pi/2)) -3*Q_1+2*Q_2 -3*Q_1+2*Q_2+Q_2*cos(linspace(pi/2,pi))],[-3*Q_2+2*Q_2*sin(linspace(pi,pi/2)) -Q_2 -3*Q_2+Q_2*sin(linspace(pi/2,pi))],[143 170 220]/255,"EdgeColor","none")
patch(ax1,[-3*Q_1+Q_2+2*Q_4+2*Q_4*cos(linspace(pi,pi/2)) -3*Q_1+Q_2+2*Q_4 -3*Q_1+Q_2+2*Q_4+Q_4*cos(linspace(pi/2,pi))],-Q_1+[-3*Q_2-3*Q_4+2*Q_4*sin(linspace(pi,pi/2)) -3*Q_2-Q_4 -3*Q_2-3*Q_4+Q_4*sin(linspace(pi/2,pi))],[143 170 220]/255,"EdgeColor","none")

%Red to brown gradient
map2 = [linspace(255,226)',linspace(0,103)',linspace(0,20)']/255;
set(ax2,"XLim",[-3*Q_1 4.5*Q_1])
set(ax2,"YLim",[-5.5*Q_1 2*Q_1])

patch(ax2,[Q_2 Q_1 Q_1 Q_2],[0 0 -3*Q_2 -3*Q_2],[0 0 1 1],"EdgeColor","none")
ax2.Colormap = map2;

%Red to blue gradient
map3 = [linspace(255,143)',linspace(0,170)',linspace(0,220)']/255;
set(ax3,"XLim",[-3*Q_1 4.5*Q_1])
set(ax3,"YLim",[-5.5*Q_1 2*Q_1])

patch(ax3,[-Q_2+2*Q_2*cos(linspace(2*pi,3*pi/2)) -Q_2 -Q_2+Q_2*cos(linspace(3*pi/2,2*pi))],[2*Q_2*sin(linspace(2*pi,3*pi/2)) -2*Q_2 Q_2*sin(linspace(3*pi/2,2*pi))],[linspace(0,1) 1 linspace(1,0)],"EdgeColor","none")
ax3.Colormap = map3;

%Brown to blue gradient
map4 = [linspace(226,143)',linspace(103,170)',linspace(20,220)']/255;
set(ax4,"XLim",[-3*Q_1 4.5*Q_1])
set(ax4,"YLim",[-5.5*Q_1 2*Q_1])

patch(ax4,[Q_2-Q_4+2*Q_4*cos(linspace(2*pi,3*pi/2)) Q_2-Q_4 Q_2-Q_4+Q_4*cos(linspace(3*pi/2,2*pi))],-Q_1+[-3*Q_2+2*Q_4*sin(linspace(2*pi,3*pi/2)) -3*Q_2-2*Q_4 -3*Q_2+Q_4*sin(linspace(3*pi/2,2*pi))],[linspace(0,1) 1 linspace(1,0)],"EdgeColor","none")
ax4.Colormap = map4;

%Brown to gold gradient
map5 = [linspace(226,255)',linspace(103,217)',linspace(20,102)']/255;
set(ax5,"XLim",[-3*Q_1 4.5*Q_1])
set(ax5,"YLim",[-5.5*Q_1 2*Q_1])

patch(ax5,[Q_1+W+W*cos(linspace(pi,3*pi/2)) Q_1+W Q_1+W+2*W*cos(linspace(3*pi/2,pi))],-Q_1+[-3*Q_2+W*sin(linspace(pi,3*pi/2)) -3*Q_2-W -3*Q_2+2*W*sin(linspace(3*pi/2,pi))],[linspace(0,1) 1 linspace(1,0)],"EdgeColor","none")
ax5.Colormap = map5;

if circuit_plot ~= "y"
    %Filling in the gaps
    patch(ax5,[-Q_2 -3*Q_1+2*Q_2 -3*Q_1+2*Q_2 -Q_2],[-2*Q_2 -2*Q_2 -Q_2 -Q_2],[143 170 220]/255,"EdgeColor","none")
    patch(ax5,[Q_2-Q_4 -3*Q_1+Q_2+2*Q_4 -3*Q_1+Q_2+2*Q_4 Q_2-Q_4],[-3*Q_2-Q_1-2*Q_4 -3*Q_2-Q_1-2*Q_4 -3*Q_2-Q_1-Q_4 -3*Q_2-Q_1-Q_4],[143 170 220]/255,"EdgeColor","none")
    patch(ax5,[Q_2 Q_2+Q_3 Q_2+Q_3 Q_2],[-3*Q_2 -3*Q_2 -3*Q_2-Q_1 -3*Q_2-Q_1],[226 103 20]/255,"EdgeColor","none")
    patch(ax5,[Q_1+W 3*Q_1-W/2 3*Q_1-W/2 Q_1+W],[-3*Q_2-Q_1-2*W -3*Q_2-Q_1-2*W -3*Q_2-Q_1-W -3*Q_2-Q_1-W],[255 217 102]/255,"EdgeColor","none")
    patch(ax5,[Q_2+Q_4 Q_2+Q_4+Q_5 Q_2+Q_4+Q_5 Q_2+Q_4],[-4.5*Q_1+Q_5/2 -4.5*Q_1+Q_5/2 -5.5*Q_1+Q_5/2 -5.5*Q_1+Q_5/2],[226 103 20]/255,"EdgeColor","none")

else
    %Circuit symbols
    sz = 10;
    hold(ax5,"on")
    plot(ax5,Q_1/2+Q_1/4*cos(linspace(0,2*pi)),7*Q_1/4+Q_1/4*sin(linspace(0,2*pi)),"k")
    plot(ax5,[Q_1/2 Q_1/2],[31*Q_1/16 25*Q_1/16],"k")
    plot(ax5,[Q_1/2-Q_1/8 Q_1/2 Q_1/2+Q_1/8],[7*Q_1/4 25*Q_1/16 7*Q_1/4],"k")
    plot(ax5,[Q_1/2 Q_1/2],[3*Q_1/2 Q_1],"k")
    scatter(ax5,Q_1/2,Q_1,sz,"k","filled")
    scatter(ax5,-Q_2,-3*Q_2/2,sz,"k","filled")
    scatter(ax5,-3*Q_1+2*Q_2,-3*Q_2/2,sz,"k","filled")
    scatter(ax5,Q_2-Q_4,-3*Q_2-Q_1-3*Q_4/2,sz,"k","filled")
    scatter(ax5,-3*Q_1+Q_2+2*Q_4,-3*Q_2-Q_1-3*Q_4/2,sz,"k","filled")
    scatter(ax5,Q_2+Q_3/2,-3*Q_2,sz,"k","filled")
    scatter(ax5,Q_2+Q_3/2,-3*Q_2-Q_1,sz,"k","filled")
    scatter(ax5,Q_1+W,-3*Q_2-Q_1-3*W/2,sz,"k","filled")
    scatter(ax5,3*Q_1-W/2,-3*Q_2-Q_1-3*W/2,sz,"k","filled")
    scatter(ax5,Q_2+Q_4+Q_5/2,-4.5*Q_1+Q_5/2,sz,"k","filled")
    scatter(ax5,Q_2+Q_4+Q_5/2,-5.5*Q_1+Q_5/2,sz,"k","filled")
    %Exergetic heat rejection path resistance, voltage source, and ground
    plot(ax5,Q_2+Q_4+Q_5/2+[0 0 Q_1 -Q_1 Q_1 -Q_1 0 0]/16,-4.5*Q_1+Q_5/2+(-6*Q_1+[Q_1 0 -Q_1 -3*Q_1 -5*Q_1 -7*Q_1 -8*Q_1 -10*Q_1])/16,"k")
    plot(ax5,[Q_2+Q_4+Q_5/2 Q_2+Q_4+Q_5/2],-4.5*Q_1+Q_5/2+[0 -Q_1/8],"k")
    plot(ax5,Q_2+Q_4+Q_5/2+[Q_1/8 -Q_1/8],[-4.5*Q_1+Q_5/2-Q_1/8 -4.5*Q_1+Q_5/2-Q_1/8],"k")
    plot(ax5,Q_2+Q_4+Q_5/2+[Q_1/4 -Q_1/4],[-4.5*Q_1+Q_5/2-Q_1/4 -4.5*Q_1+Q_5/2-Q_1/4],"k")
    plot(ax5,[Q_2+Q_4+Q_5/2 Q_2+Q_4+Q_5/2],[-4.5*Q_1+Q_5/2-Q_1/4 -4.5*Q_1+Q_5/2+(-6*Q_1+Q_1)/16],"k")
    plot(ax5,[Q_2+Q_4+Q_5/2 Q_2+Q_4+Q_5/2-Q_1/4],[-5.5*Q_1+Q_5/2 -5.5*Q_1+Q_5/2],"k")
    plot(ax5,[Q_2+Q_4+Q_5/2-Q_1/4 Q_2+Q_4+Q_5/2-Q_1/4],[-5.5*Q_1+Q_5/2 -5.5*Q_1+Q_5/2+Q_1/4],"k")
    plot(ax5,[Q_2+Q_4+Q_5/2-Q_1/4 Q_2+Q_4+Q_5/2-Q_1/2],[-5.5*Q_1+Q_5/2+Q_1/4 -5.5*Q_1+Q_5/2+Q_1/4],"k")
    plot(ax5,[Q_2+Q_4+Q_5/2-Q_1/2 Q_2+Q_4+Q_5/2-Q_1/2],[-5.5*Q_1+Q_5/2+Q_1/4 -5.5*Q_1+Q_5/2+Q_1/8],"k")
    plot(ax5,[Q_2+Q_4+Q_5/2-Q_1/2-Q_1/8 Q_2+Q_4+Q_5/2-Q_1/2+Q_1/8 Q_2+Q_4+Q_5/2-Q_1/2 Q_2+Q_4+Q_5/2-Q_1/2-Q_1/8],[-5.5*Q_1+Q_5/2+Q_1/8 -5.5*Q_1+Q_5/2+Q_1/8 -5.5*Q_1+Q_5/2+Q_1/8-Q_1/8 -5.5*Q_1+Q_5/2+Q_1/8],"k")
    %T_0 heat rejection path resistance and ground
    plot(ax5,[-Q_2 (-3*Q_1+Q_2)/2+21*Q_1/32+(-6*Q_1+[Q_1 0 -Q_1 -3*Q_1 -5*Q_1 -7*Q_1 -8*Q_1 -10*Q_1])/16 -3*Q_1+2*Q_2],-1.5*Q_2+[0 0 0 Q_1 -Q_1 Q_1 -Q_1 0 0 0]/16,"k")
    plot(ax5,[-3*Q_1+2*Q_2 -3*Q_1+2*Q_2],[-3*Q_2/2 -3*Q_2/2-Q_1/8],"k")
    plot(ax5,[-3*Q_1+2*Q_2-Q_1/8 -3*Q_1+2*Q_2+Q_1/8 -3*Q_1+2*Q_2 -3*Q_1+2*Q_2-Q_1/8],[-3*Q_2/2-Q_1/8 -3*Q_2/2-Q_1/8 -3*Q_2/2-Q_1/4 -3*Q_2/2-Q_1/8],"k")
    %S_gen heat rejection path resistance and ground
    plot(ax5,[Q_2-Q_4 (Q_2-Q_4)-(3*Q_1-3*Q_4)/2+9*Q_1/32+([Q_1 0 -Q_1 -3*Q_1 -5*Q_1 -7*Q_1 -8*Q_1 -10*Q_1])/16 -3*Q_1+Q_2+2*Q_4],-3*Q_2-Q_1-3*Q_4/2+[0 0 0 Q_1 -Q_1 Q_1 -Q_1 0 0 0]/16,"k")
    plot(ax5,[-3*Q_1+Q_2+2*Q_4 -3*Q_1+Q_2+2*Q_4],[-3*Q_2-Q_1-3*Q_4/2 -3*Q_2-Q_1-3*Q_4/2-Q_1/8],"k")
    plot(ax5,[-3*Q_1+Q_2+2*Q_4-Q_1/8 -3*Q_1+Q_2+2*Q_4+Q_1/8 -3*Q_1+Q_2+2*Q_4 -3*Q_1+Q_2+2*Q_4-Q_1/8],[-3*Q_2-Q_1-3*Q_4/2-Q_1/8 -3*Q_2-Q_1-3*Q_4/2-Q_1/8 -3*Q_2-Q_1-3*Q_4/2-Q_1/4 -3*Q_2-Q_1-3*Q_4/2-Q_1/8],"k")
    %Work path voltage source and ground
    plot(ax5,[Q_1+W Q_1+W+((2*Q_1-3*W/2)/2-Q_1/16)],[-3*Q_2-Q_1-3*W/2 -3*Q_2-Q_1-3*W/2],"k")
    plot(ax5,[3*Q_1-W/2 3*Q_1-W/2-((2*Q_1-3*W/2)/2-Q_1/16)],[-3*Q_2-Q_1-3*W/2 -3*Q_2-Q_1-3*W/2],"k")
    plot(ax5,[Q_1+W+((2*Q_1-3*W/2)/2-Q_1/16) Q_1+W+((2*Q_1-3*W/2)/2-Q_1/16)],-3*Q_2-Q_1-3*W/2+[Q_1/4 -Q_1/4],"k")
    plot(ax5,[3*Q_1-W/2-((2*Q_1-3*W/2)/2-Q_1/16) 3*Q_1-W/2-((2*Q_1-3*W/2)/2-Q_1/16)],-3*Q_2-Q_1-3*W/2+[Q_1/8 -Q_1/8],"k")
    plot(ax5,[3*Q_1-W/2 3*Q_1-W/2],[-3*Q_2-Q_1-3*W/2 -3*Q_2-Q_1-3*W/2-Q_1/8],"k")
    plot(ax5,[3*Q_1-W/2-Q_1/8 3*Q_1-W/2+Q_1/8 3*Q_1-W/2 3*Q_1-W/2-Q_1/8],[-3*Q_2-Q_1-3*W/2-Q_1/8 -3*Q_2-Q_1-3*W/2-Q_1/8 -3*Q_2-Q_1-3*W/2-Q_1/4 -3*Q_2-Q_1-3*W/2-Q_1/8],"k")
    %Q_3 path voltage sources
    plot(ax5,[Q_2+Q_3/2 Q_2+Q_3/2],[-3*Q_2 -3*Q_2-Q_1/8],"k")
    plot(ax5,[Q_2+Q_3/2 Q_2+Q_3/2],[-3*Q_2-Q_1 -3*Q_2-Q_1+Q_1/8],"k")
    plot(ax5,[Q_2+Q_3/2 Q_2+Q_3/2],-3*Q_2-Q_1/2+[Q_1/4 -Q_1/4],"k")
    plot(ax5,Q_2+Q_3/2+[Q_1/4 -Q_1/4],[-3*Q_2-Q_1/8 -3*Q_2-Q_1/8],"k")
    plot(ax5,Q_2+Q_3/2+[Q_1/4 -Q_1/4],[-3*Q_2-Q_1+Q_1/8 -3*Q_2-Q_1+Q_1/8],"k")
    plot(ax5,Q_2+Q_3/2+[Q_1/8 -Q_1/8],[-3*Q_2-Q_1/2+Q_1/4 -3*Q_2-Q_1/2+Q_1/4],"k")
    plot(ax5,Q_2+Q_3/2+[Q_1/8 -Q_1/8],[-3*Q_2-Q_1/2-Q_1/4 -3*Q_2-Q_1/2-Q_1/4],"k")
    hold(ax5,"off")
    %Labels
    text(ax5,3*Q_1/4,3*Q_1/2,string(Q_s)+" W");
    text(ax5,-3*Q_1+2*Q_2,-Q_2,string(R_1)+" 1/K");
    text(ax5,-3*Q_1+Q_2+2*Q_4+Q_1/8,-3*Q_2-Q_1-3*Q_4,string(R_2)+" 1/K");
    text(ax5,Q_2+Q_4+Q_5,-5.5*Q_1+Q_5,string(R_3)+" 1/K");
    text(ax5,Q_1,-3*Q_2-Q_1/3,string(V_1)+" W/K","VerticalAlignment","bottom");
    text(ax5,Q_1/3,-3*Q_2-Q_1,string(V_2)+" W/K","HorizontalAlignment","right","VerticalAlignment","bottom");
    text(ax5,Q_1+2*W,-3*Q_2-Q_1-3.5*W,string(V_3)+" W/K");
    text(ax5,Q_2+Q_4+Q_5+Q_1/8,-4.5*Q_1,string(V_4)+" W/K");
end

ax_return = {ax1 ax2 ax3 ax4 ax5};