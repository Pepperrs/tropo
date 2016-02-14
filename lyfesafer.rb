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



def callHomeInhabitant(){

}