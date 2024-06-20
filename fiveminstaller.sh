echo 'FiveM Linux Installer'

apt update && apt upgrade

apt install xf tar

mkdir -p /home/FiveM/server
cd /home/FiveM/server

echo 'Geben Sie den Link zu den FiveM-Artifakten ein:'
read link
wget $link

echo 'Entpacken der FiveM-Dateien...'
tar xf fx.tar.xz
echo 'Artifacts installiert'

rm -r fx.tar.xz

echo 'Installieren von Screen...'
apt install screen


echo ' crontab wird installiert und eingerichtet'

(crontab -l 2>/dev/null; echo "@reboot /bin/bash /home/FiveM/server/run.sh > /home/FiveM/server/cron.log 2>&1") | crontab -

cd /home/FiveM/server && screen ./run.sh

echo 'Erfolgreich installiert! Jetzt müssen Sie in den Ordner cd /home/FiveM/server wechseln und die Datei run.sh ausführen --> ./run.sh'

echo 'Außerdem wurde ein Crontab erfolgreich installiert. Bei einen Server neustart wird FIveM/Tx Admin automatisch Gestartet.'

