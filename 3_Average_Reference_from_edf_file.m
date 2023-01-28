clear all;
myFolder = 'D:\EEG_Data\tDCS_Pain_Seemen\Data\';
Files_dir =dir(myFolder);
eeglab

for k = 1:(length(Files_dir)-2)
    
    name = strcat(myFolder, Files_dir(k+2).name);
    EEG1 = pop_biosig(name);
    EEG.setname = Files_dir(k+2).name;
    EEG.data = EEG.data(1:38,:);
    EEG.nbchan = 38;
    EEG = pop_chanedit(EEG , 'lookup' , 'E:\\eeglab_current\\eeglab2020_0\\plugins\\dipfit\\standard_BESA\\standard-10-5-cap385.elp' , 'load',{'E:\eeglab_current\eeglab2020_0\sample_locs\Standard-10-10-Cap38.ced' , 'filetype' , 'autodetect'});
    
    mean_val = mean(EEG.data); %(1,data points)

    for ref = 1:EEG.nbchan
        
        EEG.data(ref,:) = EEG.data(ref,:) - mean_val(1,:);
        EEG.ref = 'average';
        
    end
    EEG_Data{k} = EEG;
    new_name = Files_dir(k+2).name;    
    %pop_saveset(EEG, new_name(1: length(new_name)-4), 'D:\EEG_Data\tDCS_Pain\TENS Active\3_Average_Reference_of_Original_Recording');
    pop_saveset(EEG, new_name, 'D:\EEG_Data\tDCS_Pain_Seemen\Extended Data by HU Students\Active TENS\3_Average_Reference_of_Original_Recording');
end
