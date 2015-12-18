---
status: complete
title: BES 2015 workshop examples
---

This page includes code examples used in the BES 2015 Quantitative SIG workshop 'Do you speak Python? An introduction to alternative languages for data analysis'.

##Matlab

All code in this section courtesy of Steven White, Centre for Ecology and Hydrology.

###1. Ricker model

This is a simple example of how to use a for loop and create a plot. The model simulates population growth over time as a function of the number of individuals.

Note `%` used to write comments in Matlab

```
a=2.5; % Parameter values
b=0.1;
Tend=20;
N=zeros(1,Tend);
N(1)=0.2;

for t=1:Tend-1
    N(t+1)=a*N(t)*exp(-b*N(t)); % Iterate Ricker equation
end

plot(1:Tend,N,'LineWidth',2) % Plot the results
xlabel('Generation')
ylabel('Population')
```

###2. Fisher model

```
function Fisher1D
p=0;
x=linspace(-25,25,51);
t=linspace(0,20,21);

sol = pdepe(p,@F1Dpde,@F1Dic,@shi1bc,x,t);
u1 = sol(:,:,1);

figure
surf(x,t,u1)
title('1D Fisher Equation')
xlabel('Distance x')
ylabel('Time t')
zlabel('Population n')

% --------------------------------------------------------------
function [c,diff,reac] = F1Dpde(x,t,u,DuDx) %reaction-diffusion equations
r=1.2; K=1; D=0.5; %parameters
reac=r*u*(1-u/K); %reaction equation
c = 1;  %coefficient of time derivatives, usually just set as 1
diff = D * DuDx;  %diffusion part
% --------------------------------------------------------------
function u0 = F1Dic(x) %initial condition
if (abs(x)>1)
    u0=0;
else
    u0 = 0.5*cos(pi*x/2);
end;
% --------------------------------------------------------------
function [pl,ql,pr,qr] = shi1bc(xl,ul,xr,ur,t)% boundary condition
pl = ul;
ql = 0;
pr = ur;
qr = 0;
```

###3. Simple linear regression

```
load carsmall
x1 = Weight;
x2 = Horsepower;    % Contains NaN data
y = MPG;

X = [ones(size(x1)) x1 x2 x1.*x2]; % Regression 
b = regress(y,X);    % Removes NaN data

scatter3(x1,x2,y,'filled')
hold on
x1fit = min(x1):100:max(x1);
x2fit = min(x2):10:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('Weight')
ylabel('Horsepower')
zlabel('MPG')
view(50,10)
```

###4. Intepreting linear regression output

```
load carsmall % Load the data
X = [Weight,Horsepower,Acceleration];

lm = fitlm(X,MPG,'linear') % Fit linear regression model

anova(lm,'summary') % Do an ANOVA

anova(lm) % Decompose ANOVA table for model terms

coefCI(lm) % 95% CI

coefCI(lm,0.01) % 99% CI

% Test the null hypothesis that all predictor variable coefficients are
% equal to zero versus the alternate hypothesis that at least one of them
% is different from zero
[p,F,d] = coefTest(lm) % Hypothesis test on coefficients

% Perform a hypothesis test on the coefficients of the first and second
% predictor variables.

H = [0 1 0 0; 0 0 1 0];
[p,F,d] = coefTest(lm,H)

```

<br>
<br>

##Python

An iPython notebook with all the code examples is available at https://github.com/BES-QSIG/BES2015.

To open the notebook:

1. Download the .ipynb file to your machine
2. If you don't already have one, download a Python distribution such as Anaconda which allows you to open iPython notebooks
3. Open the notebook application (in the Anaconda distribution this application is called Jupyter Notebook), this will open a browser window
4. In the browser window, navigate to where you saved the .ipynb file and click to open
