#!/bin/bash

cd /monochords/ && git pull && docker-compose exec -T app bundle install && docker-compose exec -T app rails assets:precompile