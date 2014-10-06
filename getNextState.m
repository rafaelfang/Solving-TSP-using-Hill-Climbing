function [ s_next,start,k ] = getNextState( s,totalCityNum )
%random get the next state
%written by Chao Fang
    %get random city swap length, should exclude begining city
    k=randi(totalCityNum-1);
    %k=3;
    index=1:totalCityNum+1;
    start=1+randi(size(s,1)-2-k+1,1,1);
    reversePart=flipud([start:start+k-1]');
    index(start:start+k-1)=reversePart;
    s_next=s(index,:);
    %disp([start,k])
    
    %disp('============================')
%     k=randi(totalCityNum-1);
% first=1+randi(size(s,1)-2-k+1,1,1);
% second=first+k-1;
%     while first==second
%         second=randi(size(s,1),1,1);
%     end
% temp=s(first,:);
% s(first,:)=s(second,:);
% s(second,:)=temp;
% s_next=s;
end

