FROM jenkins/jenkins:lts

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

RUN jenkins-plugin-cli --plugins "\
blueocean docker-workflow \
matrix-auth \
authorize-project \
configuration-as-code \
git \
workflow-multibranch \
telegram-notifications \
github \
github-branch-source \
"

COPY jenkins_home/custom_config.xml /var/jenkins_home/config.xml
COPY scripts/init.groovy.d /usr/share/jenkins/ref/init.groovy.d/