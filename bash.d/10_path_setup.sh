#!/bin/bash

# Directories
export DDOC=$HOME/Documents
export DMEDIA=$HOME/media
export DBACKUP=$HOME/backup
export DDOWN=$HOME/Downloads
export DSYSDATA=$DADMIN/data
export DBASH=$HOME/.bash.d
export DDESKTOP=$DOTHER/Desktop
export DAPTCACHE=/var/cache/apt/archives
export DPROJECTS=$HOME/projects

# Files
export FSYSLOG=/var/log/syslog
export FILOG=$DSYSDATA/install.log

# Path functions {{{
##############################################################################
#
# FUNCTION:     addtopath
#
# DESCRIPTION:  Add a directory to the $PATH environment variable.
#               - Checks that the directory exists.
#               - Directories can be inserted at the beginning or the end of
#                 the $PATH.
#               - If the directory is already in the $PATH, it will be moved
#                 to the requested position.
#
# PARAMETERS:   1 (r): Directory that is to be inserted in $PATH
#               2 (r): Position for insertion, accepted values are:
#                      - "beg" to insert at the beginning
#                      - "end" to insert at the end
#
# DEPENDS-ON:   myrmlistitems
#
##############################################################################
#
addtopath()
{
    a_directory="$1"
    a_position="$2"

    a_directory=`echo "$a_directory" | sed 's#/$##'`  # remove trailing slash

    # Add only existing directories
    [[ ! -d $a_directory ]] && return 1

    # If the directory is already in the path, remove it so that
    # it can be inserted in the desired position without
    # poluting $PATH with duplicates
    newpath=`echo $PATH | myrmlistitems "$a_directory" ':'`

    if [[ $a_position == beg ]]; then    # Prefix to $PATH
        export PATH=$a_directory:$newpath
    elif [[ $a_position == end ]]; then  # Append to $PATH
        export PATH=$newpath:$a_directory
    else
        return 1
    fi

    return 0
}

##############################################################################

##############################################################################
# Convenience wrappers for addtopath
#
pathappend()  { addtopath $1 end; return $?; }
pathprepend() { addtopath $1 beg; return $?; }
#
##############################################################################

##############################################################################
#
# FUNCTION:     delfrompath
#
# DESCRIPTION:  Delete a directory from the $PATH enviroment variable.
#
# PARAMETERS:   1 (r): Directory to delete
#
# DEPENDS-ON:   myrmlistitems
#
##############################################################################
#
delfrompath()
{
    a_directory="$1"

    export PATH=`echo $PATH | myrmlistitems "$a_directory" ':'`
}
##############################################################################
# }}}

pathprepend "$HOME/.bin"
pathprepend "$HOME/bin"
pathprepend "$HOME/.local/bin"

