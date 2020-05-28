#!/bin/bash -x

snakemake \
-j 4 \
--use-conda \
--configfile ./config/resource_benchmarking.yml