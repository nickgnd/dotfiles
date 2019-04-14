#!/bin/sh
#
# Use `zsh` as default shell
# (inspired by https://github.com/adharmawan/.dotfiles/blob/master/zsh/install.sh)

if [ $SHELL == "/usr/local/bin/zsh" ]; then
    echo "\nzsh is already the default shell. Moving on...\n"
else
    # check if /usr/local/bin/zsh is added to /etc/shells
    if [ ! -z $(cat /etc/shells | grep /usr/local/bin/zsh) ]; then
        echo "\n/usr/local/bin/zsh is added to /etc/shells. Moving on...\n"
    else
        # add /usr/local/bin/zsh to /etc/shells
        sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells' 
        if [ ! $? -eq 0 ]; then
            echo "Failed. trying other method..."
            sudo bash -c "echo /usr/local/bin/zsh >> /etc/shells"
            if [ !$? -eq 0 ]; then
                echo "Failed. Aborting..."
                exit 1
            fi
        fi
    fi
    # Set zsh as default shell
    chsh -s /usr/local/bin/zsh
    if [ ! $? -eq 0 ]; then
            echo Operation failed
            exit 1
    fi
    echo "\nSuccessfully changed default shell to zsh. Moving on....\n"
fi


        # echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells > /dev/null





