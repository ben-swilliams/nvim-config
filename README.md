# What Is This
If someone is reading this, with any kind of novelty, then one of two things have happened, one more likely than the other.
## Someone other than me is reading it
Hello! In an attempt to create a fairly exhaustive README.md (and a fairly transparent punt at reminding myself that Markdown exists), I feel I should address the purpose of this repo. 
As foreshadowed, someone other than me being here is the less likely reason why anyone would be reading this. This repo serves a few purposes:
1. Repository management
     * A configuration repo for Neovim isn't exactly an impressive demonstration of GitHub/Git prowess, however my prowess thusfar has yet to be documented, and any kind of prowess being
       demonstrated is always a plus in the ol' employability department.
     * What little prowess I have can only benefit from having a strict, production-level (hopefully) git repo to look after
2. Indirect blackmail
     * I have made a couple feeble attempts at switching to Neovim before this one, and both ended in a fire of configuration-fueled insoomnia. A few hours in, it's going rather well and
       I want as many reasons as possible to keep going. A non-insignificant reason can now be however many hours I sink into the development of this repo
3. The normal stuff
     * The normal reasons people have GitHub repos. Commit logs (if I remember, **I WILL REMEMBER**), protection from local nonsense, the beginning of a centralised place I can point to
       for projects, etc.

## I gave up
If I gave up and am now reading this having forgotten I wrote it. Future Ben, you're weak. I hope this is never the case.

