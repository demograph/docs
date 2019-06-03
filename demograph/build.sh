# Remove GA configuration
cp book.json book.json.backup
jq 'del(.pluginsConfig.ga.configuration)' book.json.backup > book.json

# Install Gitbook plugins
gitbook install

# Build Gitbook
gitbook build

# Restore configuration
rm book.json
mv book.json.backup book.json