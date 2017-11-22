#!/bin/bash

find PRJ_NAME -name ".DS_Store" | xargs rm && \
tar cvf piasy_android_simple_lib.tar PRJ_NAME
