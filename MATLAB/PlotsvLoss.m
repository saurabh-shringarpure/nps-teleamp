%% Parameters
epsilon     = 1;
alpha       = 2;
T           = 0.5;
eta         = 0.90;
RE          = 0.01;
%% 
gamma_i     = 0.05;
gamma_f     = 1;
pts         = 20;
X           = [5e-3 linspace(gamma_i, gamma_f, pts)];
loss        = 1-X;
%% Optimal fidelity without ZPS
tic;
Ywozps       = plotFwc( alpha, 1, eta, RE , X, epsilon);
% save('YwozpsETA.mat', 'Ywozps' );
close all;
toc;
%% Optimal fidelity with ZPS
tic;
Ywzps        = plotFwc( alpha, T, eta, RE , X, epsilon);
% save('YwzpsETA.mat', 'Ywzps' );
close all;
toc;
%% Calculating fidelity with Bergmann's recovery
tic;
bergmannYwozps      = plotbergmannFwc(alpha, 1, eta, RE ,X);
bergmannYwzps       = plotbergmannFwc(alpha, T, eta, RE ,X);
toc;
% save("bergmannYwozps.mat","bergmannYwozps");
% save("bergmannYwzps.mat","bergmannYwzps");
%% Fidelity versus loss rate
fontsize    = 20;
linewidth   = 1.5;
plot(loss,bergmannYwozps,  ':','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
hold on;
plot(loss,bergmannYwzps,  ':','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(loss,Ywozps,  '--','Marker','x','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
plot(loss,Ywzps,   '--','Marker','x','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
xlabel('${\rm{loss\ rate\ }}(1-\gamma)$'               , 'Interpreter', 'latex')
ylabel('$\mathcal{F}_{\rm{w}}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';          
yaxisproperties.TickLabelInterpreter    = 'latex';          
yaxisproperties.Color                   = 'k';              
%% Fidelity versus success probability
start       = 19;
fontsize    = 22;
linewidth   = 1;

x1 = Ywozps(start:end);
y1 = plotPs(alpha, 1, eta, RE ,X(start:end));
x2 = Ywzps(start:end);
y2 = plotPs(alpha, T, eta, RE ,X(start:end));
dx = x2 -x1;
dy = y2 -y1;


quiver(x1,y1,dx,dy,0,'-','Color','#949494','LineWidth',linewidth*0.5,'ShowArrowHead' , 'off' )
hold on;
plot(Ywzps(start:end),plotPs(alpha, T, eta, RE ,X(start:end)), '-','Marker','x','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(Ywozps(start:end),plotPs(alpha, 1, eta, RE ,X(start:end)),  '-','Marker','x','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
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
yticks([0 0.002  0.004 0.006 0.008 0.01])
yticklabels({ '0' , '2' , '4', '6', '8', '10' })
