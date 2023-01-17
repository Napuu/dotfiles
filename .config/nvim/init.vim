"import init.lua
lua require'init'

"fun! JumpToDef()
"  if exists("*GotoDefinition_" . &filetype)
"    call GotoDefinition_{&filetype}()
"  else
"    exe "norm! \<C-]>"
"  endif
"endf

" Jump to tag
"nn <M-g> :call JumpToDef()<cr>
"ino <M-g> <esc>:call JumpToDef()<cr>i

set completeopt=menu,menuone,noselect

set updatetime=100
