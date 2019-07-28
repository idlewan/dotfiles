function ssa -w ssh-add --description 'alias ssa=ssh-add ~/.ssh/id_ed25519'
    ssh-add -l;
    ssh-add $MY_SSH_KEY $argv;
end
