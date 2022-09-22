
declare -A path
declare -A vpath #Virtualenv path

# project absulate location
mnt_d='/mnt/d'
dj_path=$mnt_d'/Django'
bash_path=$mnt_d'/bash'

path['django']=$dj_path
path['real']=$dj_path'/real'
path['bash']=$bash_path
path['workon']=$bash_path'/Workon_bash'

# Virtualenv path 

vpath['real']=${path[real]}'/env/bin/activate'

function checking_p()
{
    for key in ${!path[@]}
    do
        #echo $key $1
        if [ $key == $1 ]
        then
            return 1        
        fi
    done
    echo 'directory not found'
    return 0
}

function checking_v()
{
    for key in ${!vpath[@]}
    do
        #echo $key $1
        if [ $key == $1 ]
        then
            return 1        
        fi
    done
    echo 'virtualenv not found'
    return 0
}
activate(){
    source ${vpath[$1]}
}
if [ -z $1 ]
then
    echo 'input path or env name'
else
    checking_p $1 # path checking function
    if [ $? == 1 ]
    then
        cd ${path[$1]}
    fi

    checking_v $1 #Virtualenv checking function
    if [ $? == 1 ]
    then
        activate $1
    fi
fi

