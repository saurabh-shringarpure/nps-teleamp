% Metaparameters
epsilon     = 1;
alpha       = 2;
eta         = 0.90;
RE          = 0.01;
gamma       = 0.90;
T_i         = 1e-2;
T_f         = 1;
pts         = 21;
%%
tic;
FwzpsT       = plotFwcT( alpha, T_i, T_f, eta, RE , gamma,  pts, epsilon);
% save('FwzpsALPHA2--ETA90--GAMMA90--T1E-2-1.mat', 'FwzpsT' );
close all;
toc;
%% Fidelity versus T
linewidth = 1.5;
X           = linspace( T_i, T_f, pts);
plot(X, FwzpsT,  '--','Marker','x','MarkerFaceColor','#212122','Color','#212122','LineWidth',linewidth);

xlabel('$T$'         , 'Interpreter', 'latex')
ylabel('$\mathcal{F}_{\rm{w}}$', 'Interpreter', 'latex')
set(gca,'fontsize',18)
xaxisproperties= get(gca, 'XAxis');
xaxisproperties.TickLabelInterpreter = 'latex'; % latex for x-axis
yaxisproperties= get(gca, 'YAxis');
yaxisproperties.TickLabelInterpreter = 'latex';   % latex for y-axis
%%
linewidth = 1.5;
X            = linspace( T_i, T_f, pts);
Palpha2      = plotPsT(alpha, gamma, eta, RE , X);
% save('PsALPHA2--ETA90--GAMMA95.mat', 'Pgamma95' );
%% Success probability versus T
xlim([0,1]);
plot(X, PswzpsT,  ':','Marker','o','MarkerFaceColor','#212122','Color','#212122','LineWidth',linewidth);

xlabel('$T$'         , 'Interpreter', 'latex')
ylabel('$P_{\rm{s}}$', 'Interpreter', 'latex')
set(gca,'fontsize',18)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';         
yaxisproperties.TickLabelInterpreter    = 'latex';        
%% Fidelity and success probability versus T

yyaxis left
linewidth = 1;
fontsize = 22;
X           = linspace( T_i, T_f, pts);
plot(X, Falpha2,  ':','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
hold on
% plot(X, Falpha1,  '--','Marker','x','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(X, Feta95,  '--','Marker','x','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
% plot(X, Fgamma95,  ':','Marker','x','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
hold off

xlabel('$T$'         , 'Interpreter', 'latex')

ylabel('$\mathcal{F}_{\rm{w}}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';     
yaxisproperties(1).TickLabelInterpreter = 'latex';         
yaxisproperties(1).Color                = '#0000FF';        

yyaxis right
plot(X, Palpha2,  ':','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
hold on
% plot(X, Palpha1,  '--','Marker','x','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
plot(X, Peta95,  '--','Marker','x','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
% plot(X, Pgamma95,  ':','Marker','x','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
hold off

ylabel('$P_{\rm{s}}(\times 10^{-3})$', 'Interpreter', 'latex')
yticks([0 0.001  0.002 0.003 0.004])
yticklabels({ '0' , '1' , '2', '3', '4'})  
yaxisproperties(2).TickLabelInterpreter = 'latex';  
yaxisproperties(2).Color                = '#FF1313' ;   
%% Finding optimal T
linewidth = 1;
fontsize = 22;
X           = linspace( T_i, T_f, pts);
plot(X, (Falpha2-Falpha2(end))./(Falpha2(1)-Falpha2(end)).*(Palpha2./Palpha2(end)),  ':','Marker','.','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
hold on
% plot(X, (Falpha1-Falpha1(end))./(Falpha1(1)-Falpha1(end)).*(Palpha1./Palpha1(end)),  '--','Marker','x','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
% plot(X, (Feta95-Feta95(end))./(Feta95(1)-Feta95(end)).*(Peta95./Peta95(end)),  '--','Marker','x','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
plot(X, (Fgamma95-Fgamma95(end))./(Fgamma95(1)-Fgamma95(end)).*(Pgamma95./Pgamma95(end)),  '--','Marker','x','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
hold off

xlabel('$T$'         , 'Interpreter', 'latex')
ylabel('$\frac{\mathcal{F}_{\rm{w}}(T)-\mathcal{F}_{\rm{w}}(1)}{\mathcal{F}_{\rm{w}}(0)-\mathcal{F}_{\rm{w}}(1)}\times\frac{P_{\rm{s}}(T)}{P_{\rm{s}}(1)}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';     
yaxisproperties.TickLabelInterpreter    = 'latex';     
yaxisproperties.Color                   = 'k';   