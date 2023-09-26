# Bash Cheat Sheet
Commonly used console commands.

## Bash Parameter Flags Pattern
```
ARGS=("$@")
O_HELP=0
O_ASSUME_YES=0

for a in ${ARGS[@]}
do
	if [ "${a}" == '--help' ]; then O_HELP=1; fi
	if [ "${a}" == '-y' ]; then O_ASSUME_YES=1; fi
done

choice=''
while [ "${choice}" != 'C' ] && [ ${O_ASSUME_YES} -eq 0 ]
do
	read -p '(A)ccept changes? Or (Q)uit. : ' choice
	choice=$(echo ${choice} | tr a-z A-Z)
	if [ "${choice}" == 'Q' ]; then exit 0; fi
done
```
