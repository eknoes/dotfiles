FIELDS=SSID,BARS

LIST=$(nmcli --fields "$FIELDS" device wifi list | sed '/^--/d')
LINENUM=$(echo "$LIST" | wc -l)

# Get current
CURRSSID=$(nmcli --fields NAME,TYPE connection show --active | awk -F "[ ]{2,}" '/wifi/ {print $1}')
#HIGHLINE=$(echo  "$(echo "$LIST" | awk -F "[  ]{2,}" '{print $1}' | grep -Fxn -m 1 "$CURRSSID" | awk -F ":" '{print $1}') + 1" | bc )

SELECTION=$(echo -e "$LIST" | bemenu -p "WiFi" -l $LINENUM)

if [[ $? -eq 1 ]]; then
    exit 1;
fi


SELECTED_SSID=$(echo $SELECTION | sed  's/\s\{1,\}/\|/g' | awk -F "|" '{for (i=1; i <= NF-1; i++) print $i;}' | tr '\n' ' ' | sed 's/ $//')

# Check if connection exists
echo "Selected:*$SELECTED_SSID*"
if nmcli connection show | grep "$SELECTED_SSID" | awk -F "[ ]{2,}" '{for (i=1; i <= NF-3; i++) print $i;}' | grep "^$SELECTED_SSID$"; then
    echo "Using existing connection"
    nmcli connection up "$SELECTED_SSID"
else
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
fi

