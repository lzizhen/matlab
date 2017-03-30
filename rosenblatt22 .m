function [w0] = rosenblatt22 (X, T, eta, iter)
[m,n] = size(X);
w = zeros (1, n+1);   %1*n+1
X = [ones(m, 1),X];
X = X .* repmat(T,1,n+1);%取反  m*n+1
runlength = 0;
maxrunlength = 0;
w0 = 0;
for t = 1:iter
    for i = 1:m       
        if X(i, :) * w' > 0 %正确            
            runlength = runlength + 1;
            if runlength > maxrunlength
                maxrunlength = runlength;
                w0 = w;
            end
        else  %错误
            w = w + eta * X(i, :);  %更新w
            runlength = 0;
        end
    end
end
