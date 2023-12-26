%% Plots for success probability for ideal ZPS and ideal teleamp separately
%% Plots for teleamp
linewidth   = 1.5;
fontsize1   = 36;
fontsize2   = 44;
% rd          = '#FF1313';
% bu          = '#0000FF';
rd          = "#CC0000";
bu          = "#3366CC";
pts         = 100;

% for ZPS we are using 0, 1 basis 
xplus01     = [sqrt(0.5) 0];
xminus01    = [sqrt(0.5) pi];
T           = [0.95 0.85 0.50];

% for teleamp we are using +, - basis
xplus       = [1,0];
xminus      = [0,0];
X1          = 1;
X2          = 1;
X3          = 1;
g           = [1.25 2.5];


set(gcf,'position',[0,0,1120,420]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha_i     = 1e-3;
alpha_f     = 3;
X           = [linspace(alpha_i, alpha_f, pts)];
plot(X,plotIdealPsZPS(xplus01, X, T(1)),  '-','Marker','none','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
hold on;
plot(X,plotIdealPsZPS(xminus01, X, T(1)),  '-','Marker','none','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
plot(X,plotIdealPsZPS(xplus01, X, T(2)),  '--','Marker','none','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
plot(X,plotIdealPsZPS(xminus01, X, T(2)),  '--','Marker','none','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
plot(X,plotIdealPsZPS(xplus01, X, T(3)),  '-.','Marker','none','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
plot(X,plotIdealPsZPS(xminus01, X, T(3)),  '-.','Marker','none','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
hold off;
xlabel('$\alpha$'               , 'Interpreter', 'latex')
ylabel('$P_{\rm{s}}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize1)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';          
yaxisproperties.TickLabelInterpreter    = 'latex';          
yaxisproperties.Color                   = 'k'; 
title('a','fontsize',fontsize2,'fontname','CMU Sans Serif');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha_i     = 1e-3;
alpha_f     = 3;
X           = [linspace(alpha_i, alpha_f, pts)];
plot(X,plotIdealPsTeleamp(xplus, X, g(1), X1, X2, X3),  '--','Marker','none','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
hold on;
plot(X,plotIdealPsTeleamp(xminus, X, g(1), X1, X2, X3),  '--','Marker','none','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
plot(X,plotIdealPsTeleamp(xplus, X, g(2), X1, X2, X3),  '-','Marker','none','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
plot(X,plotIdealPsTeleamp(xminus, X, g(2), X1, X2, X3),  '-','Marker','none','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
hold off;
xlabel('$\alpha$'               , 'Interpreter', 'latex')
% ylabel('$P_{\rm{s}}(\times 10^{-3})$', 'Interpreter', 'latex')
% yticks([0 0.004  0.008 0.012])
% yticklabels({ '0' , '4',  '8' '12'})
set(gca,'fontsize',fontsize1)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties.Exponent = -3;
yaxisproperties.TickLabelInterpreter    = 'latex';          
yaxisproperties.Color                   = 'k'; 
title('b','fontsize',fontsize2,'fontname','CMU Sans Serif');