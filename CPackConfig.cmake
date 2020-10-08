include(InstallRequiredSystemLibraries)
set(CPACK_PACKAGE_CONTACT aleksandr.kostrikin@mail.ru)                                    # EMail
set(CPACK_PACKAGE_VERSION_MAJOR ${PRINT_VERSION_MAJOR})                      # Мажорную версию
set(CPACK_PACKAGE_VERSION_MINOR ${PRINT_VERSION_MINOR})                      # Минорную версию
set(CPACK_PACKAGE_VERSION_PATCH ${PRINT_VERSION_PATCH})                      # Патч версию
set(CPACK_PACKAGE_VERSION_TWEAK ${PRINT_VERSION_TWEAK})                      # Версию изменений файла настроек
set(CPACK_PACKAGE_VERSION ${PRINT_VERSION})                                  # Общая строка с версией
set(CPACK_PACKAGE_DESCRIPTION_FILE ${CMAKE_CURRENT_SOURCE_DIR}/DESCRIPTION)  # Описание артефакта
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "static C++ library for printing")      # Описание артефакта (краткое)

set(CPACK_RPM_PACKAGE_NAME "print-devel")                                     # Имя пакета
set(CPACK_RPM_PACKAGE_LICENSE "MIT")                                          # Лицензия
set(CPACK_RPM_PACKAGE_GROUP "print")                                          # Группа пакетов
set(CPACK_RPM_CHANGELOG_FILE ${CMAKE_CURRENT_SOURCE_DIR}/ChangeLog.md)       # Файл со списком изменений
set(CPACK_RPM_PACKAGE_RELEASE 1)                                              # Версия пакета

set(CPACK_DEBIAN_PACKAGE_NAME "libprint-dev")                                 # Имя deb-пакета
set(CPACK_DEBIAN_PACKAGE_PREDEPENDS "cmake >= 3.0")                           # Необходимые зависимости
set(CPACK_DEBIAN_PACKAGE_RELEASE 1)                                           # Версия пакета

include(CPack)
