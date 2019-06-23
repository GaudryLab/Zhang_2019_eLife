%ROI_h1=impoly;
%BW1=createMask(ROI_h1);

for i=1:12
  response_peak{i}=response_filt{1,i}.*BW;
  
end

for i=1:12
  phi(i,:)=double(reshape(response_peak{i},1,[]));
end

[coeff, score, latent, Tsquared]=princomp(phi','econ');
cumsum(latent)./sum(latent)
