#!/bin/bash
#install findomain
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget -c https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
					sudo tar -xvf go1.13.4.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac
done
fi

go get -u -v github.com/ffuf/ffuf
go get -u -v github.com/tomnomnom/httprobe
go get -u -v github.com/lc/gau
go get -u -v github.com/tomnomnom/unfurl
sudo apt-get install -y jq
sudo apt-get install -y xargs

#install findomain
if [[ findomain == *"findomain" ]];then
echo "Ok, Findomain tool is installed";
else
echo "Tool is not installed, would you like to install it?"
PS3="Please select an option"
choices=("Yes" "no")
select choice in "${choices[@]}"; do
case $choice in
         Yes)
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
chnmod +x findomain-linux
mv findomain-linux /usr/bin/findomain
sleep 1
break
;;
         no)
echo "Please install findomain or move findomain to bin folder"
exit 1
;;

esac

done
fi
