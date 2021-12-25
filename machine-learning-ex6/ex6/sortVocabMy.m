function sortVocabMy( vocNotSortFile, vocSortFile)

  %printf("%s %s\n",vocNotSortFile, vocSortFile)
  
  vocNotSort = [readFile(vocNotSortFile)];
  
  vocNotSort_i=0;
  length(vocNotSort);
   while ~isempty(vocNotSort)
    %for i = 1:10
    if(length(vocNotSort)>0)
      [iDnotSortStr,vocNotSort]=strtok(vocNotSort);
      [mot,vocNotSort]=strtok(vocNotSort);
      [motnStr,vocNotSort]=strtok(vocNotSort);      
      if(length(mot)>0)
	if(str2num(motnStr)>0)
	  vocNotSort_i=vocNotSort_i+1;
	  iDnotSort(vocNotSort_i,1)=str2num(iDnotSortStr);
	  motNotSort{vocNotSort_i}=mot;
	  motn(vocNotSort_i,1)=str2num(motnStr);
	  %if(str2num(motnStr)==2)
	  %printf("%10d %s %70s %s %10d \n",iDnotSort(vocNotSort_i,1),' ',motNotSort{i},' ',motn(vocNotSort_i,1));
	  %printf('%s\n',iDnotSortStr);
	  %endif
	  if(rem(vocNotSort_i,1000) == 0)
	    %clc;
	    printf("%5d/%d\n",vocNotSort_i,100000);
	  endif;
	endif
      endif
    endif
  end

  length(motNotSort)
  [motSort,ii]=sort(motNotSort);
  saveVocabList(vocSortFile, motSort, motn([ii],1));
  %motSort;
  %for i = 1:length(motSort)
  %  printf("%10d %s %70s %s %10d \n",iDnotSort(ii(i),1),' ',motNotSort{ii(i)},' ',motn(ii(i),1));
  %endfor
    
  %semilogy(hist(nChar_per_word,100))
  %histc(nChar_per_word, [1:100],1);
  %figure;
  %hist (nChar_per_word, linspace(0,100,100), 'facecolor', 'r', 'edgecolor', 'b');
  %figure;
  %hist (motn,linspace(1,200,200));
  %figure;
  %hist (file_list_nFileWords,linspace(0,10000,100));
  %figure;
  %hist (file_list_nFileChar,linspace(0,100000,100));
  %pause;

  return;
end
