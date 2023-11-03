# Python Cheat Sheet
Commonly used python patterns

## Virtual Environments
```
sudo apt install virtualenv python3-virtualenv
```
Install the above requirements.

```
cd ../my-project
```
Move outside your project folder.

```
virtualenv -p python3 my-project
```
Initialize your project with python3.


```
cd my-project
source bin/activate
```
Activate your terminal session so that you are inside your virtual python3 environment.

```
pip list
...
```
Check your installed libraries inside your virtual environment

```
pip freeze > requirements.txt
```
Freeze the current libraries into a requirements.txt file.


```
pip install -r requirements.txt
```
Install current requirements.txt file


