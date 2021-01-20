export CAF_REVISION_TAG=$(grep "default revision" ".repo/manifests/default.xml" | awk -F '/' '{print $3}' | awk -F '"' '{print $1}')

# SDClang Environment Variables
export SDCLANG_CONFIG=$(pwd)/vendor/conquer/sdclang/sdclang.json
