#!/bin/bash
url=$1
curl --proto '=https' --tlsv1.3 -sSf $url 2>&1 > data

round=$(cat data | grep 'href="/contest/' | perl -nle 'm/\/contest\/\d+\">(.*)<\/a/; print $1' | head -n 1)
title=$(cat data | grep 'problem-statement' | grep '<div class="title">' \
    | perl -nle 'm/<div class="header"><div class="title">(.*)<\/div><div class="time-limit">/; print $1' | head -n 1)
description=$(cat data | grep 'problem-statement' | grep '<div class="title">' \
    | perl -nle 'm/<div>(.*)<\/div><div class="input-specification">/; print $1' \
    | sed -E 's/<\/?span[^>]*>//g' | sed -E 's/ *<[a-zA-Z]*>//g' \
    | sed 's/\$\$\$//g' | sed -E 's/<\/[a-zA-Z]+>/\n\n/g' \
    | fold -s -w 75 | sed -e :a -e '/^\n*$/{$d;N;ba' -e '}')
folder=$(echo $round | tr -d " " | grep -E '[[:upper:]|[:digit:]]' -o \
    | tr -d '\n' | tr '[:upper:]' '[:lower:]')
filename=$(echo $title | cut -d' ' -f1 | cut -d'.' -f1).cpp
echo "folder/filename: " $folder/$filename
mkdir -p $folder 
touch $folder/data.in

echo "#include<bits/stdc++.h>
using namespace std;
using ll=long long;
/*
$url

$round $title 

$description
*/" > $folder/$filename
echo 'void run(){
    // Welcome, your majesty.
}
int main(){
#ifdef WINE
    freopen("data.in","r",stdin);
#endif
    int T;scanf("%d",&T);
    while(T--){
        run();
    }
}' >> $folder/$filename
