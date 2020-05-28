#!/bin/bash -x

snakemake \
-j 8 \
--use-conda \
--configfile ./config/resource_benchmarking.yml