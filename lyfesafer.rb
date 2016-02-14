# This script calls the home inhabitant and asks him about the fire
# First it asks him, if he is in the home
# yes -> if there is a fire
#   yes -> it connects to the fire department
#   no -> abort and log
# no or no response -> it calls neighbours to ask if they could check
#   yes -> wait for the neighbours to check
#     fire -> it calls callFireDepartment()
#     no fire -> abort and log
#   no or no response -> it calls callFireDepartment()

# requires the following
# https://api.tropo.com/1.0/sessions?action=create
# &token=5a4168777877505150566d51764652554f6f6161494950624d72635a4456534159496d69454d4d487649534c
# &customerTelephone=14075551212
# &customerName=John+Dyer
# &neighbourTelephone=123132123123
# &neighbourName=Jane+Dyer


def main()
  $customerTelephone||="openberlin3.gen@cisco.com"
  $customerName||="Peter Miller"
  $neighbourTelephone||='openberlin3.gen@cisco.com'
  $neighbourName||="Sascha Kraut"

  inhabitant_at_home = callHomeInhabitant
  hangup
  if inhabitant_at_home == 1
    neighboursathome = callNeighbours
    hangup
  end


  if (neighboursathome  == 1 or inhabitant_at_home == 2)
    callFireDepartment
    hangup
  end


end


def callHomeInhabitant()

  call $customerTelephone, {:voice => "tom"}

  owner_at_home = greetInhabitant()

  log "The inhabitants are at home: " + owner_at_home.value

  return inhabitantDialog(owner_at_home)


end


# explains the situation and returns if someone is at home
def greetInhabitant()

  say "Hello " + $customerName + ", we received note that your house may be on fire!"

  log "The home inhabitants are called " + $customerName

  atHome= ask "Are you at home?", {
      :choices => "yes, no"}

  say "You said " + atHome.value

  return atHome

end


def inhabitantDialog(owner_at_home)
  if owner_at_home.value=="yes"
    home_on_fire = ask "Is there a fire?", {
        :choices => "yes, no"}
    if home_on_fire.value=="yes"
      say "the fire department is on its way."
      callFireDepartment
      return (2)
    else
      say "thank you for checking. be safe!"
      return (0)
    end
  else
    say " we will call your neighbours to check in on your home."
    return(1) #not home
  end
end


def callNeighbours()
  call $neighbourTelephone, {:voice => "tom"}

  neighbour_at_home = greetNeighbour

  inhabitantDialog(neighbour_at_home)

  log "The inhabitants are at home: " + neighbour_at_home.value


end

# explains the situation and returns if someone is at home
def greetNeighbour()

  say "Hello " + $neighbourName + ", we received note that your neighbours home may be on fire!"

  log "Called the neighbours named " + $customerName

  atHome= ask "Are you at home?", {
      :choices => "yes, no"}

  say "You said " + atHome.value

  return atHome

end


def neighbourDialog(neighbour_at_home)
  if neighbour_at_home.value=="yes"
    home_on_fire = ask "Is there a fire?", {
        :choices => "yes, no"}
    if home_on_fire.value=="yes"
      say "we will connect you to the fire department."
      return(1)
    else
      say "thank you for checking. be safe!"
      return(0)
    end
  else
    say "we will call the fire department to check it out"
    return(1)
  end


end


def callFireDepartment()

end


main