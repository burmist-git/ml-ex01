function X_recovered = runAndPlot(K, max_iters, A)

img_size = size(A);
X = reshape(A, img_size(1) * img_size(2), 3);
initial_centroids = kMeansInitCentroids(X, K);
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);
idx = findClosestCentroids(X, centroids);
X_recovered = centroids(idx,:);
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);
  
end
