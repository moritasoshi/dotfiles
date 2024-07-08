# 
# https://github.com/sdkman/sdkman-cli/issues/294#issuecomment-318252058
#

# sdk command
function sdk
    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk $argv"
end

# add paths
for ITEM in $HOME/.sdkman/candidates/*
    set -gx PATH $PATH $ITEM/current/bin
end
