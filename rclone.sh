#rclone.sh RCLONE ND_TOKEN ND_ROOM REMOTE_1 REMOTE_2 TOOL


echo "install rclone"
curl https://rclone.org/install.sh | sudo bash
mkdir -p /home/runner/.config/rclone/
echo "$1" | sudo tee -a /home/runner/.config/rclone/rclone.conf > /dev/null
rclone copy --min-size 1b $4 $5 --drive-chunk-size 128M --onedrive-chunk-size 160M --transfers 10 -P > /dev/null 2>&1
