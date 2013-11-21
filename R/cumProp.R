

cumprop <- function(N, p= 0.50) {
  # function to plot the cumulative proportion of
  # heads for a series of coin tosses.
x <- rbinom(n=N,1,prob=p)
r <- cumsum(x)
n <- 1:N
cumprob <- r/n
plot(cumprob,ylim=c(0.0, 1.0),pch=20,type="b",log='x',
     main="Cumulative proportion of heads",
     xlab="coin toss number",
     ylab="cumulative proportion of heads")
abline(h=0.5,col="red")

}



