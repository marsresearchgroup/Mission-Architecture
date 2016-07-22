function [No_Astronauts,length_No_Astronauts,StayTime,length_StayTime,Efficiency,length_Efficiency] = readin()
data=importdata('master_text.txt')
iterate=input('Would you like to iterate parameters? (yes/no) \n','s');
if strcmp(iterate,'yes')==1
fprintf('Possible Parameters are: No_Astronauts, StayTime, Efficiency\n')
parameter1=input('Which parameter would you like to iterate?\n','s');
end

%number of astronauts
if strcmp(parameter1,'No_Astronauts')==1 
    No_Astronauts=data(1,:);
    for i = 1:length(No_Astronauts)
        if (No_Astronauts(i) < inf) == 0
            No_Astronauts = No_Astronauts(1,[1:i-1]);
            break;
        end
    end
else
    No_Astronauts=data(1,1);
end

%stay time
if strcmp(parameter1,'StayTime')==1 
    StayTime=data(2,:);
    for i = 1:length(StayTime)
        if (StayTime(i) < inf) == 0
            StayTime = StayTime(1,[1:i-1]);
            break;
        end
    end
else
    StayTime=data(2,1);
end

%efficiency
if strcmp(parameter1,'Efficiency')==1 
    Efficiency=data(3,:);
    for i = 1:length(Efficiency)
        if (Efficiency(i) < inf) == 0
            Efficiency = Efficiency(1,[1:i-1]);
            break;
        end
    end
else
    Efficiency=data(3,1);
end
length_No_Astronauts = length(No_Astronauts);
length_StayTime = length(StayTime);
length_Efficiency = length(Efficiency);