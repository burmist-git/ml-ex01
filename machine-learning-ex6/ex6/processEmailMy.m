function word_indices = processEmailMy(email_contents, buildingVocabulary, vocListFile)

  [vocabList wordCounter] = getVocabList(vocListFile,2);
  word_indices=[];

  if(buildingVocabulary == true)
    while ~isempty(email_contents)
      [str, email_contents] = strtok(email_contents);
      %printf('%s ',str);
      %printf('%d \n',length(email_contents));
      if(length(str)>0)
	if(length(str)<50)
	  alreadyInVoc=0;
	  for i = 1:length(vocabList)
	    if (strcmp(vocabList{i},str) == 1)
	      wordCounter(i)=wordCounter(i)+1;
	      alreadyInVoc=1;
	      break;
	    endif
	  endfor
	  if(alreadyInVoc == 0)
	    vocabList{length(vocabList)+1}=str;
	    wordCounter(length(wordCounter)+1)=1;
	  endif
	endif
      endif
    end
    saveVocabList(vocListFile,vocabList,wordCounter);
  else
    while ~isempty(email_contents)
      [str, email_contents] = strtok(email_contents);
      if(length(str)>0)
	if(length(str)<50)
          for i = 1:length(vocabList)
            if (strcmp(vocabList{i},str))
              word_indices = [word_indices ; i];
              break;
            endif
          endfor
	endif
      endif
    end
  endif
  
end
