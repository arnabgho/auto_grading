% load('marks.mat');

X=csvread('test.csv');

arg_list=argv();
[numRows numColumns]=size(X);

P=zeros(numRows,1);
% for(i=1;i<=numColumns;i++)
for i=1:numColumns
	weight=0.01*str2num(arg_list{nargin-i+1});
	P+=X(:,numColumns-i+1)*weight;
end

disp(P);
pause;


hist (P, 8);
xlabel('Marks');
ylabel('Number Of People');
title('Data For Grading');
 print -djpg histogram.jpg 
 pause;

% P=sum(X');
A=[X P];


% [X_norm, mu, sigma] = featureNormalize(A);

% [U, S] = pca(X_norm);
% Z = projectData(X_norm, U, 2);



K = 6; 
max_iters = 10;

initial_centroids = kMeansInitCentroids(P, K);

[centroids, idx] = runkMeans(P, initial_centroids, max_iters);

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

for i=1:numRows
	for j=1:K
		if idx(i,1)==ix(1,j)
			fprintf('%d : total: %d grade %s\n',i,P(i),GRADE(j,1) );
		end		
	end	
end