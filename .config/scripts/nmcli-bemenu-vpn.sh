LIST=$(nmcli --fields NAME,TYPE connection show | awk -F "[ ]{2,}" '$2 ~ /vpn/ {print $1}')
LINENUM=$(echo "$LIST" | wc -l)

# Get current
CURRENT=$(nmcli --fields NAME,TYPE connection show --active | awk -F "[ ]{2,}" '$2 ~ /vpn/ {print $1}')
SELECTION=$(echo -e "$LIST" | bemenu -p "VPN" -l $LINENUM)

if [[ $? -eq 1 ]]; then
    exit 1;
fi


SELECTED_VPN=$(echo $SELECTION | sed  's/\s\{1,\}/\|/g' | awk -F "|" '{for (i=1; i <= NF-1; i++) print $i;}' | tr '\n' ' ' | sed 's/ $//')

# Check if connection exists
echo "Selected VPN: *$SELECTED_VPN*"

GET_INPUT=true
while $GET_INPUT; do
    PASSWORD=$(echo "Please enter the Password for $SELECTED_SSID" | bemenu -p "Password: " -l 2)
    if [ $? -eq 1 ]; then
        GET_INPUT=false
        echo "Abort"
    else
        nmcli dev wifi con "$SELECTED_SSID" password "$PASSWORD"
        if [ $? -eq 0 ]; then
            GET_INPUT=false
        fi
    fi
done
