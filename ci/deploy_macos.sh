#!/bin/bash
set -o errexit -o nounset -o pipefail
cd "`dirname $0`/.."

REVISION=$(./ci/revision.sh)
echo "Deploying skija-macos v${REVISION}"
cd native
sed -i "" -e "s/0.0.0-SNAPSHOT/$REVISION/g" -e "s/skija-native/skija-macos/g" pom.xml
mvn --batch-mode --settings ../ci/settings.xml -Dspace.username=Nikita.Prokopov -Dspace.password=${SPACE_TOKEN} deploy