% Group : Sude Topgül & Antonia Juncu

function [w] = get_lmmse(system_impulse_response,K,sigma2)
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
e = zeros(M,1);
e(K+1) = 1;
w = (H*H' + sigma2*eye(M)) \ (H*e);
w = w.';
end