function saveVocabList(vocListFile,vocList,wordCounter)
  fid = fopen(vocListFile,'w');
  for i = 1:length(vocList)
    fprintf(fid,"%10d %s %70s %s %10d \n",i,' ',vocList{i},' ',
	    wordCounter(i));
  endfor
  fclose(fid);  
end
