#!/bin/bash
docker build -t blockchain .                    
docker run -p 3000:3000 blockchain entrypoint.sh