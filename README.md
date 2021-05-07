# TelCoCustomerChurnAnalysis
Understanding the different factors that affect the customer churn rate for the Telco company.

Our dataset is made of mixed-type data where both categorical and numerical values co-exist. While the k-means algorithm suits the dataset with numerical attributes better, we are using a clustering algorithm centering around medoids rather than centroids. Hence, we have opted for unsupervised classification using PAM(Partitioning Around Medoids) clustering algorithm by using Gower distance to predict the customer churn rate.

Partitioning Around Medoids (PAM) Algorithm:
This clustering model will help us in understanding the dataset as it produces “typical individual” for each cluster which becomes useful in our interpretation. In this clustering analysis, we have included all the variables in our dataset to find the similarities and dissimilarities in our dataset. As a first step, we have used the silhouette coefficient to give us the number of clusters our dataset must be clustered into.The silhouette coefficient shows the contrast in the average distance to elements in the cluster with the average distance to elements in other clusters. Objects with high silhouette coefficient value are considered to be well-clustered and objects with low silhouette value are usually outliers. From the below diagram, we can either choose silhouette coefficient value to be 2 or 3 as both contain the highest silhouette width. 
Let’s choose k=2, as more clusters would either form overlapping subclusters or would include outliers and other noise in the dataset as shown in Appendix 3.1 . Therefore, this divides our dataset into 2 clusters. 

![Screenshot](/Images/Silhouette-Width.png?raw=true "Silhoutte Width"))

Observations :
On running the PAM algorithm on the dataset with k=2(silhouette coefficient), we derive the below clusters as depicted in the scatter plot. Clusters 1 and 2 are quite distinctive and spaced apart barring a few points, indicating relevancy of the clustering model.

[Silhouette-Width](/relative/path/to/img.jpg?raw=true "Silhoutte Width")

From the summary scorecard below, the customers in cluster 1 have internet services. And they have much higher concentration in selecting ‘Month-to-month’ contract terms. 
[Silhouette-Width](/relative/path/to/img.jpg?raw=true "Silhoutte Width")
[Silhouette-Width](/relative/path/to/img.jpg?raw=true "Silhoutte Width")


This is shown by “No Internet Services” = 0.

Whereas in Cluster 2, customers do not prefer internet services and this is justified by the high count for “No Internet Services”. Further, Cluster 2 has low values for “DSL” and “Fiber optics” preference. Lastly, the majority of cluster 2 customers have one year or two year contracts. 

[Silhouette-Width](/relative/path/to/img.jpg?raw=true "Silhoutte Width")
[Silhouette-Width](/relative/path/to/img.jpg?raw=true "Silhoutte Width")



To conclude, below are the following points that can be drawn from the above model.
Cluster 1 has a high number of customers who are more likely to stay compared to Cluster 2. 
It is very interesting to see that cluster 1 and 2 formation are very distinctive but don't shed much light on customer churning attribute(Target). 

