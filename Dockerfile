# Jenkins.
FROM nginx:1.8.1

MAINTAINER Michal @ Revolution Generation <michal@revolutiongeneration.co.uk>

# Install dependencies
RUN apt-get update && apt-get install -y vim-nox git

# Install monster ui
WORKDIR /usr/share/nginx/html/
RUN rm *
RUN git clone https://github.com/2600hz/monster-ui.git ./

# Install apps
WORKDIR apps/
RUN git clone https://github.com/2600hz/monster-ui-voip.git -b 3.22
RUN git clone https://github.com/2600hz/monster-ui-callflows.git -b 3.22
RUN git clone https://github.com/2600hz/monster-ui-pbxs.git -b 3.22
RUN git clone https://github.com/2600hz/monster-ui-webhooks.git -b 3.22
RUN git clone https://github.com/2600hz/monster-ui-numbers.git -b 3.22
RUN git clone https://github.com/2600hz/monster-ui-accounts.git -b 3.22

RUN ln -s monster-ui-voip/ voip
RUN ln -s monster-ui-callflows/ callflows
RUN ln -s monster-ui-pbxs/ pbxs
RUN ln -s monster-ui-webhooks/ webhooks
RUN ln -s monster-ui-accounts/ accounts
RUN ln -s monster-ui-numbers/ numbers

# Todo init apps - we have to do it manually at the moment
# Go to metadata/app.json and put it into master account database -> app store view -> crossbar

# Start
COPY start.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/start.sh

EXPOSE 80
RUN service nginx start

CMD ["/bin/bash"]
