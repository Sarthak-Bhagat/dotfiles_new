function ls --wraps=exa --wraps='exa -lahF --icons --color always --group-directories-first' --description 'alias ls exa -lahF --icons --color always --group-directories-first'
  exa -lahF --icons --color always --group-directories-first $argv
        
end
