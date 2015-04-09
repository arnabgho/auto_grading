load('marks.mat');
K = 6; 
max_iters = 10;

initial_centroids = kMeansInitCentroids(X, K);

[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

Y=sum(centroids');
[r, ix]=sort(Y,'descend')

GRADE=["A";"B";"C";"D";"E";"F"];

for i=1:100
	for j=1:K
		if idx(i,1)==ix(1,j)
			fprintf('%d : total: %d grade %s\n',i,A(i,5),GRADE(j,1) );
		end
		
	end	
end