# /bin/bash

wget https://sourceforge.net/projects/leanote-bin/files/2.6.1/leanote-linux-amd64-v2.6.1.bin.tar.gz/download -o leanote/leanote.tar.gz
cd leanote
tar xvf  leanote.tar.gz
cd ..
mv leanote/leanote/conf/app.conf leanote/leanote/conf/app.conf.bak
sed  's/db.host=127.0.0.1/db.host=mongo/g'  leanote/leanote/conf/app.conf.bak >  leanote/leanote/conf/app.conf
docker cp leanote/leanote/mongodb_backup/leanote_install_data leanote_mongo:/tmp
docker exec leanote_mongo mongorestore -h localhost -d leanote --dir /tmp/leanote_install_data