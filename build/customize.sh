#!/system/bin/sh

test -z /system/local/share/.yarn/bin/yarn && ui_print "? Yarn was not found! There can some issues while the install."
test -z /system/bin/node && abort "! Node.js isn't installed, please install Node.js to install this module."

EXEC="$(
    cat <<EOF
$(cat $MODPATH/addon/utils.js)
$(cat $MODPATH/addon/print.js)
$(cat $MODPATH/customize.js)
EOF
)"

node -e "$EXEC"
