FROM joshuacox/steamer
MAINTAINER James S. Moore <james 'at' webtechhq com>

USER root
ENV 7DAYSTODIE_UPDATED 20150611

# override these variables in your Dockerfile
ENV STEAM_USERNAME anonymous
ENV STEAM_PASSWORD ' '
ENV STEAM_GUARD_CODE ' '
# and override this file with the command to start your server
USER root
ADD ./run.sh /run.sh
RUN chmod 755 /run.sh
# Override the default start.sh
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

USER steam
# Create the directories used to store the profile files and Arma3.cfg file
RUN mkdir -p "~/.local/share/7 Days To Die"

# RUN rm -Rf /home/steam/steamcmd
WORKDIR /home/steam
RUN wget http://gameservermanagers.com/dl/sdtdserver
RUN chmod +x sdtdserver
# WORKDIR /home/steam/steamcmd/sdtd

ENTRYPOINT ["/start.sh"]