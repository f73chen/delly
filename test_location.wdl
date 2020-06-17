workflow test_location {
    call find_tools
}

task find_tools {
    command {
        ls $BIOCONDUCTOR_ROOT
        echo "@@@@@@@@@@@@@@@@"
    }
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/delly:1.0"
    }
}
