function [ cipher ] = Vigener_Cipher( message,key,check )
%Vigener is a function that encrypts or decrypts a message using a key.
%   message: Message or Encrypted message  
%   key: the key must be a text that its size has the following conditions:
%       1<=key<= the lenght of message
%       Example{
%               message='This is a test'
%               key='Beyhagh'
%               }
%   check: it's a control that says whether the message should be either
%   encrypted or decrypted. zero is for encryption and one for decryption. 
%   Instructor: Nima Farnoodian
%   Beyhagh institute of higher education
    if (check==0)
        for i=1:length(message)
            remaining= mod(i,length(key));
                if (remaining==0)
                remaining=length(key);
                end
            message(i)=char(mod(message(i)+key(remaining),255));
        end
    else
        for i=1:length(message)
            remaining= mod(i,length(key));
                if (remaining==0)
                remaining=length(key);
                end
            p=message(i)-key(remaining);
            if (p<0)
            message(i)=char(255+p);
            elseif (p==0)
            message(i)=char(255);    
            elseif (p>0)
            message(i)=char(p);    
            end  
        end
    end
    cipher=message;

end

