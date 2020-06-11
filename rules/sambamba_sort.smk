rule sambamba_sort:
    input:
        "mapped/{sample}_bwamem.bam"
    output:
        bams = temp("mapped/{sample}_bwamem_sorted.bam"),
        index = temp("mapped/{sample}_bwamem_sorted.bam.bai")
    params:
        tdir = expand("{tdir}", tdir = config['TEMPDIR']),
        other = "-m 6G"
    log:
        "logs/sambamba_sort/{sample}.log"
    benchmark:
        "benchmarks/sambamba_sort/{sample}.sambamba"
    conda:
        "../envs/sambamba.yaml"
    threads: 32
    message:
        "Sorting BAM files"
    shell:
        "( /usr/bin/time sambamba sort -p {input} -o {output.bams} --tmpdir={params.tdir} {params.other} -t {threads} ) 2> times/sambamba_sort.stderr"