#!/bin/sh
docker export homegitserver-container | tar -xf - --wildcards git/* && ls -lA ./git
