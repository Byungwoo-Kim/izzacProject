library(ggplot2)
library(RColorBrewer)
color=brewer.pal(8,'Spectral')
output <- read.csv('output.csv')

bardata<-t(output)
bar_data <- data.frame(name=rownames(bardata), count=bardata[,1])

png(filename='barchart.jpg', width=800, height=600)
ggplot(bar_data, aes(x=name, y=count)) + geom_bar(stat = "identity", fill=color, color="gray")
dev.off()

piedata <- t(output)
png(filename='piechart.jpg', width=800, height=600)
pie(piedata, labels = rownames(piedata), col=color, clockwise = T)
dev.off()


