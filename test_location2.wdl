workflow test_location {
    call find_tools
}

task find_tools {
    command <<<
        ls -l /data/HG19_ROOT/hg19_random.fa
        echo "@@@@@@@@@@@@@"
        ls -l /data/HG19_DELLY_ROOT/human.hg19.excl.tsv
        echo "@@@@@@@@@@@@@"
    >>>
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/delly@sha256:9e9f221f944c6f4b11a8682c070b8ff4d99a329f5e498e50896825461558ec70"
    }
}
