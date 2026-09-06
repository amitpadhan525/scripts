if [ -z $@ ]; then 
  echo "No argument is passed."
  exit 1
fi 

for domain in "$@";do 
 echo "---- $domain ----"
 dig "$domain" A +short
done 
