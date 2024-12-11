# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

FROM debian

RUN add-apt-repository ppa:deadsnakes/ppa && \
apt-get update && \
apt-get install -y python3.13 ffmpeg libopus libffi-dev && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*
RUN python3.13 pip install disopy
RUN mkdir -p /config

VOLUME ["/config"]

CMD ["disopy", "-c", "/config"]
