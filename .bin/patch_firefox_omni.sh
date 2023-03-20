#!/bin/sh

cp /usr/lib/firefox/browser/omni.ja /tmp/omni.ja
cd /tmp
unzip -q omni.ja -d firefox_omni

patch -p0 < `dirname $0`/omni.ja.99.patch

cd firefox_omni
zip -qr0XD ../omni.ja.new *

cd ..
rm -rf firefox_omni
find ~/.cache/mozilla/firefox -type d -name startupCache | xargs rm -rf

sudo mv omni.ja.new /usr/lib/firefox/browser/omni.ja
