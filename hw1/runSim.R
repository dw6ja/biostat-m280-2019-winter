## parsing command arguments
for (arg in commandArgs(TRUE)) {
  eval(parse(text=arg))
}

# set seed
set.seed(seed)

## check if a given integer is prime
isPrime = function(n) {
  if (n <= 3) {
    return (TRUE)
  }
  if (any((n %% 2:floor(sqrt(n))) == 0)) {
    return (FALSE)
  }
  return (TRUE)
}

## estimate mean only using observation with prime indices
estMeanPrimes = function (x) {
  n = length(x)
  ind = sapply(1:n, isPrime)
  return (mean(x[ind]))
}

# generate data according to argument dist
# we use mean() as the classic sample mean
# the replicate function will simulate data, calculate estMeanPrimes() and mean() for each replication
a <- replicate(rep,c( (if (dist == "gaussian") {
  x = rnorm(n)
} else if (dist == "t1") {
  x = rt(n,1)
} else if (dist == "t5") {
  x = rt(n,5)
}), estMeanPrimes(x),mean(x)))

# the last two rows of a are estMeanPrimes() and mean() respectively
b <- tail(a, 2)

# because the true mean is 0, applying the function we get MSE
sum((b[1,])^2)/rep
sum((b[2,])^2)/rep
