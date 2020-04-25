function [ cipher ] = Caesar_Cipher( message,check )
%CAESAR_CIPHER is a function which encrypts or decrypts a message by
%shifting by 3
%   message: Message or Encrypted message  
%   check: It's a control that says whether the message should be either
%   encrypted or decrypted. zero is for encryption and one for decryption. 
%   Instructor: Nima Farnoodian
%   Beyhagh institute of higher education
    if (check==0)
        for i=1:length(message)
            %%smessage(i)=char(message(i)+3);
            message(i)=char(mod(message(i)+3,255));
        end
    else 
        for i=1:length(message)
        p=message(i)-3;
            if (p<0)
            message(i)=char(255+p);
            elseif (p==0)
            message(i)=char(255);    
            elseif (p>0)
            message(i)=char(p);    
            end   
        %message(i)=char(message(i)-3);
        end
    end
    cipher=message;
end

