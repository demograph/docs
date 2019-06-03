if [ -z $1 ]; then
    echo "No book parameter provided"
    exit 1
fi

pushd $1
gitbook serve
popd $1