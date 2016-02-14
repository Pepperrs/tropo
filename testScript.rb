call "openberlin3.gen@cisco.com"

$customerName= "peter"

say "Hi, this is allison with life saver!", {:voice => "allison"}
say "Hi, this is ava with life saver!", {:voice => "ava"}
say "Hi, this is samantha with life saver!", {:voice => "samantha"}
say "Hi, this is susan with life saver!", {:voice => "susan"}
say "Hi, this is veronica with life saver!", {:voice => "veronica"}
say "Hi, this is vanessa with life saver!", {:voice => "vanessa"}
say "Hi, this is tom with life saver!", {:voice => "tom"}
say "Hi, this is victor with life saver!", {:voice => "victor"}




#
#
# say "Hello " + $customerName + ", we received note that your house may be on fire!"
#
# log "The home inhabitants are called " + $customerName
#
# owner_at_home = ask "Are you at home?", {
#     :choices => "yes, no"}
#
# say "You said " + owner_at_home.value
#
# if owner_at_home.value=="yes"
#   home_on_fire = ask "Is there a fire?", {
#       :choices => "yes, no"}
#   if home_on_fire.value=="yes"
#     say "we will call the fire department"
#   else
#     say "thank you for checking. be safe!"
#   end
# else
#   say " we will call your neighbours to check in on your home."
# end
#
# log "The inhabitants are at home: " + owner_at_home.value
