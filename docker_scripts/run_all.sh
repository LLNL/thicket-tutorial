#!/bin/bash

set -e

start_dir="$(pwd)"

for nb_file in "$@"; do
    nb_dir="$(dirname $nb_file)"
    nb_abs_dir="$(realpath $nb_dir)"
    nb_basename="$(basename $nb_file)"
    cd $nb_abs_dir
    papermill $nb_basename $nb_basename
    cd $start_dir
done
