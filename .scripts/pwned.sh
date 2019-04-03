pwned="/home/asc/torrent/complete/pwned-passwords-sha1-ordered-by-count-v4.txt"
read -s -p "Enter Password: " mypassword
PASS=pass
hash=$(echo -n $password | sha1sum | awk '{print $1}') 
echo ""
echo $hash
echo "-----"
echo $pwned
rg -i $hash $pwned

