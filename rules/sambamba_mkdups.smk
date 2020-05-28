rule sambamba_mkdups:
    input:
        "mapped/{sample}_bwamem_sorted.bam"
    output:
        bam = temp("mapped/{sample}_bwamem_sorted_mkdups.bam"),
        index = temp("mapped/{sample}_bwamem_sorted_mkdups.bam.bai")
    params:
        tdir = expand("{tdir}", tdir = config['TEMPDIR']),
        other = "--sort-buffer-size=6144 --overflow-list-size=600000 --hash-table-size=600000"
    log:
        "logs/sambamba_mkdups/{sample}.log"
    benchmark:
        "benchmarks/sambamba_mkdups/{sample}.sambamba"
    conda:
        "../envs/sambamba.yaml"
    threads: 32
    message:
        "Finding duplicate reads in BAM files"
    shell:
        "(time sambamba markdup -p {input} {output.bam} --tmpdir={params.tdir} {params.other} -t {threads}) 2> times/sambamba_mkdups_time.txt"