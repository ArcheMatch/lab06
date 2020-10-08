cmake_minimum_required(VERSION 3.4)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(BUILD_EXAMPLES "Build examples" OFF)

project(print)
set(PRINT_VERSION_MAJOR 0)                                                                          # Устанавливаем переменную мажорной версии
set(PRINT_VERSION_MINOR 1)                                                                          # Устанавливаем переменную минорной версии
set(PRINT_VERSION_PATCH 0)                                                                          # Устанавливаем переменную версии патча
set(PRINT_VERSION_TWEAK 0)                                                                          # Устанавливаем переменную версии настроек
set(PRINT_VERSION
  ${PRINT_VERSION_MAJOR}.${PRINT_VERSION_MINOR}.${PRINT_VERSION_PATCH}.${PRINT_VERSION_TWEAK})  # Устанавливаем переменную, отвечающую за вывод версии пакета в формате Мажорная версия.Минорная версия.Версия патча.Версия настроек
set(PRINT_VERSION_STRING "v${PRINT_VERSION}")                                                      # Устанавливаем переменную, отвечающую за вывод версии пакета

add_library(print STATIC ${CMAKE_CURRENT_SOURCE_DIR}/sources/print.cpp)

target_include_directories(print PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)

if(BUILD_EXAMPLES)
  file(GLOB EXAMPLE_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/examples/*.cpp")
  foreach(EXAMPLE_SOURCE ${EXAMPLE_SOURCES})
    get_filename_component(EXAMPLE_NAME ${EXAMPLE_SOURCE} NAME_WE)
    add_executable(${EXAMPLE_NAME} ${EXAMPLE_SOURCE})
    target_link_libraries(${EXAMPLE_NAME} print)
    install(TARGETS ${EXAMPLE_NAME}
      RUNTIME DESTINATION bin
    )
  endforeach(EXAMPLE_SOURCE ${EXAMPLE_SOURCES})
endif()

install(TARGETS print
    EXPORT print-config
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/ DESTINATION include)
install(EXPORT print-config DESTINATION cmake)

include(CPackConfig.cmake)  # Включение модуля CPackConfig
