cumprob <- function(N, p= 0.5){
  # function to plot the cumulative probability of
  # a coin toss.
x <- rbinom(n=N,1,prob=p)
r <- cumsum(x)
n <- 1:N
cumprob <- r/n
plot(cumprob,ylim=c(0.0, 1.0),pch=20,type="b",log='x',
     main="Cumulative proportion of coin toss",
     xlab="coin toss number",
     ylab="cumulative proportion of heads")
abline(h=0.5,col="red")
return(head(x,25))
return(head(cumprob,25))

return(tail(x,25))
return(tail(cumprob,25))
}



