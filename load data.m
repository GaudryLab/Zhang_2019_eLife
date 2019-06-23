for i=1:5  % this could be changed according to the number of layers
  for j=1:86 % this could be changed according to the number of frames
    for k=1:48 % this could be changed according to the odor number times repeats
       % file name path
      fname{i,j,k}=['CSDn LH new odor panel\20170109\CSDn_LH_000',num2str(k,'%02d'),'\ChanA_0001_0001_00',num2str(i,'%02d'),'_00',num2str(j,'%02d'),'.tif'];
      A(:,:,k)=imread(fname{i,j,k});
    end
      
    for mm=1:12  % number of odors
      A_mean{i,j,mm}=A(:,:,1).*0;
      odor{mm}(:,:,1)=A(:,:,1).*0;
      
      for yy=1:4  % number of repeats
        odor{mm}(:,:,yy)=A(:,:,(yy-1)*12+mm);
      end
      
      A_mean{i,j,mm}=mean(odor{mm},3);
    end
    
  end
end

for i=1:5
  for j=1:86
    for k=1:12
    wname{i,j,k}=['CSDn LH new odor panel\analysis\','7\odor',num2str(k),'\ChanA_0001_0001_00',num2str(i,'%02d'),'_0',num2str(j,'%03d'),'.tif'];
    imwrite(uint16(A_mean{i,j,k}),wname{i,j,k},'tif');
    end
  end
end
