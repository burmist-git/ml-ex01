function saveLibsvmFormat(x,y,outn)

  fid = fopen(outn,'w');
  for i = 1:length(y)
      if(y(i)==1)
	fprintf(fid,"%2s ",'+1');
      else
	fprintf(fid,"%2s ",'-1');
      endif
      for j = 1:size(x,2)
	if(x(i,j)==1)
	  fprintf(fid," %d:1",j);
	endif
      endfor
      fprintf(fid,"\n");
  endfor
  fclose(fid);  
end
