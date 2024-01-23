cmake_minimum_required(VERSION 3.2)
project(example_sdl3_opengl3)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(BUILD_FOR_ANDROID CACHE BOOL OFF)

set(DEAR_IMGUI_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/../../imgui.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../../imgui_demo.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../../imgui_draw.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../../imgui_tables.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../../imgui_widgets.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../../backends/imgui_impl_sdl3.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../../backends/imgui_impl_opengl3.cpp
)

# set(DEAR_IMGUI_HEADERS
#   ${CMAKE_CURRENT_SOURCE_DIR}/../../imgui.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/../../imconfig.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/../../imgui_internal.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/../../imstb_rectpack.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/../../imstb_textedit.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/../../imstb_truetype.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/../../backends/imgui_impl_sdl3.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/../../backends/imgui_impl_opengl3.h
# )

include_directories(${CMAKE_SOURCE_DIR}/../.. ${CMAKE_SOURCE_DIR}/../../backends)

find_package(SDL3 REQUIRED CONFIG REQUIRED COMPONENTS SDL3)
find_package(OpenGL REQUIRED)

add_executable(example_sdl3_opengl3 ${CMAKE_SOURCE_DIR}/main.cpp ${DEAR_IMGUI_SRCS})

if(WIN32)
  set(OPENGL_LIB opengl32)
elseif(LINUX)
  set(OPENGL_LIB GL)
endif()

target_link_libraries(example_sdl3_opengl3 PRIVATE ${OPENGL_LIB} SDL3::SDL3)

