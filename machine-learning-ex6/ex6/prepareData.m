function prepareData ( fileListP1, file_list_max, vocListFile, yval)

  file_list = readFile(fileListP1);

   %  file_list = [readFile('./data/easy_ham/easy_ham.p1.list'),...
   %              readFile('./data/easy_ham_2/easy_ham_2.p1.list'),...
   %             readFile('./data/hard_ham/hard_ham.p1.list'),...
   %            readFile('./data/spam/spam.p1.list'),...
   %           readFile('./data/spam_2/spam_2.p1.list')];  
   %  file_list = [readFile('./data/spam/spam.p1.list')];
   %  file_list = [readFile('./data/spam_2/spam_2.p1.list')];  

  file_list_i=0;

  % hile ~isempty(file_list);

  for jj = 1:10
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
	    if(rem(file_list_i,100) == 0)
	      printf("%5d/%d\n",file_list_i,file_list_max);
	    endif
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

  strtok_key=false;
  [vocabList wordCounter] = getVocabList(vocListFile,2);
  n = length(vocabList);
  m = length(file_list_container);
  for j = 1:m
    if(rem(j,1) == 0)
      printf("%5d/%d\n",j,m);
    endif
    word_indices=[];
    if(strtok_key == true)
      email_contents = readFile(file_list_container{j});
      while ~isempty(email_contents)
	[str, email_contents] = strtok(email_contents);
	if(length(str)>0)
          if(length(str)<50)
            for i = 1:n
              if (strcmp(vocabList{i},str))
		word_indices = [word_indices ; i];
		break;
              endif
            endfor
          endif
	endif
      endwhile
    else
      fid = fopen(file_list_container{j});
      while (fscanf(fid, '%s', 1))
	str = fscanf(fid, '%s', 1);
	for i = 1:n
	  if (strcmp(vocabList{i},str))
            word_indices = [word_indices ; i];
            break;
	  endif
	endfor
      endwhile
      fclose(fid);
    endif
    
    xx = zeros(1, n);
    xx(1,[word_indices]) = 1;
    x(j,:)=xx;
  endfor

  y = zeros(m, 1);
  y(:,1) = yval;
  save -mat 'outFileName.mat' x y
  
end
