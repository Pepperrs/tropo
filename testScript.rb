call "openberlin3.gen@cisco.com"

$customerName= "peter"



say "Hello " + $customerName + ", we received note that your house may be on fire!", {:voice => "tom"}

log "The home inhabitants are called " + $customerName

owner_at_home = ask "Are you at home?", {
    :choices => "yes, no"}

say "You said " + owner_at_home.value, {:voice => "tom"}

if owner_at_home.value=="yes"
  home_on_fire = ask "Is there a fire?", {
      :choices => "yes, no", :voice =>"tom"}
  if home_on_fire.value=="yes"
    say "we will call the fire department", {:voice => "tom"}
  else
    say "thank you for checking. be safe!", {:voice => "tom"}
  end
else
  say " we will call your neighbours to check in on your home.", {:voice => "tom"}
end

log "The inhabitants are at home: " + owner_at_home.value
