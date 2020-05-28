#!/bin/bash -x

snakemake \
-j 16 \
--use-conda \
--configfile ./config/resource_benchmarking.yml