%% Parameters
runs        = 1;
epsilon     = 5;
alpha       = 2;
T           = 0.35;
eta         = 0.95;
RE          = 0.00;
gamma_i     = 0.05;
gamma_f     = 1;
pts         = 20;
X           = [5e-3 linspace(gamma_i, gamma_f, pts)];
loss        = 1-X;
%% F wo nPS
tic;
n            = 0; 
YwoT35   = plotFwcnPS( alpha, 1, eta, RE , X, epsilon, runs, n);
% save('YwoT35alpha2PS0.mat', 'YwoT35alpha2PS0' );
close all;
toc;
%% F w nPS
tic;
YwT35        = plotFwc( alpha, T, eta, RE , X, epsilon, runs);
%save('YwT35.mat', 'YwT35' );
close all;
toc;
%% F with Bergmann's recovery
tic;
bergmannYwozps      = plotbergmannFwc(alpha, 1, eta, RE ,X);
bergmannYwzps       = plotbergmannFwc(alpha, T, eta, RE ,X);
toc;
%% Plot Fbergmann v. loss
linewidth   = 1.5;
fontsize1   = 36;
fontsize2   = 44;
set(gcf,'position',[0,0,1120,420]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(loss,plotbergmannFwc(2, 1, .95, 0,X),  '-','Marker','none','MarkerFaceColor','#CC0000','Color','#CC0000','LineWidth',linewidth);
hold on;
plot(loss,plotbergmannFwc(2, .50, .95, 0 ,X),  '-','Marker','none','MarkerFaceColor','#3366CC','Color','#3366CC','LineWidth',linewidth);
plot(loss,plotbergmannFwc(1, 1, .95, 0,X),  '--','Marker','none','MarkerFaceColor','#CC0000','Color','#CC0000','LineWidth',linewidth);
plot(loss,plotbergmannFwc(1, .50, .95, 0 ,X),  '--','Marker','none','MarkerFaceColor','#3366CC','Color','#3366CC','LineWidth',linewidth);
xlabel('${\rm{loss\ rate\ }}(1-\gamma)$'               , 'Interpreter', 'latex')
ylabel('$\mathcal{F}_{\rm{w}}$', 'Interpreter', 'latex')
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
plot(loss,plotbergmannFwc(2, 1, .95, 0,X),  '-','Marker','none','MarkerFaceColor','#CC0000','Color','#CC0000','LineWidth',linewidth);
hold on;
plot(loss,plotbergmannFwc(2, .50, .95, 0 ,X),  '-','Marker','none','MarkerFaceColor','#3366CC','Color','#3366CC','LineWidth',linewidth);
plot(loss,plotbergmannFwc(2, .25, .95, 0 ,X),  '--','Marker','none','MarkerFaceColor','#3366CC','Color','#3366CC','LineWidth',linewidth);
xlabel('${\rm{loss\ rate\ }}(1-\gamma)$'               , 'Interpreter', 'latex')
% ylabel('$\mathcal{F}_{\rm{w}}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize1)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';          
yaxisproperties.TickLabelInterpreter    = 'latex';          
yaxisproperties.Color                   = 'k'; 
title('b','fontsize',fontsize2,'fontname','CMU Sans Serif');
%% Plot F v. loss
linewidth   = 1.5;
fontsize1   = 36;
fontsize2   = 44;
rd          = '#FF1313';
bu          = '#0000FF';
plot(loss,bergmannYwozps,  ':','Marker','.','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
hold on;
plot(loss,bergmannYwzps,  ':','Marker','.','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
plot(loss,YwozpsT35decreasingEpsilon,  '--','Marker','x','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
plot(loss,YwzpsT35decreasingEpsilon,   '--','Marker','x','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
xlabel('${\rm{loss\ rate\ }}(1-\gamma)$'               , 'Interpreter', 'latex')
ylabel('$\mathcal{F}_{\rm{w}}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize1)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';          
yaxisproperties.TickLabelInterpreter    = 'latex';          
yaxisproperties.Color                   = 'k'; 
title('a','fontsize',fontsize2,'fontname','CMU Sans Serif');
%% Plot main-results
linewidth   = 1.5;
fontsize1   = 36;
fontsize2   = 44;
% rd          = '#FF1313';
% bu          = '#0000FF';
rd          = "#CC0000";
bu          = "#3366CC";
set(gcf,'position',[0,0,1120,420]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(loss,bergmannYwozps,  ':','Marker','.','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
hold on;
plot(loss,bergmannYwzps,  ':','Marker','.','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
plot(loss,YwozpsT35decreasingEpsilon,  '--','Marker','x','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
plot(loss,YwzpsT35decreasingEpsilon,   '--','Marker','x','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
xlabel('${\rm{loss\ rate\ }}(1-\gamma)$'               , 'Interpreter', 'latex')
ylabel('$\mathcal{F}_{\rm{w}}$', 'Interpreter', 'latex')
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
T_i     = 0.05;
T_f     = 1;
pts     = 20;
X       = [5e-3 linspace(T_i, T_f, pts)];
%%%
yyaxis left
plot(X, Falpha2eta90gamma90RE0,  ':','Marker','.','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
hold on
plot(X, Falpha2eta90gamma95RE0,  '--','Marker','.','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
plot(X, Falpha2eta95gamma90RE0ZPS,  '-','Marker','.','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
plot(linspace(0,1,100),ones(1,100).*bergmannFwc(alpha,gamma),'-','Color' ,'#949494','linewidth',linewidth)
hold off
xlabel('$T$'         , 'Interpreter', 'latex')
ylabel('$\mathcal{F}_{\rm{w}}^{\rm max}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize1)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties(1).TickLabelInterpreter = 'latex';
yaxisproperties(1).Color                = bu;
%%%
yyaxis right
plot(X, Palpha2eta90gamma90RE0ZPS,  ':','Marker','.','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
hold on
plot(X, Palpha2eta90gamma95RE0ZPS,  '--','Marker','.','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0(:,1),  '-','Marker','.','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
hold off
ylabel('$P_{\rm{s}}$', 'Interpreter', 'latex')
% yticks([0 1e-3 2e-3 3e-3 4e-3])
% yticklabels({ '0' '1' '2' '3' '4'})
yaxisproperties(2).TickLabelInterpreter = 'latex';
yaxisproperties(2).Exponent = -3;
yaxisproperties(2).Color                = rd ;
title('b','fontsize',fontsize2,'fontname','CMU Sans Serif');
%% Plot F v. P
start       = 1;
fontsize    = 34;
linewidth   = 1;
n           = 0; % n-photon subtraction
x1 = YwoT35(start:end);
y1 = plotPsgammanPS(alpha, 1, eta, RE ,X(start:end),n);
x2 = YwT35(start:end);
y2 = plotPsgammanPS(alpha, T, eta, RE ,X(start:end),n);
dx = x2 -x1;
dy = y2 -y1;


quiver(x1,y1,dx,dy,0,'-','Color','#949494','LineWidth',linewidth*0.5,'ShowArrowHead' , 'off' )
hold on;
plot(YwT35(start:end),plotPsTnPS(alpha, T, eta, RE ,X(start:end)), '-','Marker','x','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(YwoT35(start:end),plotPs(alpha, 1, eta, RE ,X(start:end)),  '-','Marker','x','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
hold off;

ylabel('$P_{\rm{s}}(\times 10^{-3})$', 'Interpreter', 'latex')
xlabel('$\mathcal{F}_{\rm{w}}$', 'Interpreter', 'latex')

set(gca,'fontsize',fontsize)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';         
yaxisproperties.TickLabelInterpreter    = 'latex';         
yaxisproperties.Color                   = 'k';              

% yaxisproperties.Exponent = -3;
yticks([0 0.002  0.004 0.006 0.008 0.01 0.012])
yticklabels({ '0' , '2' , '4', '6', '8', '10' '12'})
title('b','fontsize',42,'fontname','CMU Sans Serif');