# Autogenerated wrapper script for normaliz_jll for armv7l-linux-musleabihf-cxx03
export libnormaliz, normaliz

using GMP_jll
using FLINT_jll
using nauty_jll
using CompilerSupportLibraries_jll
JLLWrappers.@generate_wrapper_header("normaliz")
JLLWrappers.@declare_library_product(libnormaliz, "libnormaliz.so.3")
JLLWrappers.@declare_executable_product(normaliz)
function __init__()
    JLLWrappers.@generate_init_header(GMP_jll, FLINT_jll, nauty_jll, CompilerSupportLibraries_jll)
    JLLWrappers.@init_library_product(
        libnormaliz,
        "lib/libnormaliz.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        normaliz,
        "bin/normaliz",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
