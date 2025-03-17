#!/bin/bash

echo "This is a simple script to help you automate backing up of directories.
"

read -p "what is your name?: " name
echo ""

echo "Welcome $name, I will guide you through, all you need to do is follow my instructions.
"

read -p "absolute path of directory you want to backup: " src_dir
echo " "
read -p	"absolute path of directory you	want to store your backup: " tgt_dir

curr_timestamp=$(date "+%Y-%m-%d-%H-%M-%S")

echo "loading....."
sleep 2
echo "almost done...."

tar zvcf $tgt_dir/$curr_timestamp.tgz $src_dir

echo "Backup Successfull!!!"



