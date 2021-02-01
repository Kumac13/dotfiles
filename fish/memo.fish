# vim用のメモを取るためのスクリプト
function memo

   cd ~/Dropbox/memo/
   set -e date
   setenv date (date +%F) # フルの日付
   setenv yearAndMonth (date +%Y-%m) # フォルダ用の月までの日付

   # 引数がない場合は，その日付のファイルを作成する 
   if count $argv > /dev/null
      if test -d ~/Dropbox/memo/$yearAndMonth
      echo  "$argvを作成しました"
         if test -f ~/Dropbox/memo/$yearAndMonth/$argv.md
             vim  ~/Dropbox/memo/$yearAndMonth/$argv.md
         else
             echo \# memo $date >> ~/dropbox/memo/$yearAndMonth/$argv.md
             vim  ~/dropbox/memo/$yearAndMonth/$argv.md
         end
      else
         mkdir ~/Dropbox/memo/$yearAndMonth
         echo \# memo $date >> ~/dropbox/memo/$yearAndMonth/$argv.md
         vim  ~/dropbox/memo/$yearAndMonth/$argv.md
      end
   # 引数があるときは，その名前のファイルを作成する
   else    
      if test -d ~/Dropbox/memo/$yearAndMonth
         if test -f ~/Dropbox/memo/$yearAndMonth/$date.md 
             vim  ~/Dropbox/memo/$yearAndMonth/$date.md
         else 
             echo \# memo $date >> ~/dropbox/memo/$yearAndMonth/$date.md
             vim  ~/dropbox/memo/$yearAndMonth/$date.md
         end
      else
         mkdir ~/Dropbox/memo/$yearAndMonth
         echo \# memo $date >> ~/dropbox/memo/$yearAndMonth/$date.md
         vim  ~/dropbox/memo/$yearAndMonth/$date.md
      end

   end
 end

function gmemo
   cd ~/Dropbox/memo/
end
