close all
clear all
clc

%this is the runner function of travelling salesman problem using random hill
%climbing
%written by Chao Fang
%rng(1);
%initalily select swap city string length to be seven


%choice==1-fifteen cities
%choice==2-fifty seven cities
[coords,D,totalCityNum]=prepareDataSet(2);
cityID=1:size(coords,1);

%start with any tour, e.g in input order
%assign cityID to each coordinates
s=[cityID', coords];

%attach the begining city to the end of starting sequence.
s=[s;s(1,:)];

%disp('initial string of city ID with their coords:')
%disp(s)
max_evaluations=5000;
figure;
subplot(2,2,1);
plot(s(:,2),s(:,3));
title('initial routine')
xlabel('x-axis')
ylabel('y-axis')

%record initial tour as best so far
minCost=cost(s,D);
minTour=s;
candidateNum=3;

num_evaluations=1;
minCostArray=zeros(max_evaluations,1);
while (num_evaluations<max_evaluations+1)
    
   
    candidate=zeros(size(s,1),size(s,2),candidateNum);
    candidateCost=zeros(1,candidateNum);
    for t=1:candidateNum
        candidate(:,:,t)=getNextState(s,totalCityNum);
        candidateCost(1,t)=cost(candidate(:,:,t),D);
    end
    [minVal,minIndex]=min(candidateCost);
    
    if minVal<cost(s,D)
        s=candidate(:,:,minIndex);
    end
    minCostArray(num_evaluations,1)=minVal;
    num_evaluations=num_evaluations+1;
    %disp(s)
end

% while (num_evaluations<max_evaluations+1)
%     s_next=getNextState(s,totalCityNum);
%     if cost(s_next,D)<cost(s,D)
%         s=s_next;
%     end
%     minCostArray(num_evaluations,1)=cost(s_next,D);
%     num_evaluations=num_evaluations+1;
% end
%disp('after # of iteration:')
%disp(num_evaluations-1);
subplot(2,2,2)
plot(1:max_evaluations,minCostArray,'Color',[0,0.7,0.9])
title('Iteration vs Cost Plot')
xlabel('Iteration')
ylabel('Cost value')

% disp('final string of city ID with their coords:')
% disp(s)
subplot(2,2,3);
plot(s(:,2),s(:,3));
title('final routine')
xlabel('x-axis')
ylabel('y-axis')