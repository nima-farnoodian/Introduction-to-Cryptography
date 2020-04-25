function [ Key ] = ChaoticPRG( StartingPoint,numberOfletters )

%   Chaotic PseudoRandom Generator

% 	Inputs: 
%	StartingPoint= an arbitrary number
%					numberOfletters= the number of letters in the text or the document, which will be encrypted. 
%	Output:
%		Key= a chaotic random key 

%    Instructor: Nima Farnoodian
%    Beyhagh Institute of Higher Education


xi=StartingPoint;
originalNumber=0;
keyArray=zeros(numberOfletters,8);
     for i=1:100
     xi= (4*xi)*(1-xi);
     end
     for i=1:numberOfletters
     xi= (4*xi)*(1-xi)
     originalNumber= round(xi*(10^4));
     keyArray(i,:)= bitget(originalNumber, 15:-1:8);
     end 
     Key=keyArray;
end

