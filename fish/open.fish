function open
  if test $argv
    explorer.exe $arg[1]
  else
    explorer.exe .
  end
end
