# Bash Cheat Sheet
Commonly used console commands.

## Multi-process Forking Pattern
```
f_fork_child () {
	# Inside child instance
	#	- limit variable use, use unique local vars
	#	- limit using global functions / variables
	#	- do not build arrays
	#	- limit for loops, favour while loops
	#	- persist data / rows uniquely in tmp disk, favour piping this to while loop
	# Child forks should ideally be fine grained helper instances that need to process many rows
	# Try not to fork complicated orchestrations
	DIR=$1
	GROUP=$2
	tmpf=/tmp/child-dirs-$(uuidgen).tmp
	find $DIR -type -f -maxdepth 1 | tee $tmpf
	cat $tmpf | while read -r line
	do
		chown root:$GROUP $line
	done
	shred --remove --force $tmpf
}

# Parent process
#	- spawn child instance until threshold is reached
#
ncpus=$(nproc)
me=$(whoami)
factor=1
threshold=$(( $ncpus * $factor ))
find /lib64 -type -d | while read -r pline
do
	fork_mem_count=$(ps -ef -o user,ppid,cmd -U $me | grep -e "$$" | grep -e
	"bash.*$0" | wc -l)
	echo 'Init Fork: pline='$pline
	while [ $fork_mem_count -ge $threshold ]
	do
		fork_mem_count=$(ps -ef -o user,ppid,cmd -U $me | grep -e "$$" | grep
		-e "bash.*$0" | wc -l)
		echo 'Fork Driver: Cpus='$ncpus', Forks='$fork_mem_count', Waiting for
		forks to completed...'
		sleep 5
	done
	echo 'Forked OK: pline='$pline
	f_fork_child "$pline" &
done

```
