# Autogenerated wrapper script for normaliz_jll for aarch64-linux-gnu-cxx11
export libnormaliz, normaliz

using GMP_jll
using FLINT_jll
using nauty_jll
using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libnormaliz`
const libnormaliz_splitpath = ["lib", "libnormaliz.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libnormaliz_path = ""

# libnormaliz-specific global declaration
# This will be filled out by __init__()
libnormaliz_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libnormaliz = "libnormaliz.so.3"


# Relative path to `normaliz`
const normaliz_splitpath = ["bin", "normaliz"]

# This will be filled out by __init__() for all products, as it must be done at runtime
normaliz_path = ""

# normaliz-specific global declaration
function normaliz(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(normaliz_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"normaliz")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (GMP_jll.PATH_list, FLINT_jll.PATH_list, nauty_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (GMP_jll.LIBPATH_list, FLINT_jll.LIBPATH_list, nauty_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list,))

    global libnormaliz_path = normpath(joinpath(artifact_dir, libnormaliz_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libnormaliz_handle = dlopen(libnormaliz_path)
    push!(LIBPATH_list, dirname(libnormaliz_path))

    global normaliz_path = normpath(joinpath(artifact_dir, normaliz_splitpath...))

    push!(PATH_list, dirname(normaliz_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

