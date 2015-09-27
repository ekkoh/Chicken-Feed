data(chickwts)
chickwtsbyfeed<-split(chickwts, chickwts$feed)
df<-lm(weight ~ feed, data=chickwts)
choices=c('','Casein', 'Horsebean', 'Linseed', 'Meatmeal', 'Soybean', 'Sunflower')