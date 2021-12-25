function creatDataSet( datfile , vocFile, nn )

  datfile
  vocFile
  nn
  
  [vocabList wordCounter] = getVocabList( vocFile, 2);
  
  evID=0;
  fid = fopen(datfile);

  for i = 1:nn
    yy=fscanf(fid, '%d', 1);
    xx(1,:) = fscanf(fid, '%d', 4696);
    x(i,:)=xx;
    y(i,1)=yy;
  end
  fclose(fid);

  save -mat 'out_mat_file.mat' x y
  
  return
  
end
