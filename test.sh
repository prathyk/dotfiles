#!/bin/bash

docker run -ti \
      -v/home/talip1/dotfiles:/root/stow \
        registry.gitlab.com/waterkip/stowing:latest bash
