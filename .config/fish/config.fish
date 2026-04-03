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
