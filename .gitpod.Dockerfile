FROM gitpod/workspace-full-vnc

# See: https://askubuntu.com/a/1396918
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" | sudo debconf-set-selections
RUN sudo apt-get update && sudo apt-get install -y wireshark pulseview

# Install riscv32-esp-elf-gdb and add to path
RUN cd ~ && curl -L https://github.com/espressif/binutils-gdb/releases/download/esp-gdb-v14.2_20240403/riscv32-esp-elf-gdb-14.2_20240403-x86_64-linux-gnu.tar.gz | tar xzf -
RUN ln -s ~/riscv32-esp-elf-gdb/bin/riscv32-esp-elf-gdb ~/.local/bin

COPY --chown=gitpod Desktop/* /home/gitpod/Desktop/
