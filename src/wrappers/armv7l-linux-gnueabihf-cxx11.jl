# Autogenerated wrapper script for CoolProp_jll for armv7l-linux-gnueabihf-cxx11
export libCoolProp

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libCoolProp`
const libCoolProp_splitpath = ["lib", "libCoolProp.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libCoolProp_path = ""

# libCoolProp-specific global declaration
# This will be filled out by __init__()
libCoolProp_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libCoolProp = "libCoolProp.so.6"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"CoolProp")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libCoolProp_path = normpath(joinpath(artifact_dir, libCoolProp_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libCoolProp_handle = dlopen(libCoolProp_path)
    push!(LIBPATH_list, dirname(libCoolProp_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')
end  # __init__()

