function [scoredStates] = loadscoredfile(xlsfile)
    
try
    [numData, stringData] = xlsread('C_TR_1412_eeg17_emg5_KS_k17-Apr-2018');
catch %#ok<*CTCH>
    uiwait(errordlg('Check if the file is saved in Microsoft Excel format.',...
     'ERROR','modal'));
end

%Detect if states are in number or 2-letter format:
if isequal(size(numData,2),3)
    
    scoredStates = numData(:,2:3);
    clear numData stringData
else
    scoredStates = numData(:,2);
    clear numData
    stringData = stringData(3:end,3);
    [stateNumber] = stateLetter2NumberConverter(stringData);
    scoredStates = [scoredStates stateNumber];
    clear stateNumber stringData
end

    