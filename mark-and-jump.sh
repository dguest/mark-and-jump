# mark and jump commands

m(){
    pushd . > /dev/null
}
j(){
    pushd +1 &> /dev/null
}
k(){
    pushd -0 &> /dev/null
}
p(){
    popd > /dev/null
}
l(){
    dirs -v
}
u(){
    local RM_LINES=($(dirs -v | awk 'seen[$2]++ {print $1}' | sort -nr))
    local NUMBER
    for NUMBER in ${RM_LINES[*]}; do
        popd +${NUMBER} > /dev/null
    done
}
save-dir-stack(){
    local DIR_STACK=${DIRECTORY_STACK_FILE-~/.WORKING_DIRECTORY_STACK}
    dirs -l -v | head -n${1-100} | sort -nr | awk '{print $2}' > ${DIR_STACK}
}
load-dir-stack(){
    local DIR_STACK=${DIRECTORY_STACK_FILE-~/.WORKING_DIRECTORY_STACK}
    dirs -c
    local PDIR
    if [[ ! -f ${DIR_STACK} ]]; then
        return 0
    fi
    while read PDIR; do
        pushd -n $PDIR > /dev/null
    done < ${DIR_STACK}
    popd > /dev/null
}
