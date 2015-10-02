---
layout: doc
status: complete
title: Introduction to WinBUGs with R
---

WinBUGS is a piece of software developed for Bayesian statistical analysis using Markov Chain Monte Carlo (MCMC). It is useful because it allows you to specify models with much more flexibility than many R packages, but it is more computationally expensive. WinBUGS can be run through R but requires you to write your model in BUGS code, which is saved to a text file then read in when you run the model.Related Bayesian statistics software (OpenBUGS, JAGS) use similar code to WinBUGS. WinBUGS can be downloaded [here](http://www.mrc-bsu.cam.ac.uk/software/bugs/).

###Key features of WinBUGS code

When writing models for WinBUGS there are some key characteristics of WinBUGS code to bear in mind:

1. Models are always written in two parts, one for the distribution of the random part of the model and one with the linear predictor function
2. Vectorisation is not supported so models must loop through observations
3. It is important to ensure correct indexing at each step (e.g. `mu[i]` not `mu`)
4. Variances are expressed as precision (1/variance) normally written as `tau`
5. Calculations must be carried out on separate lines and are not always the same as R e.g. `pow(x,2)` is used instead of `x^2`. If you want to carry out a calculation on a whole vector it must go in a loop.
6. The order of statements is not important i.e. you can use a variable before you define it
7. Stochastic nodes always have twiddles `~`, deterministic nodes always have arrows `<-`

To demonstrate these differences we will run a simple linear model using both standard R functions (`lm`) and WinBUGS.

##Setting up the workspace

The `R2WinBUGS` package allows WinBUGS to be run from R. `mcmcplots` produces some nice plots of the mcmc chain output.

```R
#Import required packages
library(R2WinBUGS)
library(mcmcplots)
```

##Data preparation

In this example we are going to use the inbuilt Iris data. In this case we are going to test whether sepal length is related to petal length.

```R
data(iris)
summary(iris)
#Plot the raw data
plot(iris$Sepal.Length ~ iris$Petal.Length, xlab = "Petal length", ylab="Sepal length")
```

WinBUGS cannot interpret dataframes and therefore it requires each variable to be defined as a separate object.

```R
sepal <- iris$Sepal.Length
petal <- iris$Petal.Length
```

Often you will want to standardise and centre your data at this stage. WinBUGS doesn't work very well if the variables in your model are on different scales so it is usually a good idea to do this at the same time as defining each variable in the workspace e.g. `sepal <- as.numeric(scale(iris$Sepal.Length))`. However, because our example data is on very similar scales we can skip this step.

##Set up the model

If we are using the standard R function `lm` we can now run our model (for now we are ignoring other aspects of the dataset e.g. the Species column):

```R
lm1 <- lm(sepal ~ petal)
summary(lm1)
```

In WinBUGS the code is more complicated as we need to explicitly state the distribution of the model as well as providing priors for each term to be estimated. In our model we are going to assume we have no prior information about the relationship between sepal and petal length and use an uninformative prior for all of our parameters.

It is usually helpful to organise the code into two sections, one describing the model likelihood function and one defining the priors to use. All the code is parceled into a text file.

The first two lines set up the text file (mod1.txt) and begin concatenating the lines to be printed to the file.

```R
sink("mod1.txt")		
cat("
#...
```

The next section sets up the likelihood function of our model. This is similar to the usage of lm except that the model is now specified in two parts: one to define the distribution the response variable comes from and one to show how the mean of that distribution is defined. 

In this case our data come from a normal distribution with mean `mu` and precision `tau` where the mean of the distribution `mu` is defined by an intercept `alpha` and a slope `beta` describing the relationship with petal length.

```R
#...
MODEL LR1 {
	for(i in 1:N) {
    sepal[i] ~ dnorm(mu[i], tau)
	  mu[i] <- alpha + beta*petal[i]
}
#...
```

The next step is to define the priors in the model. Priors are needed for all estimated variables (in this model `tau`, `alpha` and `beta`). As mentioned above, in this example we assume we have no prior information to use so construct uninformative (vague) priors.

For the intercept and slope variables we assume they come from a normal distribution with mean of 0 and small precision (wide variance). 

For the precision variable of our normal distribution `tau` we need to use a prior that constrains it to be positive (negative precision is not possible). To do this we generally convert to variance `sigma` and give `sigma` a uniform prior, in this case between 0 and 10. This means that we assume the variance is equally likely to be any value between 0 and 10.

```R
#...
alpha ~ dnorm(0,0.001)
beta ~ dnorm(0,0.001)

tau <- pow(sigma, -2)
sigma ~ dunif(0,10)	
#...
```

This marks the end of the model so we can finish concatenating the code and sink the model to the text file.

```R
#...
}
", fill = TRUE)
sink()
```


##Define data, parameters, initials and settings

Now that we have written the code for our model we need to prepare the remaining objects required to run the BUGS model. These are:

1. The data we want to pass to the model e.g. our `sepal` and `petal` objects
2. The parameters we want the model to report on
3. Initial values for each parameter
4. The MCMC settings we want to use

###Data

All the variables used in the model need to be provided in a named list. Note this includes the number of observations to loop through `N`; it is better to define N here as limited calculations are supported by WinBUGS

```R
N = length(sepal)
data = list("N","sepal","petal")
```

###Parameters

You also need to define which parameters you want to report on, here we ask WinBUGS to report the intercept and slope (but not `tau`). This flexibility is useful in a large model where you might be estimating tens of parameters without needing to report on them all.

```R
params = c("alpha", "beta")
```

###Initial values

It is also a good idea to define starting values for the MCMC chains of each parameter. This is because although WinBUGS can choose these for you, the choice can sometimes be crucial to model performance so it is a good idea to specify them yourself. This is done via a function which is run for each MCMC chain.

Generally intials are set to random number from a distribution with mean 0 and sd 1 but for variance parameters, which must be postive, these are initialised at 1.

```R
inits <- function () {list(alpha = rnorm(1),
                           beta = rnorm(1),
                           sigma = 1)}
``` 

###MCMC settings

Lastly, we need to define the MCMC settings to hand to WinBUGS. Generally it is a good idea to begin with a small number of samples to test if the model will run before increasing to run the final model.

```R
 nc <- 3      #number of MCMC chains to run
 ni <- 5000  #number of samples for each chain     
 nb <- 1000   #number of samples to discard as burn-in
 nt <- 1      #thinning rate, increase this to reduce autocorrelation
```

## Run the BUGS model

To run the model we supply the bugs function with the data, initials, parameters, model file and MCMC settings defined above. 

Running the model will open up a WinBUGS window, if debug=FALSE this window closes and automatically returns to R when the model has finished running. However, this removes error messages produced by WinBUGS so it is usually advisable to set debug=TRUE and close the WinBUGS window manually after inspection of any error messages.

Note you must specify the directory in which the WinBUGS .exe is stored.

```R
bugs.out <- bugs(data=data, inits=inits, parameters.to.save=params, model.file="mod1.txt", 
 n.chains=nc, n.iter=ni, n.burnin=nb, n.thin=nt, debug=TRUE, DIC=TRUE, bugs.directory = "C:\\Program Files\\WinBUGS14", working.directory=getwd())
```


## Plot and evaluate MCMC output 

The MCMC chains and parameter estimates can be inspected in the WinBUGS window or in R. The WinBUGS window needs to be closed before R can be used again.

The output table can be printed to look at coefficient values and credible intervals

```R
print(bugs.out, digits = 3)
```

The bugs.out object contains not only the parameter estimates but also the MCMC chain values so is quite large. We can save key parts of the output to variables

```R
bugs.summary <- bugs.out$summary
bugs.DIC <- bugs.out$DIC
```

We can also plot the output

```R
plot(bugs.out) # gives a summary plot of coefficients and credible intervals
mcmcplot(bugs.out) # opens up a new window with a set of plots to evaluate mcmc chain convergence
```

We can see that the model has converged well and comparison of the mean values for alpha and beta with our `lm` model output show very similar results.

**Success! Time for a cup of tea** 


##Further reading

Although WinBUGS code is not exactly succinct it is extremely flexible. While it probably isn't worth writing 20 lines of code to replicate the results of `lm`, WinBUGS is a good solution to avoid writing your own likelihood functions in R for complex models. Most distributions are supported and you can even define your own.

For more information on how to specify more complex models Marc Kery and Michael Schaub have written two books on Bayesian analysis in WinBUGS which cover an [introduction to Bayesian statistics and WinBUGS](http://www.mbr-pwrc.usgs.gov/pubanalysis/kerybook/) and a more in depth exploration of [hierachical population models](http://www.vogelwarte.ch/de/projekte/publikationen/bpa/).
















