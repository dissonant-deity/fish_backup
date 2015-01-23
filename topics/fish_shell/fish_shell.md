Fish shell is a good replacement to bash, which is the standard on Linux and Mac machines.

It has a few features which make it worth installing.

1. colors

   -- lots of colors automatically categorize content

2. autocompletion

   -- bash has this, but the big difference is
   
      fish will show you your options for autocomplete
  
      as you type. for example if I type

      `git push origin master` by the time I get to

      `git push o` i will see some shadow text that

      lets me know that i only have to press tab at
 
      that point to be done with it.

3. functions
  
    -- i prefer fish functions to bash aliases for

       two main reasons. First off, though, 
 
       the main drawback is that the two formats

       are not compatible. They would require a little

       translation.

    -- the syntax is nice. echoing text to bashrc
     
       feels less semantic thn typing

       ```
       function asd
          echo asd
       end
       ```
     
       Also, in order to edit it, it's only necessary to

       press the up arrow in the terminal (to bring back

       the command from history) and some fancy magic

       kicks in where the edit cursor can traverse lines
 
       up and down the function definition right then and 

       there. More generally, it can be redefined by

       being overwritten.

    -- Functions are never saved until
       
       `funcsave <function_name>` is called. 

       Saving actually writes the current definition

       to a file in `~/.config/fish/functions`

       named <function_name.fish>.

    -- The [functions](functions/functions.md) program

       in this directory takes these function definitions

       and writes them to a pleasnt markdown file. 

       The point of this is to help people more easily share

       their fish functions (or aliases, more generally), 

       which are greatly useful. See [output.md](functions/output.md)

       for example. 
     
       
