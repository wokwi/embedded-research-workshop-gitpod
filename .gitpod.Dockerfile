FROM gitpod/workspace-full-vnc

# See: https://askubuntu.com/a/1396918
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" | sudo debconf-set-selections
RUN sudo apt-get update && sudo apt-get install -y wireshark pulseview

COPY --chown=gitpod Desktop/* /home/gitpod/Desktop/