# The Meat
## Package Manager
I am using [Lazy.nvim](https://github.com/folke/lazy.nvim) as the package manager. Apparently it's the one to use these days. I hope it stays that way but from the looks of things the
one the cool kids use changes every couple of years, so that'll be a fun commit (if this repo makes it that far).
### Structure
Very broadly, the structure of my plugin management looks like this:   
```
nvim/
├── init.lua
└── lua/
    ├── conf/
    │   ├── init.lua
    │   ├── base/
    │   │   ├── init.lua
    │   │   ├── colours.lua
    │   │   ├── keymap.lua
    │   │   └── set.lua
    │   ├── plugins/
    │   │   ├── init.lua
    │   │   ├── dap-configs
    │   │   │   └── [dap_config_for_filetype].lua
    │   │   ├── lsp
    │   │   │   ├── init.lua
    │   │   │   └── [lsp_related_plugin].lua
    │   │   └── [plugin].lua
    └── plugins/
        └── [plugin].lua
```
## init.lua
My main [init.lua](nvim-config/init.lua) does 3 things:
1. Sets the leader key to space
    1. If I ever change this, then god help me. Most of my bindings revolve around this.
2. Installs package manager
    1. For obvious reasons, lazy.nvim needs installing and configuring first.
3. Installs and configures plugins    
    1. First all plugins are configured by requiring the [plugins directory](nvim-config/plugins). This directory has (usually) one `.lua` file per plugin installed, each of which returns
        a table that lazy.nvim uses to install/update the plugin.   
    2. Then the [config directory](nvim-config/config) is required. This chains to two directories:   
        * [base](nvim-config/config/base) handles colour theme, vanilla keymaps and vim settings   
        * [plugins](nvim-config/config/plugins) handles all plugin configuration and keymaps. There is largely one per plugin (related dependent plugins may be grouped in some cases).

## LSP
The LSP configuration is segregated a bit more than the other plugins. It has [its own directory](nvim-config/config/plugins/lsp) which contains two things:
    1. LSP related plugin configuration, e.g. mason, nvim-cmp ...
    2. Another sub-directory, containing one file per LSP installed. These have to be manually created and explicitly added to a table to be called in the LSP configs [init.lua](nvim/config/plugins/lsp/lsp_configs/init.lua).
The manual file required per LSP forces me to actually think about the configuration for each LSP, and stops the LSP configuration file from getting too big.

## DAP
The DAP I have configured to be a tad special. My goal was to have the ability to configure both different keybindings and different debug window layouts for each file I have a DAP for.
I have done this by configuring the DAP a 'default' way in its [configuration file](nvim-config/config/plugins/dap-config.lua). As a part of this, if you try to open the DAP UI then it will
refuse and warn you if you don't have a DAP for the current file type configured.   
Then I add an autocommand for each configured DAP which calls the configuration for that filetype (in [the configs directory](nvim-config/config/plugins/dap-configs). It's in these files I can
configure the DAP UI layout and any key bindings that I need. Pretty cool, it took **forever** to figure out.   
There is a [default configuration](nvim-config/config/plugins/dap-configs/default.lua) that will initialise some basic keybindings for any DAP attachment. Right now it is just keybindings but any DAP
configuration could feasibly be added to this configure funciton if required.

## Keybinds (which-key)
The only (thusfar) significant plugin to document my usage of for prosperity is [which-key](https://github.com/folke/which-key.nvim).   
For custom key-mappings, I have used which-key wherever possible. From research, this is largely redundant as which-key auto detects the `desc` option in `vim.set.keymap` statements these days,
however which key lets me create groups with custom names etc. which is helpful to remember the many keymaps I intend on creating.
### The groups
Below are all custom keybindings. If any are on bold, they are dependent on the LSP attaching to a buffer. I'm only listing custom bindings, for obvious reasons.
<details>
  
* **System**: `<leader>`    
    This is the bottom layer of keymaps that begin with the leader key. It contains utility keymaps (as broad and non-specific as that term is)
    * `<leader>`
        * Source current file. Basically runs it, mainly for things like configuration.
    * `e`
        * Open nvim tree (or NetFW if nvim tree isn't installed for some reason)
    * `Y`
        * Yank line to system clipboard
    * `y`
        * Yank selection to system clipboard
    * `p`
        * Paste selection without nuking yank buffer
    * `r`
        * Rename token under cursor (find and replace in file)
 
          
        **Code**: `c`   
        Any keymaps to do with code semantics (not gotos)
        * `a`
            * **Select a code action**
        * `d`
            * Open diagnostic for diag. under cursor
        * `f`
            * **Format code globally (in normal mode) or for selection (in visual mode)**
        * `l`
            * Sets location list to diagnostics of current file
        * `r`
            * **Rename symbol under cursor**


        **Debug**: `d`
        Any keymaps that interact with the nvim debug adapter (nvim-dap), these will only work if a valid DAP is configured (see above)
        * `b`
            * Toggle breakpoint on this line
        * `B`
            * Clear all breakpoints in file
        * `c`
            * Continue running the program
        * `e`
            * Evaluate an expression in a floating window
        * `i`
            * Inspect current variable value
        * `t`
            * Toggles the debug elements
        * `x`
            * Terminate the session
 
              
        **Find**: `f`   
        Any keymaps to find something using telescope (usually files, strings or references)
        * `b`
            * Find buffer in open buffers
        * `f`
            * Find file in cwd (wherever `vi` was run from)
        * `d`
            * Find in diagnostics for file
        * `o`
            * Find old files from open history
        * `r`
            * Find references to token under cursor
        * `s`
            * Find string statically
            * Pre-enter string, and then telescope through resultant files
        * `S`
            * Find string dynamically
            * Telescope updates files as you type string (but cannot search through resultant files)
        * `u`
            * Find a previous undo in the undo tree

               
        **Open**: `o`   
        Any keymaps that open a menu
        * `m`
            * Opens Mason to configure LSP server installs etc.
        * `n`
            * Opens NoneLS info to see what's going on with non-LSP formatting, linting etc.
        * `p`
            * Opens plugin manager (at time of writing, lazy.nvim)
         
              
* **Goto**: `g`   
    Any keymaps that go to a place in the file
    * `d`
        * **Go to definition of token under cursor**
    * `D`
        * **Go to declaration of token under cursor**
    * `i`
        * **Go to implementation of function under cursor**
    * `r`
        * **Go to references of token under cursor**
        * Opens in-line pop-up for local buffer only (as opposed to <leader>fr
    * `t`
        * **Go to type definition of token under cursor**  


* **Trouble**: `t`   
    Any keymaps that interact with trouble
    * `d`
        * Open document diagnostics
    * `l`
        * Open location list
    * `q`
        * Open quickfix list
    * `r`
        * **Open references to token under cursor**
    * `t`
        * Toggle Trouble window (basically reruns last Trouble search)
    * `w`
        * Open workspace diagnostics
    * `x`
        * Close trouble
</details>

    
