clear all;
myFolder = 'D:\EEG_Data\tDCS_Pain_Seemen\Extended Data by HU Students\Active TENS\1_Corrected_with_surrounding_AVG_&_A1A2\';
Files_dir =dir(fullfile(myFolder,'*.set'));

for k = 1:(length(Files_dir))
    name = strcat(myFolder, Files_dir(k).name);
    EEG = pop_loadset(name);   
    
    mean_val = mean(EEG.data); %(1,data points)

    for ref = 1:EEG.nbchan
        
        EEG.data(ref,:) = EEG.data(ref,:) - mean_val(1,:);
        EEG.ref = 'average';
        
    end
    EEG_Data{k} = EEG;
    
    pop_saveset(EEG, EEG.filename, 'D:\EEG_Data\tDCS_Pain_Seemen\Extended Data by HU Students\Active TENS\2_Average_Reference of 1');
end

