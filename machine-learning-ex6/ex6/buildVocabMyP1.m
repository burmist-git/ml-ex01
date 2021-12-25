function buildVocabMyP1()
  
  file_list = [readFile('./data/easy_ham/easy_ham.list'),...
	       readFile('./data/easy_ham_2/easy_ham_2.list'),...
	       readFile('./data/hard_ham/hard_ham.list'),...
	       readFile('./data/spam/spam.list'),...
	       readFile('./data/spam_2/spam_2.list')];  
  
  file_list_i=0;
  while ~isempty(file_list)
    [inFile ,file_list]=strtok(file_list);
    if(length(inFile)>0)
      file_list_i=file_list_i+1;
      file_list_container{file_list_i}=inFile;
    endif
  end
  
  for i = 1:length(file_list_container)
    %for i = 1:2
    printf("%10d %s %s \n",i,' ',file_list_container{i});
    file_contents = readFile(file_list_container{i});
    outFileName=[file_list_container{i},'.p1'];
    prepareEmail(file_contents,outFileName);
  end
  
end
