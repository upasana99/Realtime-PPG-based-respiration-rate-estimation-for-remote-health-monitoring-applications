function [inh,exh]= resp(midx,midy)
[peaks,locs]=findpeaks(midy,midx);
k=0;
for i=1:length(peaks)
    inh(k)=abs(locs(i+1)-locs(i));
    k=k+1;

