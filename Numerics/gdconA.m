%% Gradient descent with CPTP contrained parametrization of Chois from 10.1103/PhysRevA.84.062125 with constant epsilon
function [F, R , diffRlist, Flist]   = gdconA(R, mt, N, epsilon)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
displayMsgs         = 0;
displayPlots        = 1;
markersize          = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
steps           = 1;
maxsteps        = 1000;
%%%%%%%%% construct quantities %%%%%%%%%%%%
[x, F]          = innerOpt(R, mt, N); % minimizing fidelity over x given R
M               = grad(x, R, mt, N);
%%%%%%%%% find new quantities %%%%%%%%%%%%%
deltaA_t        = deltaA(epsilon, M, R);
IplusZ_t        = IplusZ(deltaA_t, R);
newR            = IplusZ_t'*R*IplusZ_t;
diffF           = obj(x, newR, mt, N) - F ;
diffR           = norm(IplusZ_t'*R*IplusZ_t - R);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (displayMsgs == 1)
    fprintf('step\t\tF\tdiffR\tnorm(deltaA/epsilonT)\n');
    fprintf('----\t\t----\t--------\t---------------\n');
    fprintf('%d\t\t%f\t%f\t%f\n', steps, F, diffR, norm(deltaA_t/epsilon));
end
if (displayPlots == 1)
    diffFlist       = diffF;
    diffRlist       = diffR;
    gradlist        = norm(deltaA_t/epsilon);
    Flist           = F;
    figure;
    set(gcf,'position',[985,179,318,765]);%[985,608,487,336]);
    [sphX,sphY,sphZ]=sphere;
    samples         = 100;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% maximizing fidelity over R given x
