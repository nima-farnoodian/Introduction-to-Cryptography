function [ StegoImage binary len  ] = HideIntoImage( image, message, FloatKey )
%   The HideIntoImage is a asymmetric hiding function which hides
%   a message into an image.
%   Input Arguments:
%   message: Message or Plain text
% 
%       Example{
%               message='This is a test';
%               image=imread('c:\pic1.jpg');
%               } 
%   Output: 
%   {StegoImage: An image that hides a message.
%   Binary: It's a binary string of plain text
%   len: the length of the binary string of plain text.}
%   Instructor: Nima Farnoodian
%   Beyhagh institute of higher education
image=rgb2gray(image);
message=EstreamCipher(FloatKey,message);
l=length(message);
NoRequiredPixels=l*8;
bitsOfmessage=zeros(1,NoRequiredPixels);
[x y]=size(image);
counter=0;
counter2=0;
      
        for i=1:l
            tempbinary=dec2bin(message(1,i),8);
            for j=1:8
                bitsOfmessage(1,j+counter)=str2num(tempbinary(1,j));
            end
            counter=counter+8;
        end
    for i=1:x
        
        for j=1:y
            counter2=counter2+1;
            if (counter2<=NoRequiredPixels)
                tempbit=(bitsOfmessage(1,counter2));
                image(i,j)= bitset(image(i,j),1,tempbit);
                
            else
                break;
            end
            
        end
    end
StegoImage=image;
len=NoRequiredPixels;
binary=bitsOfmessage;
end

