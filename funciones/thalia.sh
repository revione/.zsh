# ./server.sh local-s1 nocibe.fr shop development

fr () {
   local environment="${1:-app}"
   ./server.sh local-s1 nocibe.fr "$environment" development
}

de () {
    local environment="${1:-app}"
    ./server.sh local-s1 douglas.de "$environment" development
}

it () {
    local environment="${1:-app}"
    ./server.sh local-s1 douglas.it "$environment" development
}

be () {
    local environment="${1:-app}"
    ./server.sh local-s1 douglas.be "$environment" development
}