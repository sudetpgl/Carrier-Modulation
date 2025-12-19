% Group : Sude Topgül & Antonia Juncu

function [w] = get_zf(system_impulse_response,K)
w = zeros(1,2*K+1);

h = system_impulse_response(:);
N = length(h);
L = (N-1)/2;
M = 2*K + 1;      
H = zeros(M,M);
p = (L+1):(L+2*K+1);

for r = 1:M
    for c = 1:M
        idx = p(r) - c + 1;
        if idx >= 1 && idx <= N
            H(r,c) = h(idx);
        end
    end
end

d = zeros(M,1);
d(K+1) = 1;
w = H \ d;
w = w.';
end