# This script calls the home inhabitant and asks him about the fire
# First it asks him, if he is in the home
# yes -> if there is a fire
#   yes -> it calls callFireDepartment()
#   no -> abort and log
# no or no response -> it calls neighbours to ask if they could check
#   yes -> wait for the neighbours to check
#     fire -> it calls callFireDepartment()
#     no fire -> abort and log
#   no or no response -> it calls callFireDepartment()

# requires the following
# https://api.tropo.com/1.0/sessions?action=create
# &token=TOKEN
# &customerTelephone=14075551212
# &customerName=John+Dyer
# &msg=the+sky+is+falling

def callHomeInhabitant()

  call '+' + $customerTelephone

  say "Hello " + $customerName + ", we received note that your house may be on fire!"

  log "The home inhabitants are called " + $customerName

  owner_at_home = ask "Are you at home?", {
    :choices => "yes, no"}

  say "You said " + owner_at_home.value

  log "The inhabitants are at home: " + owner_at_home.value


end




def callNeighbours()


end




def callFiredepartment()

end