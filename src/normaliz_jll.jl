# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule normaliz_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("normaliz")
JLLWrappers.@generate_main_file("normaliz", UUID("6690c6e9-4e12-53b8-b8fd-4bffaef8839f"))
end  # module normaliz_jll
