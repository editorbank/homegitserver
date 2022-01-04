#!/bin/sh
docker export homegitserver-container | tar -xf - git/* && ls -lA ./git
