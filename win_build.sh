#!/bin/bash

set -e

CURDIR="$(readlink -f "$(dirname "${0}")")"
ROOTDIR="${CURDIR}/.."

(cd "${ROOTDIR}" && cargo build --target x86_64-pc-windows-gnu)
cp "${ROOTDIR}/target/x86_64-pc-windows-gnu/debug/"*.exe "${ROOTDIR}/."