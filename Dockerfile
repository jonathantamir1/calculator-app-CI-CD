FROM jenkins/jenkins:lts
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
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
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt