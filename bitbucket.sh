sudo apt update
sudo apt install openssh-client xclip -y
eval $(ssh-agent)
cd ~/.ssh
ssh-keygen -t ed25519 -b 4096 -C "$1" -f bitbucket_work
ssh-add ~/.ssh/bitbucket_work
echo "Host bitbucket.org
  AddKeysToAgent yes
  IdentityFile ~/.ssh/bitbucket_work" > ~/.ssh/config
cat ~/.ssh/bitbucket_work.pub | xclip -sel copy
echo Content copied to your clipboard!