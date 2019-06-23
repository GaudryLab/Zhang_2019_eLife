%ROI_h1=impoly;
%BW1=createMask(ROI_h1);

for i=1:12
  response_peak_area{i}=response_filt_all{1,i}.*BW;
  response_rebuild(:,i)=response_peak_area{i}(find(response_peak_area{i}~=0));
end

for i=1:12
  for j=1:12
    r_corr2(i,j)=corr2(response_peak_area{i},response_peak_area{j});
  end
end

[r_corr p_corr]=corr(response_rebuild);
