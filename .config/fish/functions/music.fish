function music --wraps=mpc\ load\ All\\\?\ \&\&\ mpc\ shuffle\ \&\&\ mpc\ play --description alias\ music\ mpc\ load\ All\\\?\ \&\&\ mpc\ shuffle\ \&\&\ mpc\ play
  mpc load All\? && mpc shuffle && mpc play $argv
        
end
