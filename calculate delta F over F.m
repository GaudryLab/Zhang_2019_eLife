for k=1:86  % number of frames
  for i=1:12  % number of odors
    all_A{k,i}=A_mean{1,1,i}.*0;
      for j=1:5  % number of layers
        all_A{k,i}=all_A{k,i}+A_mean{j,k,i};
      end
  end
end


for j=1:86
  temp(:,:,j)=all_A{j,1};
end
mean_all_A=mean(temp,3);

% delta F/F
for j=1:12
  baseline{j}=all_A{1,1}.*0;
  peak{j}=all_A{1,1}.*0;
  response{j}=all_A{1,1}.*0;
  
  for kk=6:12
    baseline{j}=baseline{j}+all_A{kk,j};
  end
  
  baseline{j}=baseline{j}./7;
  
  for mm=28:30 % this will be modified after checking traces of responses
    peak{j}=peak{j}+all_A{mm,j};
  end
  
  peak{j}=peak{j}./3;
  response{j}=(peak{j}-baseline{j})./baseline{j};
end

% gaussion filter
h = fspecial('gaussian',[4 4], 2);
for j=1:12
  response_filt{j}=imfilter(response{j},h,'replicate');
end

% show max responses
for i=1:12
  figure
  imshow(response_filt{i})
  colormap(jet)
  colorbar
  caxis([-0.2 0.5])
end

% show baseline as neural structure
figure
imshow(mean_all_A,[])
