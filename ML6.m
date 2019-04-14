clc
x1 = bedrooms(:,1);
x2 = bathrooms(:,1);
x3 = sqft_living(:,1);
x4 = sqft_lot(:,1);
x5= floors(:,1);
x6 = waterfront(:,1);
x7 = view(:,1);
x8 = condition(:,1);
x9 = grade(:,1);
x10 = sqft_above(:,1);
x11 = sqft_basement(:,1);
x12 = yr_built(:,1);
x13 = yr_renovated(:,1);
x14 = zipcode(:,1);
x15 = lat(:,1);
x16 = long(:,1);
x17 = sqft_living15(:,1);
x18 = sqft_lot15(:,1);

x=[x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18];
[n m]=size(x)

Corr_x = corr(x);
x_cov=cov(x);

%normalization
x = normalize(x);
[U S V] =  svd(x_cov);
D = diag(S)
lambda =1;
k=1;

for i=1:n
    k=i;
    lambda = 1-((sum(D(1:i,:)))/sum(D))
    if(lambda <0.001)
        break;
    end
end
k
R=U(:,1:k)'*x';
size(R);
size(U(:,1:k));
approx = U(:,1:k)*R;  %calculating the approximate value
size(approx)
error = (1/m)*(sum(approx(1:k,:)'-R'))

% linear regression 
iteration =10000;
alpha =0.01;
m=length(approx)
Y = price (:,1)./mean(price(:,1));
size(Y(m))
size(Y)
app = approx';
R=R';
theta = zeros(length(R(1,:)),1);
[theta,Jvect] =  Gradient(R,Y,theta,alpha,iteration); 
errorReg = costfunction(R,Y,theta)






