function [ X ] = normalize( X )
n=length(X(1,:));
M =[];
M = max(X);
for i=1:n
  %X(:,i)=(X(:,i)-mean((X(:,i))))./std(X(:,i)); %used for assigment 1
   X(:,i)=(X(:,i)/max((X(:,i))));  %used for assigment 2
    end
end

