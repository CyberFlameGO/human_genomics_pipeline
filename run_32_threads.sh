#!/bin/bash -x

snakemake \
-j 32 \
--use-conda \
--configfile ./config/resource_benchmarking.yml