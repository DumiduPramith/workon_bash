function chk_dir()
    {
        if [ -d $directry ] # Check directry exist or not
        then
            :
        else
            echo 'directry not available'
            return 1
        fi
    }

function inputname()
{
    echo 'Enter workon name'
    read workonName
    check_name workonName
}

function check_name()
{
    if [[ $workonName =~ ['!@#$%^&*()_+.']  ]]
    then
        echo 'Letters and Numbers Only Support'
        inputname #function
    fi
}

function addtofile()
{
    echo $directry
    echo $workonName
}

# return code 1 (exit)
if [ -f 'workon_path.sh' ]
then
    echo 'Enter Directory'
    read directry
    chk_dir
    if [ $? != 1 ]
    then
        inputname
        addtofile
    fi
fi

