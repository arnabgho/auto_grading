
X=zeros(100,4);
for i=1:100
	a=0;
	b=50;
	A=(a-1)+(b-a+1)*rand(1,4);
	X(i,:)=floor(A)+1;
end	

 save ("-mat7-binary","marks.mat","X");