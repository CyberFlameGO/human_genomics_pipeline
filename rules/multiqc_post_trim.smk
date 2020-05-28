rule multiqc_post_trim:
    input:
        expand(["trim_galore/{sample}_R1_val_1_fastqc.zip", "trim_galore/{sample}_R2_val_2_fastqc.zip"], sample = SAMPLES)
    output:
        report("qc/multiqc/post_trim_multiqc_report.html", caption = "../report/quality_checks_post_trim.rst", category = "Quality checks")
    conda:
        "../envs/multiqc.yaml"
    message:
        "Searching for analysis logs to compile a HTML report"
    shell:
        "(time multiqc {input} -o qc/multiqc/ -i post_trim) 2> times/multiqc_post_trim_time.txt"