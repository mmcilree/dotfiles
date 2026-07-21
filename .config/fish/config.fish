if status is-interactive
    # Commands to run in interactive sessions can go here
end

function clear
    echo "⚠️  Use Ctrl+L instead of typing 'clear'!"
end

function fatanode
	ssh -t mmcilree@ssh1.dcs.gla.ac.uk ssh -t fatanode-$argv[1]
end

function fataepyc
	ssh -t mmcilree@ssh1.dcs.gla.ac.uk ssh -t fataepyc-$argv[1] 
end


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/matthewmcilree/.opam/opam-init/init.fish' && source '/Users/matthewmcilree/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
