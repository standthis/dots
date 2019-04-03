curl -vi https://mobile.twitter.com/Eskom_SA | 
    grep -i stage | 
    awk -F'Date:' '{ print $2 }' | 
    awk -F'<a href' '{ print $1 }' | 
    grep --color -i stage 

