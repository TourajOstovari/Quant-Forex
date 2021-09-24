while(true)
    try
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DataPast = xlsread("C:\Candles\TradeRoom1\EURUSD_M15.csv");
CandleInfo = DataPast(end-3:end,:);
C1 = [CandleInfo(1,3) CandleInfo(1,6) CandleInfo(1,4) CandleInfo(1,5) CandleInfo(1,7)];
C2 = [CandleInfo(2,3) CandleInfo(2,6) CandleInfo(2,4) CandleInfo(2,5) CandleInfo(2,7)];
C3 = [CandleInfo(3,3) CandleInfo(3,6) CandleInfo(3,4) CandleInfo(3,5) CandleInfo(3,7)];
[out_put,prediction_percent] = evalfis(fismat_EUR,[C1 C2 C3 CandleInfo(4,3)]);
if(double(CandleInfo(4,3))>out_put)
   sprintf("ANFIS  EURUSD  >>>  Bearish is coming ...%% %.2f", mean(prediction_percent(:)))
   (dlmwrite("ANFIS_EURUSD.txt",['S' 'E' 'L' 'L' '-' num2str(mean(prediction_percent(:)))], 'delimiter',''));
   fclose('all');
end
if(double(CandleInfo(4,3))<out_put)
    sprintf("ANFIS  EURUSD >>> Bullish is coming ...%% %.2f" ,mean(prediction_percent(:)))
    (dlmwrite("ANFIS_EURUSD.txt",['B' 'U' 'Y' '-' num2str(mean(prediction_percent(:)))], 'delimiter',''));
    fclose('all');
end
pause(7)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DataPast = xlsread("C:\Candles\TradeRoom1\GBPUSD_M15.csv");
CandleInfo = DataPast(end-3:end,:);
C1 = [CandleInfo(1,3) CandleInfo(1,6) CandleInfo(1,4) CandleInfo(1,5) CandleInfo(1,7)];
C2 = [CandleInfo(2,3) CandleInfo(2,6) CandleInfo(2,4) CandleInfo(2,5) CandleInfo(2,7)];
C3 = [CandleInfo(3,3) CandleInfo(3,6) CandleInfo(3,4) CandleInfo(3,5) CandleInfo(3,7)];
[out_put,prediction_percent] = evalfis(fismat_GBP,[C1 C2 C3 CandleInfo(4,3)]);
if(double(CandleInfo(4,3))>out_put)
   sprintf("ANFIS GBPUSD  >>>  Bearish is coming ...%% %.2f", mean(prediction_percent(:)))
   (dlmwrite("ANFIS_GBPUSD.txt",['S' 'E' 'L' 'L' '-' num2str(mean(prediction_percent(:)))], 'delimiter',''));
   fclose('all');
end
if(double(CandleInfo(4,3))<out_put)
    sprintf("ANFIS GBPUSD  >>> Bullish is coming ...%% %.2f" ,mean(prediction_percent(:)))
    (dlmwrite("ANFIS_GBPUSD.txt",['B' 'U' 'Y' '-' num2str(mean(prediction_percent(:)))], 'delimiter',''));
    fclose('all');
end
pause(7)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DataPast = xlsread("C:\Candles\TradeRoom1\XAUUSD_M15.csv");
CandleInfo = DataPast(end-3:end,:);
C1 = [CandleInfo(1,3) CandleInfo(1,6) CandleInfo(1,4) CandleInfo(1,5) CandleInfo(1,7)];
C2 = [CandleInfo(2,3) CandleInfo(2,6) CandleInfo(2,4) CandleInfo(2,5) CandleInfo(2,7)];
C3 = [CandleInfo(3,3) CandleInfo(3,6) CandleInfo(3,4) CandleInfo(3,5) CandleInfo(3,7)];
[out_put,prediction_percent] = evalfis(fismat_GoLD,[C1 C2 C3 CandleInfo(4,3)]);
if(double(CandleInfo(4,3))>out_put)
   sprintf("ANFIS GOLD  >>>  Bearish is coming ...%% %.2f", mean(prediction_percent(:)))
   (dlmwrite("ANFIS_GOLD.txt",['S' 'E' 'L' 'L' '-' num2str(mean(prediction_percent(:)))], 'delimiter',''));
   fclose('all');
end
if(double(CandleInfo(4,3))<out_put)
    sprintf("ANFIS GOLD >>> Bullish is coming ...%% %.2f" ,mean(prediction_percent(:)))
    (dlmwrite("ANFIS_GOLD.txt",['B' 'U' 'Y' '-' num2str(mean(prediction_percent(:)))], 'delimiter',''));
    fclose('all');
end
pause(7)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pause(67);
    catch
    end
end