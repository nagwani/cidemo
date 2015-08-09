#git log

#!/bin/sh
#GITORIOUS_IDENTITY_FILE="~/.ssh/id_rsa"

#if [ "run" != "$1" ]; then
# exec ssh -i "$GITORIOUS_IDENTITY_FILE" -o "StrictHostKeyChecking no" "$@"
#fi

remote="indiacidemo@svn-4273.devcloud.hosting.acquia.com:indiacidemo.git"

echo "Mirroring to $remote"

export GITORIOUS_IDENTITY_FILE="mktemp /tmp/tmp/$RANDOM"
export GIT_SSH="$0"

cat >"$GITORIOUS_IDENTITY_FILE" <<EOF
YOUR SSH PRIVATE KEY

EOF
cat >"$GITORIOUS_IDENTITY_FILE.pub" <<EOF
YOUR SSH PUBLIC KEY

EOF

#echo git push --mirror "$remote"
git push --mirror "$remote"

rm -f "$GITORIOUS_IDENTITY_FILE"
rm -f "$GITORIOUS_IDENTITY_FILE.pub"

exit 0
