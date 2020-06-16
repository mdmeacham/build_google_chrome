command -v wget || { echo "This script needs the wget program to fetch the latest google-chrome-stable. exiting."; exit 1; }

rm *.deb
rm -fr google-chrome-browser

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
[ -e google-chrome-stable_current_amd64.deb ] || { echo "Failed to download latest google-chrome-stable. Exiting."; exit 1; }

VERSION=$(dpkg -I google-chrome-stable_current_amd64.deb | grep Version | sed -e "s/^.*Version: //")
rm -fr results-$VERSION
mkdir results-$VERSION

dpkg -x google-chrome-stable_current_amd64.deb google-chrome-browser
mkdir -p google-chrome-browser/userhome/.config/google-chrome
tar cjvf results-$VERSION/google-chrome-browser_$VERSION.tar.bz2 google-chrome-browser custompart-google-chrome-browser

cat << EOF > results-$VERSION/google-chrome-browser_$VERSION.inf
[INFO]
[PART]
file="google-chrome-browser_$VERSION.tar.bz2"
version="$VERSION"
size="300M"
name="google-chrome-browser"
minfw="10.05.100".
EOF

python3 fill_in_profile.py $VERSION > results-$VERSION/profile.xml