while (steps < maxsteps)
    steps           = steps +1;
    if (displayMsgs == 0 && displayPlots == 0)
        fprintf('|'); 
        if (steps == maxsteps)
            fprintf('\n');
        end
    end
    %%%%%%%%% update old quantities %%%%%%%%%%%
    R               = newR;
    [x, F]          = innerOpt(R, mt, N); %% updating x at each step
    M               = grad(x, R, mt, N);
    %%%%%%%%% find new quantities %%%%%%%%%%%%%
    deltaA_t        = deltaA(epsilon, M, R);
    IplusZ_t        = IplusZ(deltaA_t, R);
    newR            = IplusZ_t'*R*IplusZ_t;
    diffF           = obj(x, newR, mt, N) - F;
    diffR           = norm(IplusZ_t'*R*IplusZ_t - R);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (displayMsgs==1)
        fprintf('%d\t\t%f\t%f\t%f\n',steps, F, diffR, norm(deltaA_t*IplusZ_t/epsilon));
    end
    if (displayPlots==1)
        diffFlist(end+1)   = diffF;
        diffRlist(end+1)   = diffR;
        gradlist(end+1)    = norm(deltaA_t/epsilon);
        Flist(end+1)       = F;

        X               = 1:steps;
        %         subplot(4,2,1);
        %         y1              = diffFlist;
        %         plot(X,y1);
        %         ylabel('$\delta \mathcal{F}$', 'Interpreter', 'latex');
        %         set(gca,'fontsize',11);set(gca,'fontname','CMU Sans Serif');

        subplot(4,1,1);
        y2              = diffRlist;
        plot(X,y2,'Color','k');
%         ylabel('$|\!| \mathcal{R}(I+Z)-\mathcal{R} |\!|$', 'Interpreter', 'latex');
        ylabel('$|\!| \delta\mathcal{R}|\!|$', 'Interpreter', 'latex');
        title('a','fontsize',16);
        set(gca,'fontsize',10);
        % set(gca,'fontname','CMU Sans Serif');
        xaxisproperties= get(gca, 'XAxis');
        xaxisproperties.TickLabelInterpreter = 'latex'; % latex for x-axis
        yaxisproperties= get(gca, 'YAxis');
        yaxisproperties.TickLabelInterpreter = 'latex';   % latex for y-axis
        yaxisproperties.Color = 'k';   % latex for y-axis

        %         subplot(4,2,5);
        %         y3              = gradlist;
        %         plot(X,y3);
        %         ylabel('$|\!|\delta A/ \epsilon|\!|$', 'Interpreter', 'latex');
        %         set(gca,'fontsize',11); set(gca,'fontname','CMU Sans Serif');

        subplot(4,1,2);
        y4              = Flist;
        plot(X,y4,'Color','k');
        ylabel('$\mathcal{F}$', 'Interpreter', 'latex');
        ylim([0 1]);
        xlabel('steps','Interpreter','latex');
        title('b','fontsize',16);
        set(gca,'fontsize',10);
        % set(gca,'fontname','CMU Sans Serif');
        xaxisproperties= get(gca, 'XAxis');
        xaxisproperties.TickLabelInterpreter = 'latex'; % latex for x-axis
        yaxisproperties= get(gca, 'YAxis');
        yaxisproperties.TickLabelInterpreter = 'latex';   % latex for y-axis
        yaxisproperties.Color = 'k';   % latex for y-axis

        %         points          = [-1+2*rand(1,samples);2*pi*rand(1,samples)];
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
            %             xtmp                = points(:,l);
            %             rho0tmp             = rhoi2(xtmp);                             % Initial density matrix of the pure qubit state
            rho0X(l)            = real(trace(Pauli(1)'*rho0tmp));
            rho0Y (l)           = real(trace(Pauli(2)'*rho0tmp));
            rho0Z(l)            = real(trace(Pauli(3)'*rho0tmp));
            rhoZPStmp           = rhot(rho0tmp,    mt);                    % Distorted pure qubit after ideal ZPS
            rhoLosstmp          = rhow(rhoZPStmp,  N);                     % Mixed state after the loss channel
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
        % set(gca,'fontname','CMU Sans Serif');
        xaxisproperties= get(gca, 'XAxis');
        xaxisproperties.TickLabelInterpreter = 'latex'; % latex for x-axis
        yaxisproperties= get(gca, 'YAxis');
        yaxisproperties.TickLabelInterpreter = 'latex';   % latex for y-axis
        yaxisproperties.Color = 'k';   % latex for y-axis
        drawnow;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
R       = newR;
[~, F]  = innerOpt(R, mt, N);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (displayPlots==1)

    X               = 1:steps;
    %         subplot(4,2,1);
    %         y1              = diffFlist;
    %         plot(X,y1);
    %         ylabel('$\delta \mathcal{F}$', 'Interpreter', 'latex');
    %         set(gca,'fontsize',11);set(gca,'fontname','CMU Sans Serif');

    subplot(4,1,1);
    y2              = diffRlist;
    plot(X,y2,'Color','k');
    ylabel('$|\!| \delta\mathcal{R}|\!|$', 'Interpreter', 'latex');
    title('a','fontsize',16);
    set(gca,'fontsize',10);
    % set(gca,'fontname','CMU Sans Serif');
    xaxisproperties= get(gca, 'XAxis');
    xaxisproperties.TickLabelInterpreter = 'latex'; % latex for x-axis
    yaxisproperties= get(gca, 'YAxis');
    yaxisproperties.TickLabelInterpreter = 'latex';   % latex for y-axis
    yaxisproperties.Color = 'k';   % latex for y-axis

    %         subplot(4,2,5);
    %         y3              = gradlist;
    %         plot(X,y3);
    %         ylabel('$|\!|\delta A/ \epsilon|\!|$', 'Interpreter', 'latex');
    %         set(gca,'fontsize',11); set(gca,'fontname','CMU Sans Serif');

    subplot(4,1,2);
    y4              = Flist;
    plot(X,y4,'Color','k');
    ylabel('$\mathcal{F}$', 'Interpreter', 'latex');
    ylim([0 1]);
    xlabel('steps', 'Interpreter','latex');
    title('b','fontsize',16);
    set(gca,'fontsize',10);
    % set(gca,'fontname','CMU Sans Serif');

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
        rhoZPStmp           = rhot(rho0tmp,    mt);                    % Distorted pure qubit after ideal ZPS
        rhoLosstmp          = rhow(rhoZPStmp,  N);                     % Mixed state after the loss channel
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
    % set(gca,'fontname','CMU Sans Serif');
    xaxisproperties= get(gca, 'XAxis');
    xaxisproperties.TickLabelInterpreter = 'latex'; % latex for x-axis
    yaxisproperties= get(gca, 'YAxis');
    yaxisproperties.TickLabelInterpreter = 'latex';   % latex for y-axis
    yaxisproperties.Color = 'k';   % latex for y-axis
    drawnow;
end
end