while(true)
    %try
DataPast = xlsread("C:\Candles\TradeRoom1\XAUUSD_M5.csv");
CandleInfo = DataPast(end-3:end,:);
C1 = [CandleInfo(1,3) CandleInfo(1,6) CandleInfo(1,4) CandleInfo(1,5) CandleInfo(1,7)];
C2 = [CandleInfo(2,3) CandleInfo(2,6) CandleInfo(2,4) CandleInfo(2,5) CandleInfo(2,7)];
C3 = [CandleInfo(3,3) CandleInfo(3,6) CandleInfo(3,4) CandleInfo(3,5) CandleInfo(3,7)];

ANS = double(net_xauusd([C1 C2 C3 CandleInfo(4,3)]'));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     inputx1 = [Data(1:end-10,2) Data(1:end-10,5) Data(1:end-10,3) Data(1:end-10,4) Data(1:end-10,6) fftshift([Data(1:end-10,2) Data(1:end-10,5) Data(1:end-10,3) Data(1:end-10,4) Data(1:end-10,6)])];
%     inputx2 = [Data(2:end-9,2) Data(2:end-9,5) Data(2:end-9,3) Data(2:end-9,4) Data(2:end-9,6) fftshift([Data(2:end-9,2) Data(2:end-9,5) Data(2:end-9,3) Data(2:end-9,4) Data(2:end-9,6)])];
%     inputx3 = [Data(3:end-8,2) Data(3:end-8,5) Data(3:end-8,3) Data(3:end-8,4) Data(3:end-8,6) fftshift([Data(3:end-8,2) Data(3:end-8,5) Data(3:end-8,3) Data(3:end-8,4) Data(3:end-8,6)])];
% 
%     inputx4 = [Data(4:end-7,2) Data(4:end-7,5) Data(4:end-7,3) Data(4:end-7,4) Data(4:end-7,6) fftshift([Data(4:end-7,2) Data(4:end-7,5) Data(4:end-7,3) Data(4:end-7,4) Data(4:end-7,6)])];
%     inputx5 = [Data(5:end-6,2) Data(5:end-6,5) Data(5:end-6,3) Data(5:end-6,4) Data(5:end-6,6) fftshift([Data(5:end-6,2) Data(5:end-6,5) Data(5:end-6,3) Data(5:end-6,4) Data(5:end-6,6)])];
%     inputx6 = [Data(6:end-5,2) Data(6:end-5,5) Data(6:end-5,3) Data(6:end-5,4) Data(6:end-5,6) fftshift([Data(6:end-5,2) Data(6:end-5,5) Data(6:end-5,3) Data(6:end-5,4) Data(6:end-5,6)])];
%     inputx7 = [Data(7:end-4,2) Data(7:end-4,5) Data(7:end-4,3) Data(7:end-4,4) Data(7:end-4,6) fftshift([Data(7:end-4,2) Data(7:end-4,5) Data(7:end-4,3) Data(7:end-4,4) Data(7:end-4,6)])];
%     inputx8 = [Data(8:end-3,2) Data(8:end-3,5) Data(8:end-3,3) Data(8:end-3,4) Data(8:end-3,6) fftshift([Data(8:end-3,2) Data(8:end-3,5) Data(8:end-3,3) Data(8:end-3,4) Data(8:end-3,6)])];
%     inputx9 = [Data(9:end-2,2) Data(9:end-2,5) Data(9:end-2,3) Data(9:end-2,4) Data(9:end-2,6) fftshift([Data(9:end-2,2) Data(9:end-2,5) Data(9:end-2,3) Data(9:end-2,4) Data(9:end-2,6)])];
%     inputx10 = [Data(10:end-1,2) Data(10:end-1,5) Data(10:end-1,3) Data(10:end-1,4) Data(10:end-1,6) fftshift([Data(10:end-1,2) Data(10:end-1,5) Data(10:end-1,3) Data(10:end-1,4) Data(10:end-1,6)])];
% 
%     inputx = [inputx1 inputx2 inputx3 inputx4 inputx5 inputx6 inputx7 inputx8 inputx9 inputx10 Data(11:end,2)];
%     output = [Data(11:end,5)];
%     figure(1)
%     plot(double(net_xauusd(inputx'))); hold on
%     title('XAUUSD')
%     plot(output); 
%     legend('NN','Real Price')
%     hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(double(DataPast(end,3))>ANS)
   disp('GOLD >>>  Bearish is coming ...') 
   (dlmwrite("GOLD.txt",['S' 'E' 'L' 'L'], 'delimiter',''));
   fclose('all');
end
if(double(DataPast(end,3))<ANS)
    disp('GOLD  >>> Bullish is coming ...')
    (dlmwrite("GOLD.txt",['B' 'U' 'Y'], 'delimiter',''));
    fclose('all');
end
pause(5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DataPast = xlsread("C:\Candles\TradeRoom1\GBPUSD_M5.csv");
CandleInfo = DataPast(end-3:end,:);
C1 = [CandleInfo(1,3) CandleInfo(1,6) CandleInfo(1,4) CandleInfo(1,5) CandleInfo(1,7)];
C2 = [CandleInfo(2,3) CandleInfo(2,6) CandleInfo(2,4) CandleInfo(2,5) CandleInfo(2,7)];
C3 = [CandleInfo(3,3) CandleInfo(3,6) CandleInfo(3,4) CandleInfo(3,5) CandleInfo(3,7)];

ANS = double(net_gbpusd([C1 C2 C3 CandleInfo(4,3)]'));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     inputx1 = [Data(1:end-10,2) Data(1:end-10,5) Data(1:end-10,3) Data(1:end-10,4) Data(1:end-10,6) fftshift([Data(1:end-10,2) Data(1:end-10,5) Data(1:end-10,3) Data(1:end-10,4) Data(1:end-10,6)])];
%     inputx2 = [Data(2:end-9,2) Data(2:end-9,5) Data(2:end-9,3) Data(2:end-9,4) Data(2:end-9,6) fftshift([Data(2:end-9,2) Data(2:end-9,5) Data(2:end-9,3) Data(2:end-9,4) Data(2:end-9,6)])];
%     inputx3 = [Data(3:end-8,2) Data(3:end-8,5) Data(3:end-8,3) Data(3:end-8,4) Data(3:end-8,6) fftshift([Data(3:end-8,2) Data(3:end-8,5) Data(3:end-8,3) Data(3:end-8,4) Data(3:end-8,6)])];
% 
%     inputx4 = [Data(4:end-7,2) Data(4:end-7,5) Data(4:end-7,3) Data(4:end-7,4) Data(4:end-7,6) fftshift([Data(4:end-7,2) Data(4:end-7,5) Data(4:end-7,3) Data(4:end-7,4) Data(4:end-7,6)])];
%     inputx5 = [Data(5:end-6,2) Data(5:end-6,5) Data(5:end-6,3) Data(5:end-6,4) Data(5:end-6,6) fftshift([Data(5:end-6,2) Data(5:end-6,5) Data(5:end-6,3) Data(5:end-6,4) Data(5:end-6,6)])];
%     inputx6 = [Data(6:end-5,2) Data(6:end-5,5) Data(6:end-5,3) Data(6:end-5,4) Data(6:end-5,6) fftshift([Data(6:end-5,2) Data(6:end-5,5) Data(6:end-5,3) Data(6:end-5,4) Data(6:end-5,6)])];
%     inputx7 = [Data(7:end-4,2) Data(7:end-4,5) Data(7:end-4,3) Data(7:end-4,4) Data(7:end-4,6) fftshift([Data(7:end-4,2) Data(7:end-4,5) Data(7:end-4,3) Data(7:end-4,4) Data(7:end-4,6)])];
%     inputx8 = [Data(8:end-3,2) Data(8:end-3,5) Data(8:end-3,3) Data(8:end-3,4) Data(8:end-3,6) fftshift([Data(8:end-3,2) Data(8:end-3,5) Data(8:end-3,3) Data(8:end-3,4) Data(8:end-3,6)])];
%     inputx9 = [Data(9:end-2,2) Data(9:end-2,5) Data(9:end-2,3) Data(9:end-2,4) Data(9:end-2,6) fftshift([Data(9:end-2,2) Data(9:end-2,5) Data(9:end-2,3) Data(9:end-2,4) Data(9:end-2,6)])];
%     inputx10 = [Data(10:end-1,2) Data(10:end-1,5) Data(10:end-1,3) Data(10:end-1,4) Data(10:end-1,6) fftshift([Data(10:end-1,2) Data(10:end-1,5) Data(10:end-1,3) Data(10:end-1,4) Data(10:end-1,6)])];
% 
%     inputx = [inputx1 inputx2 inputx3 inputx4 inputx5 inputx6 inputx7 inputx8 inputx9 inputx10 Data(11:end,2)];
%     output = [Data(11:end,5)];
%     figure(2)
%     plot(double(net_gbpusd(inputx'))); hold on
%     title('GBPUSD')
%     plot(output); 
%     legend('NN','Real Price')
%     hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(double(DataPast(end,3))>ANS)
   disp('GBPUSD >>>  Bearish is coming ...') 
   (dlmwrite("GBPUSD.txt",['S' 'E' 'L' 'L'], 'delimiter',''));
   fclose('all');
end
if(double(DataPast(end,3))<ANS)
    disp('GBPUSD >>> Bullish is coming ...')
    (dlmwrite("GBPUSD.txt",['B' 'U' 'Y'], 'delimiter',''));
    fclose('all');
end
pause(5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DataPast = xlsread("C:\Candles\TradeRoom1\EURUSD_M5.csv");
CandleInfo = DataPast(end-3:end,:);
C1 = [CandleInfo(1,3) CandleInfo(1,6) CandleInfo(1,4) CandleInfo(1,5) CandleInfo(1,7)];
C2 = [CandleInfo(2,3) CandleInfo(2,6) CandleInfo(2,4) CandleInfo(2,5) CandleInfo(2,7)];
C3 = [CandleInfo(3,3) CandleInfo(3,6) CandleInfo(3,4) CandleInfo(3,5) CandleInfo(3,7)];

ANS = double(net_eurusd([C1 C2 C3 CandleInfo(4,3)]'));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     inputx1 = [Data(1:end-10,2) Data(1:end-10,5) Data(1:end-10,3) Data(1:end-10,4) Data(1:end-10,6) fftshift([Data(1:end-10,2) Data(1:end-10,5) Data(1:end-10,3) Data(1:end-10,4) Data(1:end-10,6)])];
%     inputx2 = [Data(2:end-9,2) Data(2:end-9,5) Data(2:end-9,3) Data(2:end-9,4) Data(2:end-9,6) fftshift([Data(2:end-9,2) Data(2:end-9,5) Data(2:end-9,3) Data(2:end-9,4) Data(2:end-9,6)])];
%     inputx3 = [Data(3:end-8,2) Data(3:end-8,5) Data(3:end-8,3) Data(3:end-8,4) Data(3:end-8,6) fftshift([Data(3:end-8,2) Data(3:end-8,5) Data(3:end-8,3) Data(3:end-8,4) Data(3:end-8,6)])];
% 
%     inputx4 = [Data(4:end-7,2) Data(4:end-7,5) Data(4:end-7,3) Data(4:end-7,4) Data(4:end-7,6) fftshift([Data(4:end-7,2) Data(4:end-7,5) Data(4:end-7,3) Data(4:end-7,4) Data(4:end-7,6)])];
%     inputx5 = [Data(5:end-6,2) Data(5:end-6,5) Data(5:end-6,3) Data(5:end-6,4) Data(5:end-6,6) fftshift([Data(5:end-6,2) Data(5:end-6,5) Data(5:end-6,3) Data(5:end-6,4) Data(5:end-6,6)])];
%     inputx6 = [Data(6:end-5,2) Data(6:end-5,5) Data(6:end-5,3) Data(6:end-5,4) Data(6:end-5,6) fftshift([Data(6:end-5,2) Data(6:end-5,5) Data(6:end-5,3) Data(6:end-5,4) Data(6:end-5,6)])];
%     inputx7 = [Data(7:end-4,2) Data(7:end-4,5) Data(7:end-4,3) Data(7:end-4,4) Data(7:end-4,6) fftshift([Data(7:end-4,2) Data(7:end-4,5) Data(7:end-4,3) Data(7:end-4,4) Data(7:end-4,6)])];
%     inputx8 = [Data(8:end-3,2) Data(8:end-3,5) Data(8:end-3,3) Data(8:end-3,4) Data(8:end-3,6) fftshift([Data(8:end-3,2) Data(8:end-3,5) Data(8:end-3,3) Data(8:end-3,4) Data(8:end-3,6)])];
%     inputx9 = [Data(9:end-2,2) Data(9:end-2,5) Data(9:end-2,3) Data(9:end-2,4) Data(9:end-2,6) fftshift([Data(9:end-2,2) Data(9:end-2,5) Data(9:end-2,3) Data(9:end-2,4) Data(9:end-2,6)])];
%     inputx10 = [Data(10:end-1,2) Data(10:end-1,5) Data(10:end-1,3) Data(10:end-1,4) Data(10:end-1,6) fftshift([Data(10:end-1,2) Data(10:end-1,5) Data(10:end-1,3) Data(10:end-1,4) Data(10:end-1,6)])];
% 
%     inputx = [inputx1 inputx2 inputx3 inputx4 inputx5 inputx6 inputx7 inputx8 inputx9 inputx10 Data(11:end,2)];
%     output = [Data(11:end,5)];
%     figure(3)
%     plot(double(net_eurusd(inputx'))); hold on
%     title('EURUSD')
%     plot(output); 
%     legend('NN','Real Price')
%     hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(double(DataPast(end,3))>ANS)
   disp('EURUSD >>>  Bearish is coming ...') 
   (dlmwrite("EURUSD.txt",['S' 'E' 'L' 'L'], 'delimiter',''));
   fclose('all');
end
if(double(DataPast(end,3))<ANS)
    disp('EURUSD >>> Bullish is coming ...')
    (dlmwrite("EURUSD.txt",['B' 'U' 'Y'], 'delimiter',''));
    fclose('all');
end
pause(60);
clc;
    %catch
    %end
end