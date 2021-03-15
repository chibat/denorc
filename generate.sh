#!/bin/sh

if [ -e ./.denorc ]
then
  echo 'denow already exists.'
  exit 1
fi

if [ $# -eq 0 ]; then
  version=$(
    curl -sSf https://github.com/denoland/deno/releases |
      grep -o "/denoland/deno/releases/download/.*/deno-" |
      head -n 1 |
      sed 's/\/deno-$//' |
      sed 's/^\/denoland\/deno\/releases\/download\///'
  )
  if [ ! "$version" ]; then
    echo "Error: Unable to find latest Deno release on GitHub." 1>&2
    exit 2
  fi
else
  version="${1}"
fi

cat << 'EOT' | sed "s/__VERSION__/$version/" > ./.denorc
VERSION=__VERSION__

export DENO_INSTALL=$HOME/.deno_versions/$VERSION
if [ ! -f $DENO_INSTALL/bin/deno -o "$(deno -V)" != "deno $VERSION" ]
then
	  curl -fsSL https://deno.land/x/install/install.sh | sh -s v$VERSION
fi
export PATH="$DENO_INSTALL/bin:$PATH"
deno --version

EOT

echo "'.denorc' was generated."

