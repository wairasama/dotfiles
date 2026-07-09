htb-copy() {
    local vpn_file

    vpn_file=$(find "$HOME/Downloads" -maxdepth 1 -type f -iname "*.ovpn" -print -quit)

    if [[ -z "$vpn_file" ]]; then
        echo "❌ No .ovpn file found in ~/Downloads"
        return 1
    fi

    echo "🔍 Checking for existing VPN profile..."

    ssh kali '
        if [[ -f ~/Projects/htb/vpn/lab.ovpn ]]; then
            rm ~/Projects/htb/vpn/lab.ovpn
            echo "🗑️ Removed old lab.ovpn"
        else
            echo "ℹ️ No existing VPN profile found"
        fi
    ' || {
        echo "❌ Failed to connect to Kali."
        return 1
    }

    echo "📦 Copying $(basename "$vpn_file")..."

    scp "$vpn_file" kali:~/Projects/htb/vpn/lab.ovpn || {
        echo "❌ Copy failed."
        return 1
    }

    echo "✅ VPN profile updated."
    }	
htb-connect() {
    ssh -t kali '
        if [[ ! -f ~/Projects/htb/vpn/lab.ovpn ]]; then
            echo "❌ No VPN profile found."
            exit 1
        fi

        echo "󰓥 Starting HTB VPN..."
        sudo openvpn ~/Projects/htb/vpn/lab.ovpn
    '
}

kali() {
    local kitty_socket="${KITTY_LISTEN_ON#unix:}"

    if [[ -n "$kitty_socket" ]]; then
        kitty @ --to "unix:$kitty_socket" set-colors \
            ~/.config/kitty/themes/neowave.conf
    fi

    ssh kali

    if [[ -n "$kitty_socket" ]]; then
        kitty @ --to "unix:$kitty_socket" set-colors \
            ~/.config/kitty/themes/current-theme.conf
    fi
}
