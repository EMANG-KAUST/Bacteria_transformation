function [R,C]=predict_transformation(filename, sheet,op)
%% inputs
% filename- the path and name of the file
% sheet- name of the excel sheet
% op- option to predict with the best model (1) or to predict with all the
% models (0)
%% Requirements
% the models must be on the same folder of the function
%% output
% R- The transofmration frequency prediction
% C- The classification fo the transofmration frequency prediction, where 0
% is negative transofrmation and 1 is positive transformation
blind_data = readtable(filename, Sheet=sheet);
blind_data_m = readmatrix(filename, Sheet=sheet);

%% Predict new experiments
 if op==0
     %Load models
    load('RegressionTree_4_05042022.mat')
    load('RegressionBaggedEnsemble_4_05042022.mat')
    load('LME_4_05042022.mat')
    load('RegressionGP_4_05042022.mat')
    load('RegressionNN_4_05042022.mat')
    load('RegressionSVM_4_05042022.mat')
    load('RegressionKernel_4_05042022.mat')
    %Predict transformation frequency
    R(:,1) = predict(Mdl,blind_data_m);
    R(:,2) = predict(lme,blind_data);
    R(:,3) = predict(CVGPRMdl,blind_data_m);
    R(:,4) = predict(CVNetMdl,blind_data_m);
    R(:,5) = predict(CVTreeMdl,blind_data_m);
    R(:,6) = predict(CVSVMMdl,blind_data);
    R(:,7) = predict(CVKernel,blind_data_m);
    %Classify prediction
    C=zeros(size(R,1),size(R,2));
    C(R(:,1)>1.1,1)=1;
    C(R(:,2)>1.1,2)=1;
    C(R(:,3)>1.1,3)=1;
    C(R(:,4)>1.1,4)=1;
    C(R(:,5)>1.1,5)=1;
    C(R(:,6)>1.1,6)=1;
    C(R(:,7)>1.1,7)=1;

 else

    load('RegressionTree_4_05042022.mat')%Load decision tree

    R(:,1) = predict(CVTreeMdl,blind_data_m);%Predict the trasnformation frquency
    %Classify the prediction
    C=zeros(size(R,1),size(R,2));
    C(R(:,1)>1.1,5)=1;

 end


end
