htb-copy() {
    local vpn_file

    vpn_file=$(find ~/Downloads -maxdepth 1 -type f -name "*.ovpn" | head -n1)

    if [[ -z "$vpn_file" ]]; then
        echo "❌ No .ovpn file found in ~/Downloads"
        return 1
    fi

    echo "📦 Copying $(basename "$vpn_file")..."

    scp "$vpn_file" kali:~/Projects/htb/vpn/lab.ovpn

    if [[ $? -eq 0 ]]; then
        echo "✅ VPN profile copied."
    else
        echo "❌ Copy failed."
    fi
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


htb-status() {
    if ip link show tun0 >/dev/null 2>&1; then
        echo "✅ HTB VPN Connected"
        ip -brief addr show tun0
    else
        echo "❌ HTB VPN Disconnected"
    fi
}


htb-disconnect() {
    ssh kali "sudo pkill openvpn"
}
