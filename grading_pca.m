load('marks.mat');


P=sum(X');
A=[X P'];


[X_norm, mu, sigma] = featureNormalize(A);

[U, S] = pca(X_norm);
Z = projectData(X_norm, U, 2);



K = 6; 
max_iters = 10;

initial_centroids = kMeansInitCentroids(Z, K);

[centroids, idx] = runkMeans(Z, initial_centroids, max_iters);

[t_x t_y]=size(centroids);

if t_y >1
	Y=sum(centroids');
else
	Y=centroids';
end

[r, ix]=sort(Y,'descend')

GRADE=["A";"B";"C";"D";"E";"F"];

% disp(initial_centroids);

% disp('\n');

% disp(centroids);


% disp('\n');

% disp(idx);

% disp(r);
% disp(ix);

for i=1:100
	for j=1:K
		if idx(i,1)==ix(1,j)
			fprintf('%d : total: %d grade %s\n',i,A(i,5),GRADE(j,1) );
		end		
	end	
end