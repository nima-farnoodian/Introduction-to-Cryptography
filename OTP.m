function [ Cipher ] = OTP( key,message )
%   The One Time Pad (OTP) is a symmetric encryption function which encrypts
%   or decrypts a message using key that is indeed a binary array.
%   Input Arguments:
%   message: Message or Encrypted message  
%   key: the key must be a binary array with n rows and 8 colums. n is the
%   length of message. For example if your message includes 14 letters,
%   then your key has to be an array with following properties:
%       The number of rows=14
%       The number of colums=8, "it's because of each letter is presented by 8
%       bits."
%       Example{
%               message='This is a test';
%               key=randint(14,8);
%               result=OTP(message,key);
%               } 
%   Note that "randint" is a function Generating a random binary data stream
%   Output: Cipher text or plain text
%   Instructor: Nima Farnoodian
%   Beyhagh institute of higher education
len=length(message); % It holds the length of message
binaryArray=zeros(len,8);
    for i=1:len
        bits=dec2bin(message(1,i),8);
        for j=1:8
            binaryArray(i,j)= str2num(bits(1,j));
        end
    end
binaryArray=xor(binaryArray,key);
    for i=1:len
        for j=1:8
            bits(1,j)= num2str(binaryArray(i,j));
        end
        CT(1,i)=char(bin2dec(bits));
    end
    
    Cipher=CT;
end

