# Use Kali Linux as the base image
FROM kalilinux/kali-linux-docker

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure SSH
RUN echo 'root:root' | chpasswd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD service ssh start && tail -f /dev/null
