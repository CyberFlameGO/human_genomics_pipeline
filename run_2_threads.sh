#!/bin/bash -x

snakemake \
-j 2 \
--use-conda \
--configfile ./config/resource_benchmarking.yml