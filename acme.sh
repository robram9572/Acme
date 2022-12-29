#!/bin/bash


domainName="$1"

if [ -z "$1" ];then echo "域名不能为空";exit;fi

#安装依赖包
apt update -y 
apt install -y curl 
apt install -y socat

#安装acme.sh
curl https://get.acme.sh | sh -s email=my@example.com

#立刻加载修改后设置，使之生效
source ~/.bashrc

申请证书
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --issue -d "$domainName" --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d "$domainName" --key-file /root/private.key --fullchain-file /root/cert.crt --ecc
