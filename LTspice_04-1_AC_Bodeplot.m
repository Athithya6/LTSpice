% Bode plot for LTspice Tutorial for Beginners, Ye Zhao
s = tf('s')
C=17.7e-9; R1=90e3;
Grc=1/(s*C)/(R1+1/(s*C));
% figure
figure
opts = bodeoptions; % Set frequency units to Hz in options
opts.FreqUnits = 'Hz';
bodeplot(Grc,opts)
grid on


%% Plot frequency responses
figure(1)
w = {1, 1e8}; %{wmin,wmax}
P = bodeoptions; % Set phase visiblity to off and frequency units to Hz in options
P.FreqUnits = 'Hz'; % Create plot with the options specified by P
P.XLabel.FontSize = 12; % change FontSize
P.YLabel.FontSize = 12; % change FontSize
[mag_Grc, phase_Grc, wout_Grc] = bode(Grc,w,P);
bode(Grc,w,P);
mag_Grc=mag2db(mag_Grc(:));  % in dB
% phase_Grc=phase_Grc(:);
% phase_Grc=phase_Grc-360;     % start from 0 degree to negative
hold on
grid on

% Set title, axes labels, and legend font size
set(findall(gcf,'Type','text'),'FontSize',11)
% Set data line width and color
set(findall(gcf,'Type','line'),'LineWidth',2) %,'Color','blue')
% Set axes tick label font size, color, and line width
set(findall(gcf,'Type','axes'),'FontSize',11,'LineWidth',2,'XColor','black','YColor','black')
legend_mag = legend('Vout/Vin')
set(legend_mag,'FontSize',14);
title('Transfer function of a RC low-pass filter','FontSize',16,'FontWeight','bold')
