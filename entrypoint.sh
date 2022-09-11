#!/bin/sh -l

echo "\nHello.\n"

MTA_PLUGIN_URL=https://github.com/cloudfoundry-incubator/multiapps-cli-plugin/releases/latest/download/multiapps-plugin.linux64
CSPUSH_PLUGIN_VERSION=1.3.2
CSPUSH_PLUGIN_URL=https://github.com/dawu415/CF-CLI-Create-Service-Push-Plugin/releases/download/$CSPUSH_PLUGIN_VERSION/CreateServicePushPlugin.linux64

cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org
cf install-plugin -r CF-Community blue-green-deploy -f
cf install-plugin $MTA_PLUGIN_URL -f
cf install-plugin $CSPUSH_PLUGIN_URL -f
cf install-plugin -r CF-Community "html5-plugin" -f
cf plugins

cf login -a "$1" -o "$2" -u "$3"  -p "$4"  -s "$5"

cf deploy "$6" --retries 1

cf logout
