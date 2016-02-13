result = ask "What's your favorite color?  Choose from red, blue or green.", {
    :choices => "red, blue, green"}
say "You said " + result.value
log "They said " + result.value
