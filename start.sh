#!/bin/sh

LIBS="$1"
if ["$LIBS" == ""]; then
  LIBS=/tmp
  echo "Empty argument using /tmp as library path."
fi

docker build -q -t witch - < Dockerfile
docker run -it \
   --mount type=bind,source="$LIBS",destination=/libs,consistency=cached \
   witch bash

