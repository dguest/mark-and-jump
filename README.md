Mark and Jump Commands
======================

Very simple wrappers on `popd`, `pushd`, and `dirs`, see `type <cmd>`
if you want proof.

 - `m`: add the current directory to the stack
 - `j`: jump to next directory
 - `k`: jump to previous directory
 - `p`: pop the current directory
 - `l`: list directory stack
 - `u`: unclutter the stack by removing duplicated entries

There are also a few functions to save the working stack when you log
out and load it when you log in:

 - `save-dir-stack`: save a reversed list of directories
 - `load-dir-stack`: load in the directory stack

These are saved in `~/WORKING_DIRECTORY_STACK` by default, but this
can be overridden with the `DIRECTORY_STACK_FILE` variable.
