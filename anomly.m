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

H=[x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18];
[n m]=size(H)

Mean = mean(H);
x_st = std(H);
sigma = cov(H);

% for i=1:n
%     h = ((2*pi).^(m/2)) * (det(sigma).^0.5)
%     y = (-0.5)*((H(i,:)-Mean)'*((H(i,:)-Mean)/sigma))
%     probX(i) = (1/h)*exp(y)
% end


Pdf = mvnpdf(H,Mean,sigma);
size(Pdf)

eps = max(Pdf)*0.001
anom = ones(n,1)

for i=1:n
    if(Pdf(i)<eps)
        anom(i)=0;
    end
end
n-sum(anom)
