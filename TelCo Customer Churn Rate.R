####Clustering for mixed data-type dataset#####


telco.df <- read.csv("Telco-Customer-Churn.csv",stringsAsFactors = TRUE)
View(telco.df)
summary(telco.df)
glimpse(telco.df)
str(telco.df)

#check if data contain null -> FALSE
is.null(telco.df)

#data cleaning and preprocessing
#convert SeniorCitizen column from int to factor
telco.df$SeniorCitizen <- as.factor(ifelse(telco.df$SeniorCitizen==1, 'Yes', 'No'))
telco.df$SeniorCitizen

telco.df$Churn <- as.numeric(telco.df$Churn == "Yes")

head(telco.df, n=3)

###Applying kmediod algorithm



####TRYING GOWER"S DISTANCE###########
install.packages("Rtsne")
library(cluster)
library(dplyr)
library(ggplot2)
library(readr)
library(Rtsne)

gower_dist <- daisy(telco.df, metric = "gower")
nrow(telco.df)
gower_mat <- as.matrix(gower_dist)
telco.df[which(gower_mat == min(gower_mat[gower_mat != min(gower_mat)]), arr.ind = TRUE)[1, ], ] ######Print MOST similar clients
telco.df[which(gower_mat == max(gower_mat[gower_mat != max(gower_mat)]), arr.ind = TRUE)[1, ], ] ###Print MOST dissimilar clients




sil_width <- c(NA)
for(i in 2:8){  
  pam_fit <- pam(gower_dist, diss = TRUE, k = i)  
  sil_width[i] <- pam_fit$silinfo$avg.width  
}


plot(1:8, sil_width,
     xlab = "Number of clusters",
     ylab = "Silhouette Width")
lines(1:8, sil_width)

k <- 2
pam_fit <- pam(gower_dist, diss = TRUE, k)
str(pam_fit)
pam_results <- telco.df %>%
  mutate(cluster = pam_fit$clustering) %>%
  group_by(cluster) %>%
  do(the_summary = summary(.))


pam_results$the_summary



tsne_obj <- Rtsne(gower_dist, is_distance = TRUE)
tsne_data <- tsne_obj$Y %>%
  data.frame() %>%
  setNames(c("X", "Y")) %>%
  mutate(cluster = factor(pam_fit$clustering))





ggplot(aes(x = X, y = Y), data = tsne_data) +
  geom_point(aes(color = cluster))
