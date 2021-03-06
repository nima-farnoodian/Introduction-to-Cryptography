function [ Message ] = ReturnMessageFromImage( StegoImage,len,FloatKey)
%   The HideIntoImage is a asymmetric hiding function which extracts
%   a message embedded or hidden in a StegoImage.
%   Input Arguments:
%   message: StegoImage
%   len: the length of the binary string of message. 
%   Output: Plain Text
%   Note that if you decide to extract a plain text from a StegoImage, you
%   should consider that the message must have been hidden into the StegoImage
%   by HideIntoImage function.
%   Instructor: Nima Farnoodian
%   Beyhagh institute of higher education
bitsOfmessage=zeros(1,len);
[x y]=size(StegoImage);
msg=zeros(1,(len/8));
counter2=0;
binary=zeros(1,8);
   for i=1:x
        for j=1:y
            counter2=counter2+1;
            if (counter2<=len)
             bitsOfmessage(1,counter2)= bitget(StegoImage(i,j),1);
            else
                break;
            end
        end
   end
    MsgCounter=0;
    for i=1:8:len
        MsgCounter=MsgCounter+1;
        binary(1,:)=bitsOfmessage(1,i:1:i+7);
        binaryString=num2str(binary);
        Ascii=bin2dec(binaryString);
        msg(1,MsgCounter)=Ascii;
    end
    Message=char(msg);
    Message=EstreamCipher(FloatKey,Message);
end

