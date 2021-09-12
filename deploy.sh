#!/bin/bash

hugo && rsync -avz --delete public/ zlomek.irth.pl:/srv/http/homepage/