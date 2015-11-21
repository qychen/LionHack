library(scales)
library(ggplot2)
df1 <- read.table('/Users/franciscojavierarceo/GitHub/patents/Analysis/CorpusSummary20151109.csv',sep='|',
                stringsAsFactors=F)


plot(tv,fx,type='b')
abline()
tv <- 1:31
fx <- (tv/10)*sin(1:31) + tv/4+rnorm(length(tv),0,sd=2)
fx[1:10] <- mean(fx[1:10])
df1 <- data.frame(price=fx*10,Date=tv)
df1$price <- df1$price + abs(min(df1$price))
ggplot(df1,aes(x=Date,y=price))+geom_line()+theme_bw()+
  stat_smooth(method='auto',colour='red',se=T,level=0.70)+
  scale_y_continuous(labels=dollar_format())+ylab('Price of Event')+
  xlab('Number of Days until Event')+ggtitle('Expected Price of Ticket as a function of time')
