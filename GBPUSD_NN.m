[Data] = xlsread("C:\Candles\TradeRoom1\EURUSD_M5.csv");
inputx1 = [Data(1:end-10,3) Data(1:end-10,5) Data(1:end-10,7) Data(1:end-10,4) Data(1:end-10,6) fftshift([Data(1:end-10,3) Data(1:end-10,5) Data(1:end-10,7) Data(1:end-10,4) Data(1:end-10,6)])];
inputx2 = [Data(2:end-9,3) Data(2:end-9,5) Data(2:end-9,7) Data(2:end-9,4) Data(2:end-9,6) fftshift([Data(2:end-9,3) Data(2:end-9,5) Data(2:end-9,7) Data(2:end-9,4) Data(2:end-9,6)])];
inputx3 = [Data(3:end-8,3) Data(3:end-8,5) Data(3:end-8,7) Data(3:end-8,4) Data(3:end-8,6) fftshift([Data(3:end-8,3) Data(3:end-8,5) Data(3:end-8,7) Data(3:end-8,4) Data(3:end-8,6)])];

inputx4 = [Data(4:end-7,3) Data(4:end-7,5) Data(4:end-7,7) Data(4:end-7,4) Data(4:end-7,6) fftshift([Data(4:end-7,3) Data(4:end-7,5) Data(4:end-7,7) Data(4:end-7,4) Data(4:end-7,6)])];
inputx5 = [Data(5:end-6,3) Data(5:end-6,5) Data(5:end-6,7) Data(5:end-6,4) Data(5:end-6,6) fftshift([Data(5:end-6,3) Data(5:end-6,5) Data(5:end-6,7) Data(5:end-6,4) Data(5:end-6,6)])];
inputx6 = [Data(6:end-5,3) Data(6:end-5,5) Data(6:end-5,7) Data(6:end-5,4) Data(6:end-5,6) fftshift([Data(6:end-5,3) Data(6:end-5,5) Data(6:end-5,7) Data(6:end-5,4) Data(6:end-5,6)])];
inputx7 = [Data(7:end-4,3) Data(7:end-4,5) Data(7:end-4,7) Data(7:end-4,4) Data(7:end-4,6) fftshift([Data(7:end-4,3) Data(7:end-4,5) Data(7:end-4,7) Data(7:end-4,4) Data(7:end-4,6)])];
inputx8 = [Data(8:end-3,3) Data(8:end-3,5) Data(8:end-3,7) Data(8:end-3,4) Data(8:end-3,6) fftshift([Data(8:end-3,3) Data(8:end-3,5) Data(8:end-3,7) Data(8:end-3,4) Data(8:end-3,6)])];
inputx9 = [Data(9:end-2,3) Data(9:end-2,5) Data(9:end-2,7) Data(9:end-2,4) Data(9:end-2,6) fftshift([Data(9:end-2,3) Data(9:end-2,5) Data(9:end-2,7) Data(9:end-2,4) Data(9:end-2,6)])];
inputx10 = [Data(10:end-1,3) Data(10:end-1,5) Data(10:end-1,3) Data(10:end-1,4) Data(10:end-1,6) fftshift([Data(10:end-1,2) Data(10:end-1,5) Data(10:end-1,3) Data(10:end-1,4) Data(10:end-1,6)])];

inputx = [inputx1 inputx2 inputx3 inputx4 inputx5 inputx6 inputx7 inputx8 inputx9 inputx10 Data(11:end,3)];
output = [Data(11:end,6)];

x = inputx';
t = output';

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainbr';  % Bayesian Regularization backpropagation.

% Create a Fitting Network
hiddenLayerSize = [10 5];
net_gbpusd = fitnet(hiddenLayerSize,trainFcn);

% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
net_gbpusd.input.processFcns = {'removeconstantrows','mapminmax'};
net_gbpusd.output.processFcns = {'removeconstantrows','mapminmax'};
net_gbpusd.trainParam.epochs = 60;
% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivision
net_gbpusd.divideFcn = 'dividerand';  % Divide data randomly
net_gbpusd.divideMode = 'sample';  % Divide up every sample
net_gbpusd.divideParam.trainRatio = 10/100;
net_gbpusd.divideParam.valRatio = 45/100;
net_gbpusd.divideParam.testRatio = 45/100;

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net_gbpusd.performFcn = 'mse';  % Mean Squared Error

% Choose Plot Functions
% For a list of all plot functions type: help nnplot
net_gbpusd.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};

% Train the Network
[net_gbpusd,tr] = train(net_gbpusd,x,t);

% Test the Network
y = net_gbpusd(x);
e = gsubtract(t,y);
performance = perform(net_gbpusd,t,y)

% Recalculate Training, Validation and Test Performance
trainTargets = t .* tr.trainMask{1};
valTargets = t .* tr.valMask{1};
testTargets = t .* tr.testMask{1};
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
%figure, plotfit(net_gbpusd,x,t)

% Deployment
% Change the (false) values to (true) to enable the following code blocks.
% See the help for each generation function for more information.
if (false)
    % Generate MATLAB function for neural net_gbpusdwork for application
    % deployment in MATLAB scripts or with MATLAB Compiler and Builder
    % tools, or simply to examine the calculations your trained neural
    % net_gbpusdwork performs.
    genFunction(net_gbpusd,'myNeuralNetworkFunction');
    y = myNeuralNetworkFunction(x);
end
if (false)
    % Generate a matrix-only MATLAB function for neural net_gbpusdwork code
    % generation with MATLAB Coder tools.
    genFunction(net_gbpusd,'myNeuralNetworkFunction','MatrixOnly','yes');
    y = myNeuralNetworkFunction(x);
end
if (false)
    % Generate a Simulink diagram for simulation or deployment with.
    % Simulink Coder tools.
    gensim(net_gbpusd);
end
