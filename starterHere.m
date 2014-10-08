% this is the starter which will call number of robots to do hill climbing
close all
clear all
clc
numberOfRobots=5;
minValMat=zeros(numberOfRobots,1);
for i=1:numberOfRobots
    minValMat(i,1)=travellingSalesmanRunner( i );
    
end

[~,minIndex]=min(minValMat);