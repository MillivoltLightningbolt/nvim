## There are multiple types of configuration options
all are equal to `:set` but in lua we have to distinguish between scopes:

1. [global] options (vim.o)      -- equal to `:set` in vim, NOTE: there is no `unset`, instead use vim.o.<option>=false
2. local to window (vim.wo)      --
3. local to buffer (vim.bo)      --
4. global options (vim.go)       -- unlike vim.o this ONLY sets global options



## lua-vimscript-bridge
see `:h lua-vimscript`

* vim.call({func}, {...})                       -- invokes vim-function or user-function {func} with arguments {...}  
* vim.cmd({cmd})                                -- execute multiple lines of vimscript at once  
  Example: >  
      vim.cmd('echo 42')  
      vim.cmd([[                                -- NOTE: double [ ] is multiline string in LUA  
        augroup My_group  
          autocmd!  
          autocmd FileType c setlocal cindent  
        augroup END  
      ]])  
* vim.fn.{func}({...})                          -- invokes vim-function or user-function {func} with arguments{...}  
                                                --         directly converts between Vim objects and Lua objects  
                                                --         if the vim function returns a float it will be represented directly as Lua number  
                                                --         empty lists/dicts are represented by empty table  
                                                --         NOTE: v:null return value us represented as vim.NIL  
                                                --         NOTE fim.fn keys are generated lazily thus pairs(vim.fn) only enumerates functions that were called at least once  
                                                --         NOTE: to call autoload functions, use the syntax:  
                                                --         vim.fn['some#function']({...})  



## lua-vim-variables
see `:h lua-vim-variables`

how to access vim editor global dict g: w: b: t: v: c: etc, invalid or unset key returns `nil`  
e.g.  
vim.g.foo = 5     -- set variable  
print(vim.g.foo)  -- get (and print) variable  
vim.g.foo = nil   -- delete variable  

vim.g   -- global  
vim.b   -- current buffer  
vim.w   -- current window  
vim.t   -- current tab  
vim.v   -- variables  
vim.env -- environment variables (defined in editor session)  

NOTE: pretty cool settings to steal/copy from here: https://github.com/brainfucksec/neovim-lua

