#rclone.sh RCLONE ND_TOKEN ND_ROOM REMOTE_1 REMOTE_2
echo "install rclone"
curl https://rclone.org/install.sh | sudo bash
mkdir -p /home/runner/.config/rclone/
echo "$1" | sudo tee -a /home/runner/.config/rclone/rclone.conf > /dev/null
wget https://my-netdata.io/kickstart.sh
chmod +x kickstart.sh
# echo -ne '\n' | ./kickstart.sh --claim-token $2 --claim-rooms $3 --claim-url https://app.netdata.cloud
rclone copy --min-size 1b $4 $5 --drive-chunk-size 128M --transfers 25 -P > /dev/null 2>&1
