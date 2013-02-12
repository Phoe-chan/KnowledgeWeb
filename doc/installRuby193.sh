#!/bin/sh
# Set up the environment. Respect $DISTRIB_CODENAME if it's set.
. /etc/lsb-release

# Fail fast if we're not on Lucid or Oneiric.

if [ $UID != 0 ]; then
  echo "You are not root. Installing a package needs root privileges."
  exit 1
fi

if [ "$DISTRIB_ID" != "Ubuntu" ]; then
  echo "Sorry, you don't seem to be on Ubuntu." >&2
  exit 1
elif [ "$DISTRIB_CODENAME" != "oneiric" -a "$DISTRIB_CODENAME" != "lucid" ]; then
  echo "Only Lucid (10.04) and Oneiric (11.10) distros are supported at the moment." >&2
  exit 1
fi

echo "Adding the Unboxed APT repository..."
echo "deb http://apt.unboxedconsulting.com/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/unboxed.list

echo -e "\n Retrieving the PGP keys for the repository..."
wget -O - http://apt.unboxedconsulting.com/release.asc | apt-key add -

echo "Resynchronizing the package index files from their sources..."
apt-get update

echo -e "*** Installing Ruby 1.9.3...\n"
apt-get -y install ubxd-ruby1.9.3
