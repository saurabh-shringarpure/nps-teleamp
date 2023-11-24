function y = noisebasisTable()
    y = zeros([8,8,8,8]);    
    for j = 1:8
        for k =1:8
            y(:,j, :,k) = noisebasis(j,k); % reshaping this will give the same result as ArrayFlatten twice in Mathematica
        end
    end
    y = reshape(y , 64, 64);
end