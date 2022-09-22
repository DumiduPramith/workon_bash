a=bash:/mnt/d/bash:bash script coding file

IFS=':' read -ra AD <<< '$a'
for i in "${AD[@]}"
do
    echo i
done