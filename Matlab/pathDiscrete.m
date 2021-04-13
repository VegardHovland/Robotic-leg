function [thetaDiscrete, timeLine] = pathDiscrete(thetaFuncs,timeLim, n)
%PATH Summary of this function goes here
%   Detailed explanation goes here
    
    m = length(timeLim);

    time{1} = 0:n:timeLim(1);
    for i = 2:m
        time{i} = time{i-1}(end):n:time{i-1}(end)+timeLim(i);
    end
    
    for i = 1:length(time)
        for j = 1:length(time{i})
            t = time{i}(j);
            thetaPath{i}(:,j) = subs(thetaFuncs(:,i));
        end
    end
    
    thetaDiscrete = thetaPath{1};
    timeLine = time{1};
    for i = 2:length(thetaPath)
        thetaDiscrete = [thetaDiscrete thetaPath{i}];
        timeLine = [timeLine time{i}];
    end
end

