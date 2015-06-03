#!/bin/bash

set -x

for f in $(seq 1 3); do \
        docker run -i -t -d -e ZKID=${f} -e ZKENSEMBLE=1 -h zk${f} --name zk${f} zk_testbed /bin/bash; \
      done
