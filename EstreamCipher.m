function [ CipherMessage ] = EstreamCipher( FloatKey,Message )
%   The Estream Cipher is a symmetric encryption function which encrypts
%   or decrypts a message using key that is indeed a Float Key.
%   Input Arguments:
%   message: Message or Encrypted message  
%   key: the key must be a float ley like 0.012301
% 
%       Example{
%               message='This is a test';
%               result=EstreamCipher(message,0.1123);
%               } 
%   Output: Cipher text or plain text
%   Note that this function makes use of two other function namely
%   ChaoticPRG and OTP. Therefore they must be always located in your
%   current folder.
%   Instructor: Nima Farnoodian
%   Beyhagh institute of higher education
key=ChaoticPRG(FloatKey,length(Message));
CipherMessage=OTP(key,Message);
end

