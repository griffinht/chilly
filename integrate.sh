#!/bin/sh

set -xe

jsonnet run.json | ./integrate.py
