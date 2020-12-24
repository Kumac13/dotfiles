function bear 
   set -e date
   setenv date (date +%F)
   echo \# Memo $date >> ~/Bear/$date.md
   vim  ~/Bear/$date.md
 end
