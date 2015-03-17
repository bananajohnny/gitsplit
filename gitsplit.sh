#!/bin/bash

echo "Come si chiama il tuo modulo? "
read name;

echo "Percorso per repo git locale? "
read local_repo_path

echo "URL del repo git remoto?"
read remote_repo_url

echo "Percorso a dove sta ora il codice?"
read local_code_path

echo "Creo repo git locale.."

mkdir $local_repo_path
pushd $local_repo_path
    git init --bare
popd

git subtree split --prefix=$local_code_path -b $name
git push $local_repo_path $name:master

pushd $local_repo_path
    git remote add origin $remote_repo_url
    git push origin master
popd

echo "Rimuovo codice vecchio.."
git rm -rf $local_code_path
git commit -am "Removed split $name module"

echo "Aggiungo un remote al repo del modulo.. (si chiamerà $name)"
git remote remove $name
git remote add $name $remote_repo_url

echo "Aggiungo subtree.."
git subtree add --prefix=$local_code_path --squash $name master
git subtree pull --prefix=$local_code_path --squash $name master

echo "REMINDER"
echo "-------------"
echo "per aggiornare da qua il modulo: git subtree pull --prefix=$local_code_path --squash $name master"
echo "per scrivere upstream  git subtree push --prefix=$local_code_path --squash $name master"
echo "-------------"
