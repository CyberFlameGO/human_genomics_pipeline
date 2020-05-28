#!/bin/bash -x

snakemake \
--report report.html \
--configfile ./config/resource_benchmarking.yml \
--report-stylesheet ESR_stylesheet.css