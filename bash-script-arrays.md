```
a=('orange' 'pear')
item='apples'
a+=("${item}")
echo ${a[2]}
> apples
```
Array building.

```
values_array=${a[@]}
first_three_letters=${a[2]:0:3}
# Returns 'app' from third item
```
Slicing example.

```
global_arr=()
cat /etc/sudoers | while read -r line
do
	global_arr+=("$line")
	echo 'Total Lines: '${#global_arr[@]}
	> Total Lines: 1
	> Total Lines: 2
	> ...
done
echo 'Total Lines: '${#global_arr[@]}
# Array building and shell
# expansion $(bash cmd...)
# does NOT work in
# a while loop!
> Total Lines: 0
```
Non working loop array example.


```
sudoers_a=$(cat /etc/sudoers)
for line in ${sudoers_a[@]}
do
	global_arr+=("$line")
	echo 'Total Lines: '${#global_arr[@]}
	> Total Lines: 1
	> Total Lines: 2
	> ...
done
echo 'Total Lines: '${#global_arr[@]}
> Total Lines: 10
# Array building WORKS in a for
# loop!
```
Working loop example.





