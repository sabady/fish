function mcdir --description 'create and cd into folder'
  command mkdir -p $argv
  if test $status = 0
    cd $argv
    return
  end
end
