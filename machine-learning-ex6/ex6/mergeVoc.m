function mergeVoc(vocFileToAdd, vocFile)

  [vocabListToAdd wordCounterToAdd] = getVocabList(vocFileToAdd,2);
  [vocabList wordCounter] = getVocabList(vocFile,2);
  
  for i = 1:length(vocabListToAdd)
    %for i = 1:10
    printf('%10d/%d\n',i,length(vocabListToAdd));
    alreadyInVoc=0;
    for j = 1:length(vocabList)
      if (strcmp(vocabList{j},vocabListToAdd{i}))
	wordCounter(j)=wordCounter(j)+wordCounterToAdd(i);
	alreadyInVoc=1;
	break;
      endif
    endfor
    if(alreadyInVoc == 0)
      vocabList{length(vocabList)+1}=vocabListToAdd{i};
      wordCounter(length(wordCounter)+1)=wordCounterToAdd(i);
    end 
  end
    
  saveVocabList(vocFile,vocabList,wordCounter);

  return;
  
end
