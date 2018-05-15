" This is to count the number of spaces  
" Author: Pratik

nnoremap <silent> <leader>s :set opfunc=<SID>CountSpaces<CR>g@
vnoremap <silent> <leader>s :<C-u>call <SID>CountSpaces(visualmode(),1)<CR>

function! s:CountSpaces(type, ...)
  let selection_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if(a:0)
    silent exe "normal! gvy"
  elseif(a:type ==# 'line')
    silent exe "normal! `[V`]y"
  else
    silent exe "normal! `[v`]y"
  endif
  
  echo strlen(substitute(@@,'[^ ]','','g'))

  let @@=reg_save
  let &selection = selection_save
endfunction


