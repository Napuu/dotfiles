function repeat_previous_command --description 'repeat last command from history'
  eval $history[1]
  
  history --delete --exact --case-sensitive repeat_previous_command
end
