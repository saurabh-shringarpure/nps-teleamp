% Metaparameters
runs        = 1;
epsilon     = 3;
alpha       = 2;
eta         = 0.95;
RE          = 0.00;
gamma       = 0.90;
T_i     = 0.05;
T_f     = 1;
pts     = 20;
X       = [5e-3 linspace(T_i, T_f, pts)];
%% F
tic;
n=4;% This value is an effective 'n' = mod(n+x1+x2+x3-3,4)
Falpha2eta95gamma90RE04PS      = plotFwcTnPS(alpha, eta, RE ,gamma, X, epsilon, runs, n);
save('Falpha2eta95gamma90RE04PS.mat', 'Falpha2eta95gamma90RE04PS' );
close all;
toc;
%% F
tic;
n=5;
Falpha2eta95gamma90RE05PS      = plotFwcTnPS(alpha, eta, RE ,gamma, X, epsilon, runs, n);
save('Falpha2eta95gamma90RE05PS.mat', 'Falpha2eta95gamma90RE05PS' );
close all;
toc;
%% F
tic;
n=6;
Falpha2eta95gamma90RE06PS      = plotFwcTnPS(alpha, eta, RE ,gamma, X, epsilon, runs, n);
save('Falpha2eta95gamma90RE06PS.mat', 'Falpha2eta95gamma90RE06PS' );
close all;
toc;
%% F for different nPS
linewidth = 1;
fontsize = 30;
plot(X, Falpha2eta95gamma90RE0ZPS,  '-','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
hold on
plot(X, Falpha2eta95gamma90RE04PS,  ':','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
plot(X, Falpha2eta95gamma90RE01PS,  '-','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(X, Falpha2eta95gamma90RE05PS,  ':','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
hold off

xlabel('$T$'         , 'Interpreter', 'latex')
ylabel('$\mathcal{F}_{\rm{w}}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties.TickLabelInterpreter = 'latex';
%% P 
n=0;
tic;
Palpha2eta95gamma90RE0ZPS       = plotPsTnPS(alpha, gamma, eta, RE ,X, n);
save('Palpha2eta95gamma90RE0ZPS.mat', 'Palpha2eta95gamma90RE0ZPS' );
toc;
%% P (subs)
tic;
for n=0:3
    disp([n,3]);
    PalphaSqrt2eta95gamma90RE0(:,n+1)       = plotPsTnPS(alpha, gamma, eta, RE ,X, n);
end
% save('PalphaSqrt2eta95gamma90RE0.mat', 'PalphaSqrt2eta95gamma90RE0' );
toc;
%% (alpha =2) P (all PS)
tic;
alpha = 2;
max_n = 10;
Palpha2eta95gamma90RE0allnPS10       = plotPsTallPS(alpha, gamma, eta, RE, X, max_n);
% save('Palpha2eta95gamma90RE0allnPS10.mat', 'Palpha2eta95gamma90RE0allnPS10' );
toc;
%% (alpha = sqrt(2)) P (all PS)
tic;
alpha = sqrt(2);
max_n = 10;
% PalphaSqrt2eta95gamma90RE0allnPS10       = plotPsTallPS(alpha, gamma, eta, RE, X, max_n);
save('PalphaSqrt2eta95gamma90RE0allnPS10.mat', 'PalphaSqrt2eta95gamma90RE0allnPS10' );
toc;
%% (alpha = 2) P (all PS all teleamp)
tic;
alpha = 2;
max_n = 2;
Palpha2eta95gamma90RE0allnPSallteleamp2atmost       = plotPsTallPSallteleamp(alpha, gamma, eta, RE, X, max_n);
save('Palpha2eta95gamma90RE0allnPSallteleamp2atmost.mat', 'Palpha2eta95gamma90RE0allnPSallteleamp2atmost' );
toc;
%% (alpha = sqrt(2)) P (all PS all teleamp)
tic;
alpha = sqrt(2);
max_n = 10;
PalphaSqrt2eta95gamma90RE0allnPSallteleamp10atmost       = plotPsTallPSallteleamp(alpha, gamma, eta, RE, X, max_n);
save('PalphaSqrt2eta95gamma90RE0allnPSallteleamp10atmost.mat', 'PalphaSqrt2eta95gamma90RE0allnPSallteleamp10atmost' );
toc;
%% F and P v. T (varying eta and gamma, fixing alpha=2)
figure;
yyaxis left
linewidth = 1;
fontsize = 34;
plot(X, Falpha2eta90gamma90RE0,  ':','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
hold on
plot(X, Falpha2eta90gamma95RE0,  '--','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(X, Falpha2eta95gamma90RE0ZPS,  '-','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(linspace(0,1,100),ones(1,100).*bergmannFwc(alpha,gamma),'-','Color' ,'#949494','linewidth',linewidth)
hold off

xlabel('$T$'         , 'Interpreter', 'latex')

ylabel('$\mathcal{F}_{\rm{w}}^{\rm max}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties(1).TickLabelInterpreter = 'latex';
yaxisproperties(1).Color                = '#0000FF';

yyaxis right
plot(X, Palpha2eta90gamma90RE0ZPS,  ':','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
hold on
plot(X, Palpha2eta90gamma95RE0ZPS,  '--','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0(:,1),  '-','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
hold off

ylabel('$P_{\rm{s}}$', 'Interpreter', 'latex')
% yticks([0 0.0005 0.001 0.0015 0.002])
% yticklabels({ '0' , '5' , '10', '15', '20'})
yaxisproperties(2).TickLabelInterpreter = 'latex';
yaxisproperties(2).Exponent = -3;
yaxisproperties(2).Color                = '#FF1313' ;
title('b','fontsize',42,'fontname','CMU Sans Serif');
% %% finding optimal T
% linewidth = 1;
% fontsize = 30;
% X           = linspace( T_i, T_f, pts);
% %plot(X, (Falpha2-Falpha2(end))./(Falpha2(1)-Falpha2(end)).*(Palpha2./Palpha2(end)),  ':','Marker','.','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
% hold on
% % plot(X, (Falpha1-Falpha1(end))./(Falpha1(1)-Falpha1(end)).*(Palpha1./Palpha1(end)),  '--','Marker','x','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
% % plot(X, (Feta95-Feta95(end))./(Feta95(1)-Feta95(end)).*(Peta95./Peta95(end)),  '--','Marker','x','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
% plot(X, (Fgamma95-Fgamma95(end))./(Fgamma95(1)-Fgamma95(end)).*(Pgamma95./Pgamma95(end)),  '--','Marker','x','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
% hold off
%
% xlabel('$T$'         , 'Interpreter', 'latex')
% ylabel('$\frac{\mathcal{F}_{\rm{w}}(T)-\mathcal{F}_{\rm{w}}(1)}{\mathcal{F}_{\rm{w}}(0)-\mathcal{F}_{\rm{w}}(1)}\times\frac{P_{\rm{s}}(T)}{P_{\rm{s}}(1)}$', 'Interpreter', 'latex')
% set(gca,'fontsize',fontsize)
% xaxisproperties                         = get(gca, 'XAxis');
% yaxisproperties                         = get(gca, 'YAxis');
% xaxisproperties.TickLabelInterpreter    = 'latex';
% yaxisproperties.TickLabelInterpreter    = 'latex';
% yaxisproperties.Color                   = 'k';
%% (alpha = 2) F an P v. T. Compare nPS
%figure;
alpha       = 2;
yyaxis left
linewidth   = 1;
fontsize    = 34;
plot(X, Falpha2eta95gamma90RE0ZPS,  '-','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
hold on
plot(X, Falpha2eta95gamma90RE01PS,  '--','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(X, Falpha2eta95gamma90RE02PS,  '-.','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(X, Falpha2eta95gamma90RE03PS,  ':','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(linspace(0,1,100),ones(1,100).*bergmannFwc(alpha, gamma),'-','Color' ,'#949494','linewidth',linewidth)
hold off

xlabel('$T$'         , 'Interpreter', 'latex')

ylabel('$\mathcal{F}_{\rm{w}}^{\rm max}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties(1).TickLabelInterpreter = 'latex';
yaxisproperties(1).Color                = '#0000FF';

yyaxis right
plot(X, Palpha2eta95gamma90RE0(:,1),  '-','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
hold on
plot(X, Palpha2eta95gamma90RE0(:,2),  '--','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0(:,3),  '-.','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0(:,4),  ':','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0allnPS10,  '-','Marker','.','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
% plot(X, Palpha2eta95gamma90RE0ALLteleamp,  '--','Marker','.','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
hold off

ylabel('$P_{\rm{s}}$', 'Interpreter', 'latex')
% yticks([0 0.002 0.004 0.006 0.008])
% yticklabels({ '0' '2' '4' '6' '8'})
yaxisproperties(2).TickLabelInterpreter = 'latex';
yaxisproperties(2).Exponent = -3;
yaxisproperties(2).Color                = '#FF1313' ;
title('b','fontsize',42,'fontname','CMU Sans Serif');
%% 2x2 plots
linewidth   = 1;
imgrescale  = 0.50;
fontsize1   = 36*imgrescale;
fontsize2   = 44*imgrescale;
set(gcf,'position',[0,0,1120*imgrescale,840*imgrescale]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1);% (alpha=sqrt(2) F v T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha = sqrt(2);
plot(X, FalphaSqrt2eta95gamma90RE0ZPS,  '-','Marker','.','MarkerFaceColor','#3366CC','Color','#3366CC','LineWidth',linewidth);
hold on
plot(X, FalphaSqrt2eta95gamma90RE01PS,  '--','Marker','.','MarkerFaceColor','#669900','Color','#669900','LineWidth',linewidth);
plot(X, FalphaSqrt2eta95gamma90RE02PS,  '-.','Marker','.','MarkerFaceColor','#FF6600','Color','#FF6600','LineWidth',linewidth);
plot(X, FalphaSqrt2eta95gamma90RE03PS,  ':','Marker','.','MarkerFaceColor','#CC0000','Color','#CC0000','LineWidth',linewidth);
plot(linspace(0,1,100),ones(1,100).*bergmannFwc(alpha, gamma),'-','Color' ,'#949494','linewidth',linewidth)
hold off
% xticklabels([]);
% xlabel('$T$'         , 'Interpreter', 'latex')
ylim([0.8 1]);
% yticks([0.8 0.9 bergmannFwc(alpha, gamma) 1]);
ylabel('$\mathcal{F}_{\rm{w}}^{\rm max}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize1)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties.TickLabelInterpreter    = 'latex';
title('a','fontsize',fontsize2,'fontname','CMU Sans Serif');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2);% (alpha=2) F v T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha = 2;
plot(X, Falpha2eta95gamma90RE0ZPS,  '-','Marker','.','MarkerFaceColor','#3366CC','Color','#3366CC','LineWidth',linewidth);
hold on
plot(X, Falpha2eta95gamma90RE01PS,  '--','Marker','.','MarkerFaceColor','#669900','Color','#669900','LineWidth',linewidth);
plot(X, Falpha2eta95gamma90RE02PS,  '-.','Marker','.','MarkerFaceColor','#FF6600','Color','#FF6600','LineWidth',linewidth);
plot(X, Falpha2eta95gamma90RE03PS,  ':','Marker','.','MarkerFaceColor','#CC0000','Color','#CC0000','LineWidth',linewidth);
plot(linspace(0,1,100),ones(1,100).*bergmannFwc(alpha, gamma),'-','Color' ,'#949494','linewidth',linewidth)
hold off
% xticklabels([]);
% yticklabels([]);
ylim([0.8 1]);
% yticks([0.8 0.9 bergmannFwc(alpha, gamma) 1]);
% xlabel('$T$'         , 'Interpreter', 'latex')
% ylabel('$\mathcal{F}_{\rm{w}}^{\rm max}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize1)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties.TickLabelInterpreter    = 'latex';
title('b','fontsize',fontsize2,'fontname','CMU Sans Serif');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,3);% (alpha=sqrt(2)) P v T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha = sqrt(2);
plot(X, PalphaSqrt2eta95gamma90RE0(:,1),  '-','Marker','.','MarkerFaceColor','#3366CC','Color','#3366CC','LineWidth',linewidth);
hold on
plot(X, PalphaSqrt2eta95gamma90RE0(:,2),  '--','Marker','.','MarkerFaceColor','#669900','Color','#669900','LineWidth',linewidth);
plot(X, PalphaSqrt2eta95gamma90RE0(:,3),  '-.','Marker','.','MarkerFaceColor','#FF6600','Color','#FF6600','LineWidth',linewidth);
plot(X, PalphaSqrt2eta95gamma90RE0(:,4),  ':','Marker','.','MarkerFaceColor','#CC0000','Color','#CC0000','LineWidth',linewidth);
plot(X, PalphaSqrt2eta95gamma90RE0allnPS10 ,  '-','Marker','.','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
hold off
xlabel('$T$'         , 'Interpreter', 'latex')
ylabel('$P_{\rm{s}}$', 'Interpreter', 'latex')
ylim([0 0.0105]);
% yticks([0 0.005 0.010])
% yticklabels({ '0' '5' '10'})
set(gca,'fontsize',fontsize1)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties.Exponent = -3;
yaxisproperties.TickLabelInterpreter    = 'latex';
title('c','fontsize',fontsize2,'fontname','CMU Sans Serif');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4);% (alpha=2) P v T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha = 2;
plot(X, Palpha2eta95gamma90RE0(:,1),  '-','Marker','.','MarkerFaceColor','#3366CC','Color','#3366CC','LineWidth',linewidth);
hold on
plot(X, Palpha2eta95gamma90RE0(:,2),  '--','Marker','.','MarkerFaceColor','#669900','Color','#669900','LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0(:,3),  '-.','Marker','.','MarkerFaceColor','#FF6600','Color','#FF6600','LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0(:,4),  ':','Marker','.','MarkerFaceColor','#CC0000','Color','#CC0000','LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0allnPS10 ,  '-','Marker','.','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
hold off
xlabel('$T$'         , 'Interpreter', 'latex')
% ylabel('$P_{\rm{s}}(\times 10^{-3})$', 'Interpreter', 'latex')
ylim([0 0.0105]);
% yticks([0 0.005 0.010]);
% yticklabels({ '0' '5' '10'})
% yticklabels([]);
set(gca,'fontsize',fontsize1)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties.Exponent = -3;
yaxisproperties.TickLabelInterpreter    = 'latex';
title('d','fontsize',fontsize2,'fontname','CMU Sans Serif');
%% (alpha = 2) P v. T. Compare all nPS and all nPS with all teleamp
%figure;
alpha       = 2;
linewidth   = 1.5;
fontsize    = 30;
rd          = "#CC0000";
bu          = "#3366CC";
grn         = '#008800';
plot(X, Palpha2eta95gamma90RE0allnPS10,  '-','Marker','none','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
hold on
plot(X, Palpha2eta95gamma90RE0allnPS2,  ':','Marker','none','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0allnPSallteleamp2atmost ,  '--','Marker','none','MarkerFaceColor',rd,'Color',rd,'LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0allnPSallteleamp6atmost ,  '-.','Marker','none','MarkerFaceColor',bu,'Color',bu,'LineWidth',linewidth);
plot(X, Palpha2eta95gamma90RE0allnPSallteleamp10atmost ,  ':','Marker','none','MarkerFaceColor',grn,'Color',grn,'LineWidth',linewidth);
hold off
set(gca,'fontsize',fontsize)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties(1).TickLabelInterpreter = 'latex';
xlabel('$T$'         , 'Interpreter', 'latex')
ylabel('$P_{\rm{s}}$', 'Interpreter', 'latex')
yaxisproperties.TickLabelInterpreter = 'latex';
%% (alpha = sqrt(2)) F an P v. T. Compare nPS
alpha       = sqrt(2);
figure;
yyaxis left
linewidth   = 1;
fontsize    = 30;
plot(X, FalphaSqrt2eta95gamma90RE0ZPS,  '-','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
hold on
plot(X, FalphaSqrt2eta95gamma90RE01PS,  '--','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(X, FalphaSqrt2eta95gamma90RE02PS,  '-.','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(X, FalphaSqrt2eta95gamma90RE03PS,  ':','Marker','.','MarkerFaceColor','#0000FF','Color','#0000FF','LineWidth',linewidth);
plot(linspace(0,1,100),ones(1,100).*bergmannFwc(alpha, gamma),'-','Color' ,'#949494','linewidth',linewidth)
hold off

xlabel('$T$'         , 'Interpreter', 'latex')

ylabel('$\mathcal{F}_{\rm{w}}^{\rm max}$', 'Interpreter', 'latex')
set(gca,'fontsize',fontsize)
xaxisproperties                         = get(gca, 'XAxis');
yaxisproperties                         = get(gca, 'YAxis');
xaxisproperties.TickLabelInterpreter    = 'latex';
yaxisproperties(1).TickLabelInterpreter = 'latex';
yaxisproperties(1).Color                = '#0000FF';

yyaxis right
plot(X, PalphaSqrt2eta95gamma90RE0(:,1),  '-','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
hold on
plot(X, PalphaSqrt2eta95gamma90RE0(:,2),  '--','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
plot(X, PalphaSqrt2eta95gamma90RE0(:,3),  '-.','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
plot(X, PalphaSqrt2eta95gamma90RE0(:,4),  ':','Marker','.','MarkerFaceColor','#FF1313','Color','#FF1313','LineWidth',linewidth);
plot(X, PalphaSqrt2eta95gamma90RE0allnPS10 ,  '-','Marker','.','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
% plot(X, PalphaSqrt2eta95gamma90RE0allnPSallteleamp10 ,  '--','Marker','.','MarkerFaceColor','k','Color','k','LineWidth',linewidth);
hold off

ylabel('$P_{\rm{s}}(\times 10^{-3})$', 'Interpreter', 'latex')
% yticks([0 0.002 0.004 0.006 0.008])
% yticklabels({ '0'  '2', '4', '6',  '8'})
yaxisproperties(2).TickLabelInterpreter = 'latex';
yaxisproperties(2).Exponent             = -3;
yaxisproperties(2).Color                = '#FF1313' ;
title('a','fontsize',42,'fontname','CMU Sans Serif');