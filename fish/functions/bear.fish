function bear 
   set -e date
   setenv date (date +%F)
   echo \# Memo $date >> ~/Dropbox/Bear/$date.md
   vim  ~/Dropbox/Bear/$date.md
 end
