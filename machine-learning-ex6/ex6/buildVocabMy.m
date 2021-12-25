function buildVocabMy(iMin, iMax, vocListFile)

  buildingVocabulary=true;

  file_list = [readFile('./data/easy_ham/easy_ham.p1.list'),...
	       readFile('./data/easy_ham_2/easy_ham_2.p1.list'),...
	       readFile('./data/hard_ham/hard_ham.p1.list'),...
	       readFile('./data/spam/spam.p1.list'),...
	       readFile('./data/spam_2/spam_2.p1.list')];  
%  file_list = [readFile('./data/spam/spam.p1.list')];
%  file_list = [readFile('./data/spam_2/spam_2.p1.list')];  

  file_list_i=0;
  while ~isempty(file_list)
    [inFile ,file_list]=strtok(file_list);
    [nFileLines_str ,file_list]=strtok(file_list);
    [nFileWords_str ,file_list]=strtok(file_list);
    [nFileChar_str ,file_list]=strtok(file_list);
    if(length(inFile)>0)
      nFileLines=str2num(nFileLines_str);
      nFileWords=str2num(nFileWords_str);
      nFileChar=str2num(nFileChar_str);
      if(nFileWords>0)
	if(nFileWords<1000)
	  if(nFileChar/nFileWords<15)
	    file_list_i=file_list_i+1;
	    file_list_container{file_list_i}=inFile;
	    file_list_nFileLines(file_list_i,1)=nFileLines;
	    file_list_nFileWords(file_list_i,1)=nFileWords;
	    file_list_nFileChar(file_list_i,1)=nFileChar;
	    nChar_per_word(file_list_i,1)=nFileChar/nFileWords;
	    %if(nFileWords*8<nFileChar)
            %printf('--> %10.5f %s %d %d %d \n',nFileChar/nFileWords,inFile,nFileLines,nFileWords,nFileChar);
	    %endif
	  endif
	endif
      endif
    endif
  end
  
  if(iMax>length(file_list_container))
    iMax=length(file_list_container)
  endif
  
  printf("N files : %d \n",length(file_list_container));
  %for i = 1:length(file_list_container)
  for i = iMin:iMax
    %for i = 1:2
    printf("%10d %s %s \n",i,' ',file_list_container{i});
    file_contents = readFile(file_list_container{i});
    %outFileName=[file_list_container{i},'.p1'];
    %prepareEmail(file_contents,outFileName);
    word_indices = processEmailMy(file_contents, buildingVocabulary, vocListFile);
  end
  
  %plot(file_list_nFileWords,file_list_nFileChar,'*');
  %plot(file_list_nFileWords([find(file_list_nFileWords*8 <
  %				  file_list_nFileChar)],1),
  %      file_list_nFileChar([find(file_list_nFileWords*8 <
  %				  file_list_nFileChar)],1),'*');
  %pause;

  %semilogy(hist(nChar_per_word,100))
  %histc(nChar_per_word, [1:100],1);
  %figure;
  %hist (nChar_per_word, linspace(0,100,100), 'facecolor', 'r', 'edgecolor', 'b');
  %figure;
  %hist (file_list_nFileLines,linspace(0,1000,100));
  %figure;
  %hist (file_list_nFileWords,linspace(0,10000,100));
  %figure;
  %hist (file_list_nFileChar,linspace(0,100000,100));
  %pause;
  
end
