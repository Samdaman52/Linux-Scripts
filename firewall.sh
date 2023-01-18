#!/usr/bin/bash
which apt && {
    echo "Apt Found!"
    apt install --yes firewalld
}

which yum && {
    echo "Yum Found!"
    yum install -y firewalld
}

systemctl enable --now firewalld
systemctl status firewalld

if [ -d /etc/firewalld/zones ]; then
    rm -rf /etc/firewalld/zones/*
elif [ -d /usr/etc/firewalld/zones ]; then
    rm -rf /usr/etc/firewalld/zones/*
else
    echo "Firewalld not found" 
    exit 1
fi

firewall-cmd --complete-reload
firewall-cmd --remove-service=ssh

select opt in "ecomm" "web"; do
    case $opt in
        "ecomm")
            echo "You chose ecomm"
            firewall-cmd --add-port=80/tcp
            break
            ;;
        "web")
            echo "You chose web"
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done