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
"-- 'advanced' rg integration
" no idea if I have used this?
" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
"   call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
" endfunction

" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" if has('nvim')
"   tnoremap <expr> <c-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" endif

" todo - move this to some lua file
set laststatus=3
