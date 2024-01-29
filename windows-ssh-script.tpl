add-content -path c:/users/BarryAwure/.ssh/config -value @'

Host ${user}
   HostName ${hostname}
   User ${user}
   IdentityFile ${IdentityFile}
'@