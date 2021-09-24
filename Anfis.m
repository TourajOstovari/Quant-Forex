%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Data] = xlsread("C:\Candles\TradeRoom1\EURUSD_M15.csv");
Candle3 = [Data(3:end-2,3) Data(3:end-2,6) Data(3:end-2,4) Data(3:end-2,5) Data(3:end-2,7)];
Candle2 = [Data(2:end-3,3) Data(2:end-3,6) Data(2:end-3,4) Data(2:end-3,5) Data(2:end-3,7)];
Candle1 = [Data(1:end-4,3) Data(1:end-4,6) Data(1:end-4,4) Data(1:end-4,5) Data(1:end-4,7)];
Candle_Current = [Data(4:end-1,3)];
inputx = [Candle3 Candle2 Candle1 Candle_Current];
output = [Data(4:end-1,6)];
inputz = [inputx output];
fismat_EUR = genfis2(inputx,output,0.8);
out_fis = anfis(inputz,fismat_EUR,50)
%[out_put,prediction_percent] = evalfis(fismat,inputx);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Data] = xlsread("C:\Candles\TradeRoom1\XAUUSD_M15.csv");
Candle3 = [Data(3:end-2,3) Data(3:end-2,6) Data(3:end-2,4) Data(3:end-2,5) Data(3:end-2,7)];
Candle2 = [Data(2:end-3,3) Data(2:end-3,6) Data(2:end-3,4) Data(2:end-3,5) Data(2:end-3,7)];
Candle1 = [Data(1:end-4,3) Data(1:end-4,6) Data(1:end-4,4) Data(1:end-4,5) Data(1:end-4,7)];
Candle_Current = [Data(4:end-1,3)];
inputx = [Candle3 Candle2 Candle1 Candle_Current];
output = [Data(4:end-1,6)];
inputz = [inputx output];
fismat_GoLD = genfis2(inputx,output,0.8);
out_fis = anfis(inputz,fismat_GoLD,50)
%[out_put,prediction_percent] = evalfis(fismat,inputx);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Data] = xlsread("C:\Candles\TradeRoom1\GBPUSD_M15.csv");
Candle3 = [Data(3:end-2,3) Data(3:end-2,6) Data(3:end-2,4) Data(3:end-2,5) Data(3:end-2,7)];
Candle2 = [Data(2:end-3,3) Data(2:end-3,6) Data(2:end-3,4) Data(2:end-3,5) Data(2:end-3,7)];
Candle1 = [Data(1:end-4,3) Data(1:end-4,6) Data(1:end-4,4) Data(1:end-4,5) Data(1:end-4,7)];
Candle_Current = [Data(4:end-1,3)];
inputx = [Candle3 Candle2 Candle1 Candle_Current];
output = [Data(4:end-1,6)];
inputz = [inputx output];
fismat_GBP = genfis2(inputx,output,0.8);
out_fis = anfis(inputz,fismat_GBP,50)
%[out_put,prediction_percent] = evalfis(fismat,inputx);