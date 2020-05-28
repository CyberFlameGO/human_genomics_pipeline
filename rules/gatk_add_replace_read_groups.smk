rule gatk4_AddOrReplaceReadGroups:
    input:
        "mapped/{sample}_bwamem_sorted_mkdups.bam"
    output:
        temp("mapped/{sample}_sorted_mkdups_rgreplaced.bam")
    params:
        tdir = expand("{tdir}", tdir = config['TEMPDIR']),
        other = "-ID 4 -LB lib1 -PL illumina -PU unit1 -SM {sample}"
    log:
        "logs/gatk_readgroup/{sample}.log"
    benchmark:
        "benchmarks/gatk_readgroup/{sample}.readgroup"
    conda:
        "../envs/gatk4.yaml"
    message:
        "Assigning all reads to a single new read-group"
    shell:
        "( time gatk AddOrReplaceReadGroups -I {input} -O {output} --TMP_DIR {params.tdir} {params.other} 2> gatk4_AddOrReplaceReadGroups.stderr ) 2> times/gatk4_AddOrReplaceReadGroups_time.txt"