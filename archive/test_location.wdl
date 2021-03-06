workflow test_location {
    call find_tools
}

task find_tools {
    command {
        ls $PICARD_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $JAVA_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $DELLY_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $BCFTOOLS_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $HTSLIB_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $TABIX_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $VCFTOOLS_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $PERL_ROOT
        echo "@@@@@@@@@@@@@@@@"

        echo $PATH
        echo "################"
        echo $LD_LIBRARY_PATH
        echo "################"
        echo $MANPATH
        echo "################"
        echo $PKG_CONFIG_PATH
        echo "################"
        echo $LD_RUN_PATH
        echo "################"
        echo $PERL5LIB
        echo "################"
    }
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/delly@sha256:9e9f221f944c6f4b11a8682c070b8ff4d99a329f5e498e50896825461558ec70"
        modules: "picard/2.19.2 delly/0.8.1 bcftools/1.9 tabix/0.2.6 vcftools/0.1.16"
    }
}
