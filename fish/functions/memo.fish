# vim用のメモを取るためのスクリプト

function memo

   set -e date
   setenv date (date +%F)

   # 引数がない場合は，その日付のファイルを作成する 
   if test -d $argv
      if test -f ~/dropbox/bear/$date.md 
          vim  ~/dropbox/bear/$date.md
      else 
          echo \# memo $date >> ~/dropbox/bear/$date.md
          vim  ~/dropbox/bear/$date.md
      end
   # 引数があるときは，その名前のファイルを作成する
   else
      if test -f ~/dropbox/bear/$argv.md 
          echo \# memo $date >> ~/dropbox/bear/$argv.md
          vim  ~/dropbox/bear/$argv.md
      else 
          echo \# memo $date >> ~/dropbox/bear/$argv.md
          vim  ~/dropbox/bear/$argv.md
      end
   end
 
 end
