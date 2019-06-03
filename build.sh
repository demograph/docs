
function build() {
    pushd $1
    ./build.sh

    mkdir -p ../_book/$1
    mv _book ../_book/$1/

    # attempt to serve all files from one folder, for much improved caching
    # mv _book/index.html _book/$1.html
    # cp -R _book/* ../_book
    popd
}

# Create single publication folder
rm -r _book/*

# Ensure gitbook is installed
npm install -g gitbook-cli

build webmesh
build odin
build demograph

cp index.html _book
cp index.js _book