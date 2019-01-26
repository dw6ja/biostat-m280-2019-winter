#collect the result that's generated in autoSim.R
result <- c() #store the output of the test results
N <- c() #store the value of n
i <- 1
nVals <- seq(100, 1000, by=100)
for (dist in c("gaussian", "t1", "t5")) {
  for (n in nVals) {
    oFile <- paste("/home/wudiyangabc/biostat-m280-2019-winter/hw1/", "n", n, 
                   "dist", dist, ".txt", sep="")
    a <- read.table(file=oFile) #read output from the tests
    temp_result <- a[, 2] # store the output of the test result of each simulation
    result <- c(result, temp_result) # all output of txt file
    N = c(N, rep(n,2))
  }
}
#we only need the first 20 of the N vector
N = head(N,20)

# define the second column
method <- rep(c('PrimeAvg','SampAvg'), 5)

# combine the results and make the table
table <- data.frame(n=N, Method=method, Gaussian=result[1:20], t_1=result[21:40]
                    , t_5=result[41:60])
table


