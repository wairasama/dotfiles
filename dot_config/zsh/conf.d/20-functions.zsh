htb-copy() {
    local vpn_file

    vpn_file=$(ls -t ~/Downloads/*.ovpn 2>/dev/null | head -n1)

    if [[ -z "$vpn_file" ]]; then
        echo "❌ No .ovpn file found."
        return 1
    fi

    echo "📦 Copying $(basename "$vpn_file") to Kali..."

    scp "$vpn_file" kali:~/Projects/htb/vpn/lab.ovpn

    echo "✅ VPN profile updated."
}


htb-connect() {
    ssh -t kali '
        if [[ ! -f ~/Projects/htb/vpn/lab.ovpn ]]; then
            echo "❌ No VPN profile found."
            exit 1
        fi

        sudo openvpn ~/Projects/htb/vpn/lab.ovpn
    '
}
