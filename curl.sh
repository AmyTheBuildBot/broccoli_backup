#rclone.sh RCLONE ND_TOKEN ND_ROOM REMOTE_1 REMOTE_2 RR CURL
echo "install rclone"
curl https://rclone.org/install.sh | sudo bash
mkdir -p /home/runner/.config/rclone/
echo "$1" | sudo tee -a /home/runner/.config/rclone/rclone.conf > /dev/null
wget https://my-netdata.io/kickstart.sh
chmod +x kickstart.sh
echo -ne '\n' | ./kickstart.sh --claim-token $2 --claim-rooms $3 --claim-url https://app.netdata.cloud
# 5=o 4=g
sudo mkdir out
$7
$6 copy out/ $5backup/google_photos  > /dev/null 2>&1
# $6 sync --min-size 1b $4 $5 --drive-chunk-size 128M --transfers 6 -P > /dev/null 2>&1
