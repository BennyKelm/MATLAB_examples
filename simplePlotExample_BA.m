%% Simple script to plot and export figures
% by Benjamin Kelm, 30.05.2022

%% Generate Data
state = randn(100,3); % State vector
t = linspace(0,10,size(state,1)); % Time vector

%% Labels for y and 
yLab = {'$\Phi_{cmd}$ in $[^{\circ}]$', '$\Theta_{cmd}$ in $[^{\circ}]$', '$\Psi_{cmd}$ in $[^{\circ}]$'};
plotStyle = {'k','--k', '.b',}; % Examples of plotting data

%% Plotting the states each in a subplot
f1 = figure();
for i = 1:3
    subplot(3,1,i) % specify subplot
    plot(t,state(:,i),plotStyle{i}) % Plot data
    set(gca,'XTickLabel',[]); % Inhibit Plotting x-tick-label
    set(gca,'FontSize',9); % Set font-size
    ylabel(yLab{i}, 'fontsize', 10, 'interpreter', 'latex') % specify y-labels
    grid on 
  % hold on % keep plotting on the same figure
end  
hold off

%% Set a Legend
% leg1 = {'$\Phi_{cmd}$ in $[^{\circ}]$', '$\Theta_{cmd}$ in $[^{\circ}]$', '$\Psi_{cmd}$ in $[^{\circ}]$'};
% l2 = legend(leg1);
%set(l2,'Interpreter','latex');

%% X-Label
xlabel('Simulation time $t$ in $[s]$','fontsize',10,'interpreter','latex')

%% Specify size of figure
set(gcf,'units','points','position',[0,0,450,300]); % Größe und Position

%% Export figures
name = 'testExport';
dirExport = 'figExport'; 
status = mkdir(dirExport); % Create folder, if it doesn't exist
filename = [dirExport '/' name]; % file path and name for export

% Save figure in 3 different formats
saveas(gcf,[filename,'.fig']) % MATLAB format
saveas(gca,filename,'epsc') % .eps -> vector
print(gcf,'-dpng','-r300',filename) % PNG