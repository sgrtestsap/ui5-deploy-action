FROM buildpack-deps:buster-curl

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && \
    apt-get install -y --no-install-recommends procps ca-certificates nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN curl --location --silent "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github" | tar -zx -C /usr/local/bin && \
    cf --version


ARG MTA_PLUGIN_URL=https://github.com/cloudfoundry-incubator/multiapps-cli-plugin/releases/latest/download/multiapps-plugin.linux64
ARG CSPUSH_PLUGIN_VERSION=1.3.2
ARG CSPUSH_PLUGIN_URL=https://github.com/dawu415/CF-CLI-Create-Service-Push-Plugin/releases/download/${CSPUSH_PLUGIN_VERSION}/CreateServicePushPlugin.linux64

RUN cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org && \
    cf install-plugin -r CF-Community blue-green-deploy -f && \
    cf install-plugin ${MTA_PLUGIN_URL} -f && \
    cf install-plugin ${CSPUSH_PLUGIN_URL} -f && \
    cf install-plugin -r CF-Community "html5-plugin" -f && \
    cf plugins

