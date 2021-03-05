grep --line-buffered -m 3 "refs/tags" manifest/default.xml | awk -F '/' '{print $3}' | awk -F '"' '{print $1}' | tail -n 1
