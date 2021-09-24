%clear;
[Data] = xlsread("C:\Candles\TradeRoom1\GBPUSD_M5.csv");
Candle3 = [Data(3:end-2,3) Data(3:end-2,6) Data(3:end-2,4) Data(3:end-2,5) Data(3:end-2,7)];
Candle2 = [Data(2:end-3,3) Data(2:end-3,6) Data(2:end-3,4) Data(2:end-3,5) Data(2:end-3,7)];
Candle1 = [Data(1:end-4,3) Data(1:end-4,6) Data(1:end-4,4) Data(1:end-4,5) Data(1:end-4,7)];
Candle_Current = [Data(4:end-1,3)];
inputx = [Candle3 Candle2 Candle1 Candle_Current];

output = [Data(4:end-1,6)];
X = tonndata(inputx,false,false);
T = tonndata(output,false,false);

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainbr';  % Bayesian Regularization backpropagation.

% Create a Time Delay Network
inputDelays = 0:0;
hiddenLayerSize = [5];
net_gbpusd = timedelaynet(inputDelays,hiddenLayerSize,trainFcn);

% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
net_gbpusd.input.processFcns = {'removeconstantrows','mapminmax'};
net_gbpusd.output.processFcns = {'removeconstantrows','mapminmax'};
net_gbpusd.trainParam.epochs = 150;
% Prepare the Data for Training and Simulation
% The function PREPARETS prepares timeseries data for a particular net_gbpusdwork,
% shifting time by the minimum amount to fill input states and layer
% states. Using PREPARETS allows you to keep your original time series data
% unchanged, while easily customizing it for net_gbpusdworks with differing
% numbers of delays, with open loop or closed loop feedback modes.
[x,xi,ai,t] = preparets(net_gbpusd,X,T);

% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivision
net_gbpusd.divideFcn = 'dividerand';  % Divide data randomly
net_gbpusd.divideMode = 'time';  % Divide up every sample
net_gbpusd.divideParam.trainRatio = 10/100;
net_gbpusd.divideParam.valRatio = 45/100;
net_gbpusd.divideParam.testRatio = 45/100;

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net_gbpusd.performFcn = 'mse';  % Mean Squared Error

% Choose Plot Functions
% For a list of all plot functions type: help nnplot
net_gbpusd.plotFcns = {'plotperform','plottrainstate', 'ploterrhist', ...
    'plotregression', 'plotresponse', 'ploterrcorr', 'plotinerrcorr'};

% Train the Network
[net_gbpusd,tr] = train(net_gbpusd,x,t,xi,ai);

% Test the Network
y = net_gbpusd(x,xi,ai);
e = gsubtract(t,y);
performance = perform(net_gbpusd,t,y)

% Recalculate Training, Validation and Test Performance
trainTargets = gmultiply(t,tr.trainMask);
valTargets = gmultiply(t,tr.valMask);
testTargets = gmultiply(t,tr.testMask);
trainPerformance = perform(net_gbpusd,trainTargets,y)
valPerformance = perform(net_gbpusd,valTargets,y)
testPerformance = perform(net_gbpusd,testTargets,y)

% View the Network
view(net_gbpusd)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotregression(t,y)
%figure, plotresponse(t,y)
%figure, ploterrcorr(e)
%figure, plotinerrcorr(x,e)

% Step-Ahead Prediction Network
% For some applications it helps to get the prediction a timestep early.
% The original net_gbpusdwork returns predicted y(t+1) at the same time it is
% given x(t+1). For some applications such as decision making, it would
% help to have predicted y(t+1) once x(t) is available, but before the
% actual y(t+1) occurs. The net_gbpusdwork can be made to return its output a
% timestep early by removing one delay so that its minimal tap delay is now
% 0 instead of 1. The new net_gbpusdwork returns the same outputs as the original
% net_gbpusdwork, but outputs are shifted left one timestep.
net_gbpusds = removedelay(net_gbpusd);
net_gbpusds.name = [net_gbpusd.name ' - Predict One Step Ahead'];
view(net_gbpusds)
[xs,xis,ais,ts] = preparets(net_gbpusds,X,T);
ys = net_gbpusds(xs,xis,ais);
stepAheadPerformance = perform(net_gbpusds,ts,ys)

% Deployment
% Change the (false) values to (true) to enable the following code blocks.
% See the help for each generation function for more information.
if (false)
    % Generate MATLAB function for neural net_gbpusdwork for application
    % deployment in MATLAB scripts or with MATLAB Compiler and Builder
    % tools, or simply to examine the calculations your trained neural
    % net_gbpusdwork performs.
    genFunction(net_gbpusd,'myNeuralNetworkFunction');
    y = myNeuralNetworkFunction(x,xi,ai);
end
if (false)
    % Generate a matrix-only MATLAB function for neural net_gbpusdwork code
    % generation with MATLAB Coder tools.
    genFunction(net_gbpusd,'myNeuralNetworkFunction','MatrixOnly','yes');
    x1 = cell2mat(x(1,:));
    xi1 = cell2mat(xi(1,:));
    y = myNeuralNetworkFunction(x1,xi1);
end
if (false)
    % Generate a Simulink diagram for simulation or deployment with.
    % Simulink Coder tools.
    gensim(net_gbpusd);
end
