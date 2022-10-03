#Check if git is installed
if ! command -v git &> /dev/null
then
    echo "Error: git could not be found. Please install git on your distro"
    exit
fi
#Clone the repo
git clone https://github.com/carloalbertogiordano/Trello-wrapper-unofficial.git
#Move it to right location
sudo mv Trello-wrapper-unofficial /usr/bin/Trello-wrapper-unofficial
#Install electron in the correct directory
package='electron'
npm install --prefix /usr/bin/Trello-wrapper-unofficial/ $package --no-shrinkwrap > /dev/null

#Create runner
echo "(cd /usr/bin/Trello-wrapper-unofficial && npm start && cd)" >> run.sh
chmod +x run.sh
sudo mv run.sh /usr/bin/Trello-wrapper-unofficial/run.sh

#add icon
sudo cp ico.png /usr/bin/Trello-wrapper-unofficial/ico.png

#Create desktop file
touch trello-unofficial.desktop
echo "[Desktop Entry]" > trello-unofficial.desktop
echo "Type=Application" >> trello-unofficial.desktop
echo "Name=Trello Unofficial" >> trello-unofficial.desktop
echo "Comment=An unofficial trello wrapper" >> trello-unofficial.desktop
echo "Exec=/usr/bin/Trello-wrapper-unofficial/run.sh" >> trello-unofficial.desktop
echo "Icon=/usr/bin/Trello-wrapper-unofficial/ico.png" >> trello-unofficial-desktop
echo "Terminal=false" >> trello-unofficial.desktop
echo "Categories=Office" >> trello-unofficial.desktop
sudo mv trello-unofficial.desktop  ~/.local/share/applications/trello-unofficial.desktop