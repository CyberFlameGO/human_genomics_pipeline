#!/bin/bash -x

snakemake \
-j 1 \
--use-conda \
--configfile ./config/resource_benchmarking.yml