"Immutable Data Structures

" Lists {{{

function! ApplyOnCopy(fn, l,...)
  let new_list = deepcopy(a:l)
  call call(a:fn, [new_list] + a:000)
  return new_list
endfunction

function! Sorted(l)
  return ApplyOnCopy("sort",a:l)
endfunction

function! Reversed(l)
  return ApplyOnCopy("reverse",a:l)
endfunction

function! Append(l, val)
  return ApplyOnCopy("add", a:l, a:val)
endfunction

function! Assoc(l, i, val)
  let new_list = deepcopy(a:l)
  let new_list[a:i] = a:val
  return new_list
endfunction

function! Pop(l, i)
  return ApplyOnCopy("remove", a:l, a:i)
endfunction

" Higher order functions

function! Mapped(fn, l)
  return ApplyOnCopy("map", a:l, string(a:fn) . '(v:val)')
endfunction

function! Filtered(fn,l)
  return ApplyOnCopy("filter", a:l, string(a:fn) . '(v:val)')
endfunction

function! Removed(fn,l)
  return ApplyOnCopy("filter", a:l,'!'. string(a:fn) . '(v:val)')
endfunction
" }}}
