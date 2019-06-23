ROI_h=impoly;
BW=createMask(ROI_h);

for j=1:12 % number of odors
  for mm=1:86  % number of frames
    response_act{mm,j}=(all_A{mm,j}-baseline{1,j})./baseline{1,j};
  end
end

for j=1:12
  for mm=1:86
    response_filt_act{mm,j}=imfilter(response_act{mm,j},h,'replicate');
  end
end

for i=1:12
  for mm=1:86
    response_curve_temp=response_filt_act{mm,i}.*BW;
    response_curve_value=response_curve_temp(find(response_curve_temp~=0));
    response_curve(mm,i)=mean(response_curve_value);
  end
end


figure
hold on
for i=1:12
  plot(response_curve(:,i))
end


