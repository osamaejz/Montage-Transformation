clear all;
myFolder = 'D:\EEG_Data\tDCS_Pain_Seemen\Extended Data by HU Students\Data\';
Files_dir =dir(myFolder);
EEG.etc.eeglabvers = '2020.0'; % this tracks which version of EEGLAB is being used, you may ignore it

Fz = 6;
F3 = 5;
F4 = 7; 
Fpz = 2;
arr = [Fpz, F3, Fz, F4]; 

%EEG_data = {}
for k = 85:(length(Files_dir)-2)
    data = [];
    name = strcat(myFolder, Files_dir(k+2).name);
    EEG = pop_biosig(name);
    EEG.setname = Files_dir(k+2).name;
    
    %adding average of surrounding channels of GND (AFz)
    for g = 1:4

        dat(g,:) = EEG.data(arr(g),:);

    end
    
    datm = mean(dat);
    
    for i = 1:38

        EEG.data(i,:) =  EEG.data(i,:) + datm(1,:);

    end
    datm = [];
    dat = [];
            
    %Subtracting reference value to make A1 and A2 as reference from data
    %already referenced at GND
    
    data(1,:) = EEG.data(1,:) - EEG.data(39,:);
    data(2,:) = EEG.data(2,:) - EEG.data(39,:);
    data(3,:) = EEG.data(3,:) - EEG.data(40,:);
    data(4,:) = EEG.data(4,:) - EEG.data(39,:);
    data(5,:) = EEG.data(5,:) - EEG.data(39,:);
    data(6,:) = EEG.data(6,:) - EEG.data(39,:);
    data(7,:) = EEG.data(7,:) - EEG.data(40,:);
    data(8,:) = EEG.data(8,:) - EEG.data(40,:);
    data(9,:) = EEG.data(9,:) - EEG.data(39,:);
    data(10,:) = EEG.data(10,:) - EEG.data(39,:);
    data(11,:) = EEG.data(11,:) - EEG.data(39,:);
    data(12,:) = EEG.data(12,:) - EEG.data(40,:);
    data(13,:) = EEG.data(13,:) - EEG.data(40,:);
    data(14,:) = EEG.data(14,:) - EEG.data(39,:);
    data(15,:) = EEG.data(15,:) - EEG.data(39,:);
    data(16,:) = EEG.data(16,:) - EEG.data(40,:);
    data(17,:) = EEG.data(17,:) - EEG.data(40,:);
    data(18,:) = EEG.data(18,:) - EEG.data(40,:);
    data(19,:) = EEG.data(19,:) - EEG.data(39,:);
    data(20,:) = EEG.data(20,:) - EEG.data(39,:);
    data(21,:) = EEG.data(21,:) - EEG.data(40,:);
    data(22,:) = EEG.data(22,:) - EEG.data(40,:);
    data(23,:) = EEG.data(23,:) - EEG.data(40,:);
    data(24,:) = EEG.data(24,:) - EEG.data(39,:);
    data(25,:) = EEG.data(25,:) - EEG.data(39,:);
    data(26,:) = EEG.data(26,:) - EEG.data(40,:);
    data(27,:) = EEG.data(27,:) - EEG.data(40,:);
    data(28,:) = EEG.data(28,:) - EEG.data(40,:);
    data(29,:) = EEG.data(29,:) - EEG.data(39,:);
    data(30,:) = EEG.data(30,:) - EEG.data(40,:);
    data(31,:) = EEG.data(31,:) - EEG.data(40,:);
    data(32,:) = EEG.data(32,:) - EEG.data(40,:);
    data(33,:) = EEG.data(33,:) - EEG.data(39,:);
    data(34,:) = EEG.data(34,:) - EEG.data(39,:);
    data(35,:) = EEG.data(35,:) - EEG.data(40,:);
    data(36,:) = EEG.data(36,:) - EEG.data(40,:); 
    data(37,:) = EEG.data(37,:) - EEG.data(40,:);
    data(38,:) = EEG.data(38,:) - EEG.data(39,:);
    
    EEG.data = data;
    EEG.nbchan = 38;
    EEG = pop_chanedit(EEG , 'lookup' , 'E:\\eeglab_current\\eeglab2020_0\\plugins\\dipfit\\standard_BESA\\standard-10-5-cap385.elp' , 'load',{'E:\eeglab_current\eeglab2020_0\sample_locs\Standard-10-10-Cap38.ced' , 'filetype' , 'autodetect'});
    EEG_Data{k} = EEG;
    new_name = Files_dir(k+2).name;    
    %pop_saveset(EEG, new_name(1: length(new_name)-4), 'D:\EEG_Data\tDCS_Pain_Seemen\Extended Data by HU Students\Anodal tDCS\1_Corrected_with_surrounding_AVG_&_A1A2');

    pop_saveset(EEG, new_name, 'D:\EEG_Data\tDCS_Pain_Seemen\Extended Data by HU Students\Active TENS\1_Corrected_with_surrounding_AVG_&_A1A2');
end

