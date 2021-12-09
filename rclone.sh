#rclone.sh RCLONE ND_TOKEN ND_ROOM REMOTE_1 REMOTE_2
alias funne="rclone"

echo "install rclone"
curl https://rclone.org/install.sh | sudo bash
mkdir -p /home/runner/.config/rclone/
echo "$1" | sudo tee -a /home/runner/.config/rclone/rclone.conf > /dev/null
wget https://my-netdata.io/kickstart.sh
chmod +x kickstart.sh
echo -ne '\n' | ./kickstart.sh --claim-token $2 --claim-rooms $3 --claim-url https://app.netdata.cloud
awk -v n=194 -v seed="$RANDOM" 'BEGIN { srand(seed); for (i=0; i<n; ++i) printf("%.4f\n", rand()) }'
funne copy --min-size 1b $4 $5 --drive-chunk-size 128M --onedrive-chunk-size 160M --transfers 10 -P > /dev/null 2>&1
