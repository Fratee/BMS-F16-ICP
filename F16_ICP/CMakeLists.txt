cmake_minimum_required(VERSION 3.16)

project(F16_ICP VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Multimedia)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appF16_ICP
    main.cpp
)

qt_add_qml_module(appF16_ICP
    URI F16_ICP
    VERSION 1.0
    QML_FILES
        Main.qml
        SOURCES tcpclient.h tcpclient.cpp
        SOURCES
        RESOURCES android-sources/AndroidManifest.xml
)

# Add resources
qt_add_resources(appF16_ICP "resources"
    PREFIX /
    FILES
        images/a-a.png
        images/a-a-press.png
        images/a-g.png
        images/a-g-press.png
        images/comm1.png
        images/comm1-press.png
        images/comm2.png
        images/comm2-press.png
        images/icp_panel_background.png
        images/icp-0.png
        images/icp-0-press.png
        images/icp-1.png
        images/icp-1-press.png
        images/icp-2.png
        images/icp-2-press.png
        images/icp-3.png
        images/icp-3-press.png
        images/icp-4.png
        images/icp-4-press.png
        images/icp-5.png
        images/icp-5-press.png
        images/icp-6.png
        images/icp-6-press.png
        images/icp-7.png
        images/icp-7-press.png
        images/icp-8.png
        images/icp-8-press.png
        images/icp-9.png
        images/icp-9-press.png
        images/icp-enter.png
        images/icp-enter-press.png
        images/icp-wx.png
        images/icp-wx-press.png
        images/iff.png
        images/iff-press.png
        images/icp-rcl.png
        images/icp-rcl-press.png
        images/list.png
        images/list-press.png
        images/rocker-down.png
        images/rocker-middle.png
        images/rocker-up.png
        images/dobber_center.png
        images/dobber_up.png
        images/dobber_down.png
        images/dobber_left.png
        images/dobber_right.png
        images/wheel.png
        sounds/button-pressed.wav
        sounds/button-released.wav
        sounds/scroll.wav
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appF16_ICP PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appF16_ICP
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appF16_ICP
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appF16_ICP
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
