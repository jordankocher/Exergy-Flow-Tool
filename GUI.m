function GUI

Q_s = 1000;
T_s = 900;
T_r = 500;
T_0 = 320;
S_gen = 0.5;
circuit_plot = "n";

f = uifigure('Position',[50 50 1000 625]);
p = uipanel(f);
p.Units = "normalized";
p.Position = [0 0.2 0.5 0.8];
p.BorderType = "none";
p2 = uipanel(f);
p2.Units = "normalized";
p2.Position = [0.5 0.2 0.5 0.8];
p2.BorderType = "none";

t = tiledlayout(p,1,1);
ax1 = axes(t);
set(ax1,'color','none')
set(get(ax1, 'XAxis'), 'Visible', 'off')
set(get(ax1, 'YAxis'), 'Visible', 'off')

ax2 = axes(t);
set(ax2,'color','none')
set(get(ax2, 'XAxis'), 'Visible', 'off')
set(get(ax2, 'YAxis'), 'Visible', 'off')

ax3 = axes(t);
set(ax3,'color','none')
set(get(ax3, 'XAxis'), 'Visible', 'off')
set(get(ax3, 'YAxis'), 'Visible', 'off')

ax4 = axes(t);
set(ax4,'color','none')
set(get(ax4, 'XAxis'), 'Visible', 'off')
set(get(ax4, 'YAxis'), 'Visible', 'off')

ax5 = axes(t);
set(ax5,'color','none')
set(get(ax5, 'XAxis'), 'Visible', 'off')
set(get(ax5, 'YAxis'), 'Visible', 'off')

ax = {ax1 ax2 ax3 ax4 ax5};
f.UserData = struct("HeatInput",Q_s,"SourceTemperature",T_s,...
    "RejectionTemperature",T_r,"AmbientTemperature",T_0,...
    "EntropyGeneration",S_gen,"CircuitPlotting",circuit_plot,...
    "Axes",ax);

ax = exergy_flow_tool_v3(Q_s,T_s,T_r,T_0,S_gen,circuit_plot,ax);

t2 = tiledlayout(p2,1,1);
ax0 = axes(t2);
set(ax0,'color','none')
set(get(ax0, 'XAxis'), 'Visible', 'off')
set(get(ax0, 'YAxis'), 'Visible', 'off')

sys_schematic(Q_s,T_s,T_r,T_0,S_gen,ax0)

p3 = uipanel(f);
p3.Units = "normalized";
p3.Position = [0 0 0.25 0.2];
p3.BorderType = "none";

p4 = uipanel(f);
p4.Units = "normalized";
p4.Position = [0.25 0 0.15 0.2];
p4.BorderType = "none";

p5 = uipanel(f);
p5.Units = "normalized";
p5.Position = [0.40 0 0.15 0.2];
p5.BorderType = "none";

p6 = uipanel(f);
p6.Units = "normalized";
p6.Position = [0.55 0 0.15 0.2];
p6.BorderType = "none";

p7 = uipanel(f);
p7.Units = "normalized";
p7.Position = [0.70 0 0.15 0.2];
p7.BorderType = "none";

p8 = uipanel(f);
p8.Units = "normalized";
p8.Position = [0.85 0 0.15 0.2];
p8.BorderType = "none";

bg = uibuttongroup(p3);
bg.BorderType = "none";
rb1 = uiradiobutton(bg,"Text","Without Resistance Network");
rb1.Position(1:3) = [10 30 200];
%rb1.VerticalAlignment = "top";
rb2 = uiradiobutton(bg,"Text","With Resistance Network");
rb2.Position(1:3) = [10 10 200];

set(bg,'SelectionChangeFcn',@button_change)

edit_1 = uieditfield(p4,'Value',string(Q_s));
text_1 = uilabel(p4,'Text',"Heat Source (W)");
edit_2 = uieditfield(p5,'Value',string(T_s));
text_2 = uilabel(p5,'Text',"Heat Source Temperature (K)");
edit_3 = uieditfield(p6,'Value',string(T_r));
text_3 = uilabel(p6,'Text',"Heat Rejection Temperature (K)");
edit_4 = uieditfield(p7,'Value',string(T_0));
text_4 = uilabel(p7,'Text',"Ambient Temperature (K)");
edit_5 = uieditfield(p8,'Value',string(S_gen));
text_5 = uilabel(p8,'Text',"Entropy Generation (W/K)");

set(edit_1,'ValueChangedFcn',@edit_1_change)
set(edit_2,'ValueChangedFcn',@edit_2_change)
set(edit_3,'ValueChangedFcn',@edit_3_change)
set(edit_4,'ValueChangedFcn',@edit_4_change)
set(edit_5,'ValueChangedFcn',@edit_5_change)

edit_1.Position(1:4) = [20 20 60 20];
edit_2.Position(1:4) = [20 20 60 20];
edit_3.Position(1:4) = [20 20 60 20];
edit_4.Position(1:4) = [20 20 60 20];
edit_5.Position(1:4) = [20 20 60 20];

text_1.Position(1:4) = [0 50 100 30];
text_2.Position(1:4) = [0 50 100 30];
text_3.Position(1:4) = [0 50 100 30];
text_4.Position(1:4) = [0 50 100 30];
text_5.Position(1:4) = [0 50 100 30];

text_1.WordWrap = "on";
text_2.WordWrap = "on";
text_3.WordWrap = "on";
text_4.WordWrap = "on";
text_5.WordWrap = "on";

text_1.HorizontalAlignment = "center";
text_2.HorizontalAlignment = "center";
text_3.HorizontalAlignment = "center";
text_4.HorizontalAlignment = "center";
text_5.HorizontalAlignment = "center";

function button_change(src,event)
if event.NewValue.Text == "With Resistance Network"
    circuit_plot = "y";
else
    circuit_plot = "n";
end
ax = exergy_flow_tool_v3(Q_s,T_s,T_r,T_0,S_gen,circuit_plot,ax);
end

function edit_1_change(src,event)
Q_s = str2double(event.Value);
ax = exergy_flow_tool_v3(Q_s,T_s,T_r,T_0,S_gen,circuit_plot,ax);
sys_schematic(Q_s,T_s,T_r,T_0,S_gen,ax0)
end

function edit_2_change(src,event)
T_s = str2double(event.Value);
ax = exergy_flow_tool_v3(Q_s,T_s,T_r,T_0,S_gen,circuit_plot,ax);
sys_schematic(Q_s,T_s,T_r,T_0,S_gen,ax0)
end

function edit_3_change(src,event)
T_r = str2double(event.Value);
ax = exergy_flow_tool_v3(Q_s,T_s,T_r,T_0,S_gen,circuit_plot,ax);
sys_schematic(Q_s,T_s,T_r,T_0,S_gen,ax0)
end

function edit_4_change(src,event)
T_0 = str2double(event.Value);
ax = exergy_flow_tool_v3(Q_s,T_s,T_r,T_0,S_gen,circuit_plot,ax);
sys_schematic(Q_s,T_s,T_r,T_0,S_gen,ax0)
end

function edit_5_change(src,event)
S_gen = str2double(event.Value);
ax = exergy_flow_tool_v3(Q_s,T_s,T_r,T_0,S_gen,circuit_plot,ax);
sys_schematic(Q_s,T_s,T_r,T_0,S_gen,ax0)
end

end