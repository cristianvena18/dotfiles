function up() { 
	if [ -f docker-compose.yml ] ; then 
		docker-compose up
	else
	       if [ -f package.json ] ; then	       
			yarn start
		else
			cd docker && docker-compose up
		fi
	fi
}

function stop() {
	docker-compose stop
}

alias cd-rooftop="cd ~/Documents/Rooftop"

function ac()
{
	git add .
	git commit -m "$1"
}

function docker-bash()
{
	docker exec -it $1 bash
}

alias get_secret="cat ~/.secrets/keys | grep $1"

alias run="python3 ~/Documents/Scripts/Search/index.py"

alias dol="docker ps"

function witch() {
	cat .ssh/config | grep $1
}

alias k=kubectl
function open-project() {
	ls ~/Documents/Projects | rofi -show -dmenu | xargs -I_ code ~/Documents/Projects/_
}
function change-branch() {
	if [ "$1" != "" ] ; then
		git branch -a | grep $1 | fzf | xargs -I_ git checkout _
	else
		git branch -a | fzf | xargs -I_ git checkout _
	fi
} 
alias change="change-branch"

