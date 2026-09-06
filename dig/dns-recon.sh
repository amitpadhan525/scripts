if [ $# -eq 0 ]; then 
  echo "No argument is passed."
  exit 1
fi 

for domain in "$@";do 
 echo "-----------$domain -----------"
 echo "=========== A ================"
 dig "$domain" A +short
 echo "=========== MX ==============="
 dig "$domain" MX +short
 echo "=========== NS ==============="
 dig "$domain" NS +short
 echo "=========== TXT =============="
 dig "$domain" TXT +short
 
done 
