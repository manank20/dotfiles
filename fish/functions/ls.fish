function ls --wraps='exa al' --wraps='exa -al' --description 'alias ls=exa -al'
  exa -al $argv; 
end
