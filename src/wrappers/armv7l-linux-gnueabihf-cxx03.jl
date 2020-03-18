# Autogenerated wrapper script for normaliz_jll for armv7l-linux-gnueabihf-cxx03
export normaliz, libnormaliz

using GMP_jll
using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

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
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(normaliz_path)
    end
end


# Relative path to `libnormaliz`
const libnormaliz_splitpath = ["lib", "libnormaliz.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libnormaliz_path = ""

# libnormaliz-specific global declaration
# This will be filled out by __init__()
libnormaliz_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libnormaliz = "libnormaliz.so.3"


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
    foreach(p -> append!(PATH_list, p), (GMP_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (GMP_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list,))

    global normaliz_path = normpath(joinpath(artifact_dir, normaliz_splitpath...))

    push!(PATH_list, dirname(normaliz_path))
    global libnormaliz_path = normpath(joinpath(artifact_dir, libnormaliz_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libnormaliz_handle = dlopen(libnormaliz_path)
    push!(LIBPATH_list, dirname(libnormaliz_path))

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

