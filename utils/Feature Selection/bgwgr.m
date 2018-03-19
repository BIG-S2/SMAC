function [ratio] = bgwgr(x,y,k)

[nsize,p]=size(x);
s = zeros(k,p);
n = zeros(k,1);

for kk = 1:k
    for ii = 1:nsize
        if y(ii) == kk
            n(kk) = n(kk) + 1;
            for jj = 1:p
                s(kk,jj) = s(kk,jj)+x(ii,jj);
            end
        end
    end
end
grpm = zeros(k,p);
for kk = 1:k
    grpm (kk,:) = s(kk,:)./n(kk);
end

popm = mean(x);
wgss = zeros(p,1);
bgss = wgss;

for jj = 1:p
    for kk = 1:k
        for ii = 1:nsize
            if y(ii) == kk
                wgss(jj) = wgss(jj) + (x(ii,jj) - grpm(kk,jj))^2;
                bgss(jj) = bgss(jj) + (grpm(kk,jj) - popm(jj))^2;
            end
        end
    end
end

ratio = bgss./wgss;




