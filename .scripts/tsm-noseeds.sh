
while true; do 
    dling=$(transmission-remote -tall --info | grep "^  State:" | grep "Down" | wc --lines)
    if [ $dling == '0' ]
    then 
        echo SEEDS
        echo Stopping all 
        transmission-remote -t all -S 
        exit 1
    else
        echo $(date)
        echo dling
        sleep 60
        clear
    fi 
done

