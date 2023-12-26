%% Gradient ascent with CPTP contrained parametrization of Chois from 10.1103/PhysRevA.84.062125 with constant epsilon
function [F, R , diffRlist, Flist, gradlist]   = gdconA(R, mt, N, epsilon)
% R:        Choi matrix for the recovery
% mt:       matrix that distorts the input qubit due to ZPS
% N:        Choi matrix for the noise channel
% epsilon:  step-size control parameter for the gradient acent
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
displayMsgs         = 0;    % monitor as messages  (yes/no)
displayPlots        = 1;    % monitor as plots     (yes/no)
displaydiffR        = 0;    % monitor plots of (the variation in R) or (gradient of F in A)
epsilonscale        = 0.994;% rescale each subsequent step-size control parameter
markersize          = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
steps           = 1;
maxsteps        = 1000;
%%%%%%%%% construct quantities %%%%%%%%%%%%
[x, F]          = innerOpt(R, mt, N); % minimizing fidelity over x given R
M               = grad(x, mt, N);
%%%%%%%%% find new quantities %%%%%%%%%%%%%
deltaA_t        = deltaA(epsilon, M, R);
IplusZ_t        = IplusZ(deltaA_t, R);
newR            = IplusZ_t'*R*IplusZ_t;
diffF           = obj(x, newR, mt, N) - F ;
diffR           = norm(IplusZ_t'*R*IplusZ_t - R);
GradientInA     = gradA(M, R);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (displayMsgs == 1)
    fprintf('step\t\tF\tdiffR\tnorm(gradA)\n');
    fprintf('----\t\t----\t--------\t---------------\n');
    fprintf('%d\t\t%f\t%f\t%f\n', steps, F, diffR, norm(GradientInA));
end
if (displayPlots == 1)
    diffFlist       = diffF;
    diffRlist       = diffR;
    gradlist        = norm(GradientInA);
    Flist           = F;
    figure;
    set(gcf,'position',[985,179,318,765]);
    [sphX,sphY,sphZ]=sphere;
    samples         = 100;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% maximizing fidelity over R given x
while (steps < maxsteps)
    steps           = steps +1;
    epsilon         = epsilonscale*epsilon;
    if (displayMsgs == 0 && displayPlots == 0)
        fprintf('|');
        if (steps == maxsteps)
            fprintf('\n');
        end
    end
    %%%%%%%%% update old quantities %%%%%%%%%%%
    R               = newR;
    [x, F]          = innerOpt(R, mt, N); %% updating x at each step
    M               = grad(x, mt, N);
    %%%%%%%%% find new quantities %%%%%%%%%%%%%
    deltaA_t        = deltaA(epsilon, M, R);
    IplusZ_t        = IplusZ(deltaA_t, R);
    newR            = IplusZ_t'*R*IplusZ_t;
    diffF           = obj(x, newR, mt, N) - F;
    diffR           = norm(IplusZ_t'*R*IplusZ_t - R);
    GradientInA     = gradA(M, R);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (displayMsgs==1)
        fprintf('%d\t\t%f\t%f\t%f\n',steps, F, diffR, norm(GradientInA));
    end
    if (displayPlots==1)
        diffFlist(end+1)   = diffF;
        diffRlist(end+1)   = diffR;
        gradlist(end+1)    = norm(GradientInA);
        Flist(end+1)       = F;

        X               = 1:steps;

        subplot(4,1,1);
        if (displaydiffR==1)
            y2              = diffRlist;
            plot(X,y2,'Color','k');
            ylabel('$|\!| \delta\mathcal{R}|\!|$', 'Interpreter', 'latex');
        else
            y2              = gradlist;
            plot(X,y2,'Color','k');
            ylabel('$|\!| \delta_{\mathcal{A}}\mathcal{F}|\!|$', 'Interpreter', 'latex');
        end
        title('a','fontsize',16);
        set(gca,'fontsize',10);
        xaxisproperties= get(gca, 'XAxis');
        xaxisproperties.TickLabelInterpreter = 'latex';
        yaxisproperties= get(gca, 'YAxis');
        yaxisproperties.TickLabelInterpreter = 'latex';  
        yaxisproperties.Color = 'k';   

        subplot(4,1,2);
        y4              = Flist;
        plot(X,y4,'Color','k');
        ylabel('$\mathcal{F}$', 'Interpreter', 'latex');
        ylim([0 1]);
        xlabel('steps','Interpreter','latex');
        title('b','fontsize',16);
        set(gca,'fontsize',10);
        xaxisproperties= get(gca, 'XAxis');
        xaxisproperties.TickLabelInterpreter = 'latex'; 
        yaxisproperties= get(gca, 'YAxis');
        yaxisproperties.TickLabelInterpreter = 'latex';   
        yaxisproperties.Color = 'k';   

        rho0X           = zeros(1, samples);
        rho0Y           = zeros(1, samples);
        rho0Z           = zeros(1, samples);
        recpointsX      = zeros(1, samples);
        recpointsY      = zeros(1, samples);
        recpointsZ      = zeros(1, samples);
        for l           = 1:samples
            rhoin=randn(2,1)+1i.*randn(2,1);
            rhoin=rhoin*rhoin';
            rho0tmp=rhoin./trace(rhoin);
            rho0X(l)            = real(trace(Pauli(1)'*rho0tmp));
            rho0Y (l)           = real(trace(Pauli(2)'*rho0tmp));
            rho0Z(l)            = real(trace(Pauli(3)'*rho0tmp));
            rhoZPStmp           = rhot(rho0tmp,    mt); % distorted pure qubit after ideal ZPS
            rhoLosstmp          = rhow(rhoZPStmp,  N);  % mixed state after the loss channel
            rhoRecoveredtmp     = rhox(rhoLosstmp, R);
            recpointsX(l)       = real(trace(Pauli(1)'*rhoRecoveredtmp));
            recpointsY(l)       = real(trace(Pauli(2)'*rhoRecoveredtmp));
            recpointsZ(l)       = real(trace(Pauli(3)'*rhoRecoveredtmp));
        end
        subplot(4,1,[3 4]);
        surf(sphX,sphY,sphZ, 'FaceColor','none', 'EdgeColor' , 'k','EdgeAlpha', 0.05 );
        hold on;
        scatter3(rho0X, rho0Y, rho0Z, markersize,'MarkerEdgeColor' , 'none' , ...
            'MarkerFaceColor' ,'#FF4500', 'MarkerFaceAlpha',0.4);
        scatter3(recpointsX,recpointsY,recpointsZ, markersize,'MarkerEdgeColor' , 'none' , ...
            'MarkerFaceColor' ,'#0045FF', 'MarkerFaceAlpha',0.4);
        hold off;
        xlim([-1 1]);
        ylim([-1 1]);
        zlim([-1 1]);
        axis off;
        daspect([1 1 1]);
        title('c','fontsize',16);
        set(gca,'fontsize',10);
        xaxisproperties= get(gca, 'XAxis');
        xaxisproperties.TickLabelInterpreter = 'latex'; 
        yaxisproperties= get(gca, 'YAxis');
        yaxisproperties.TickLabelInterpreter = 'latex';   
        yaxisproperties.Color = 'k';   
        drawnow;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
R       = newR;
[~, F]  = innerOpt(R, mt, N);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (displayPlots==1)

    X               = 1:steps;

    subplot(4,1,1);
    if (displaydiffR==1)
        y2              = diffRlist;
        plot(X,y2,'Color','k');
        ylabel('$|\!| \delta\mathcal{R}|\!|$', 'Interpreter', 'latex');
    else
        y2              = gradlist;
        plot(X,y2,'Color','k');
        ylabel('$|\!| \delta_{\mathcal{A}}\mathcal{F}|\!|$', 'Interpreter', 'latex');
    end
    title('a','fontsize',16);
    set(gca,'fontsize',10);
    xaxisproperties= get(gca, 'XAxis');
    xaxisproperties.TickLabelInterpreter = 'latex'; 
    yaxisproperties= get(gca, 'YAxis');
    yaxisproperties.TickLabelInterpreter = 'latex';  
    yaxisproperties.Color = 'k';   

    subplot(4,1,2);
    y4              = Flist;
    plot(X,y4,'Color','k');
    ylabel('$\mathcal{F}$', 'Interpreter', 'latex');
    ylim([0 1]);
    xlabel('steps', 'Interpreter','latex');
    title('b','fontsize',16);
    set(gca,'fontsize',10);

    samples         = 10000;
    rho0X           = zeros(1, samples);
    rho0Y           = zeros(1, samples);
    rho0Z           = zeros(1, samples);
    recpointsX      = zeros(1, samples);
    recpointsY      = zeros(1, samples);
    recpointsZ      = zeros(1, samples);
    for l           = 1:samples
        rhoin=randn(2,1)+1i.*randn(2,1);
        rhoin=rhoin*rhoin';
        rho0tmp=rhoin./trace(rhoin);
        rho0X(l)            = real(trace(Pauli(1)'*rho0tmp));
        rho0Y (l)           = real(trace(Pauli(2)'*rho0tmp));
        rho0Z(l)            = real(trace(Pauli(3)'*rho0tmp));
        rhoZPStmp           = rhot(rho0tmp,    mt); % distorted pure qubit after ideal ZPS
        rhoLosstmp          = rhow(rhoZPStmp,  N);  % mixed state after the loss channel
        rhoRecoveredtmp     = rhox(rhoLosstmp, R);
        recpointsX(l)       = real(trace(Pauli(1)'*rhoRecoveredtmp));
        recpointsY(l)       = real(trace(Pauli(2)'*rhoRecoveredtmp));
        recpointsZ(l)       = real(trace(Pauli(3)'*rhoRecoveredtmp));
    end
    subplot(4,1,[3 4]);
    surf(sphX,sphY,sphZ, 'FaceColor','none', 'EdgeColor' , 'k','EdgeAlpha', 0.1 );
    hold on;
    scatter3(rho0X, rho0Y, rho0Z, markersize,'MarkerEdgeColor' , 'none' , ...
        'MarkerFaceColor' ,'#FF4500', 'MarkerFaceAlpha',0.05);
    scatter3(recpointsX,recpointsY,recpointsZ, markersize,'MarkerEdgeColor' , 'none' , ...
        'MarkerFaceColor' ,'#0045FF', 'MarkerFaceAlpha',0.1);
    hold off;
    xlim([-1 1]);
    ylim([-1 1]);
    zlim([-1 1]);
    axis off;
    daspect([1 1 1]);
    title('c','fontsize',16);
    set(gca,'fontsize',10);
    xaxisproperties= get(gca, 'XAxis');
    xaxisproperties.TickLabelInterpreter = 'latex';
    yaxisproperties= get(gca, 'YAxis');
    yaxisproperties.TickLabelInterpreter = 'latex';  
    yaxisproperties.Color = 'k';   
    drawnow;
end
end