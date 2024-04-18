close all
clc
clear

%L2=24;
%load(['GSR' num2str(L2) '.mat'])
load('data_vessel.mat')

%rangeTr = 1:6000;
%rangeVal = 6001:7000;
%rangeTs = 7001:9910;

rangeTr = 1:2500;
rangeVal = 2501:3000;
rangeTs = 3001:4366;

Xtr=data(rangeTr,1:2);
Ytr=data(rangeTr,3);


Xval=data(rangeVal,1:2);
Yval=data(rangeVal,3);

Xts=data(rangeTs,1:2);
Yts=data(rangeTs,3);


netModel = fitrtree(Xtr,Ytr);

%%
YtrOut = (predict(netModel,Xtr));

TrMse=mse(YtrOut,Ytr);
TrNmse=nmse(YtrOut,Ytr);
TrRmse=rmse(YtrOut,Ytr)
TrNrmse=nrmse(YtrOut,Ytr);
TrMae=mae(YtrOut,Ytr);
TrMbe=mbe(YtrOut,Ytr);
TrRsquare=rsquare(YtrOut,Ytr)

YvalOut = max(0,predict(netModel,Xval));

ValMse=mse(YvalOut,Yval);
ValNmse=nmse(YvalOut,Yval);
ValRmse=rmse(YvalOut,Yval)
ValNrmse=nrmse(YvalOut,Yval);
ValMae=mae(YvalOut,Yval);
ValMbe=mbe(YvalOut,Yval);
ValRsquare=rsquare(YvalOut,Yval)


YtsOut = max(0,predict(netModel,Xts));
TsMse=mse(YtsOut,Yts);
TsNmse=nmse(YtsOut,Yts);
TsRmse=rmse(YtsOut,Yts)
TsNrmse=nrmse(YtsOut,Yts);
TsMae=mae(YtsOut,Yts);
TsMbe=mbe(YtsOut,Yts);
TsRsquare=rsquare(YtsOut,Yts)



rang2=(1:100)+0;
plot(rang2,[Yts(rang2,1) YtsOut(rang2,1) ])
ylabel('Temperature (C)')
xlabel('Minute')
grid
legend('Actual','Estimated','Location','northwest')


figure
%rang2=(1:200)+400;

%plot(Yts(rang2),YtsOut(rang2), 'b*')
plot(Yts,YtsOut, 'r*')

ylabel('Actual (C)')
xlabel('Predicted (C)')
xlim([29.9,30.5])
ylim([29.9,30.5])
text(30.1,30.3,0,strcat("R^2=",num2str(TsRsquare*100),"%"),'Color','k')
grid