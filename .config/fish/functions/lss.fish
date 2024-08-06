function lss --wraps='exa -lahF --icons --color always --group-directories-first -s modified -r' --description 'alias lsm exa -lahF --icons --color always --group-directories-first -s modified -r'
  exa -lahF --icons --color always --group-directories-first -s modified -r $argv
        
end
