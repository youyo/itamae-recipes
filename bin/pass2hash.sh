#!/bin/bash

CLEAR_PASS="${1}"

openssl passwd -1 "${CLEAR_PASS}"
