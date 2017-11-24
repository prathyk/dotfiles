
apt-get install build-essential ruby ruby-dev nodejs git 
ln -s /usr/bin/nodejs /usr/bin/node
apt-get install npm
npm install -g localtunnel

apt-get install python3
apt-get install ffmpeg imagemagick python3-unidecode lame flac vorbis-tools

git clone --branch devel git://github.com/devsnd/cherrymusic.git /sdcard/cherry
cd /sdcard/cherry/cherrymusic
python cherrymusic --help
vim /home/.config/cherrymusic/cherrymusic.conf
python cherrymusic --update
python cherrymusic --port 8080
