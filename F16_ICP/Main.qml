import QtQuick
import QtQuick.Controls
import QtMultimedia
import Qt.labs.settings

Window {
    id: window
    width: 800
    height: 400
    visible: true
    title: qsTr("Hello World")

    // Use Settings to persist the IP across app starts
    property var settings: Settings {
        id: settings
        property string ipAddress: "192.168.1.28" // Default IP or read from settings file
    }

    visibility: Window.FullScreen

    property var aButtonsLeft: 60

    SoundEffect {
        id: sound_press
        source: "qrc:/sounds/button-pressed.wav"
        volume: 1.0
    }

    SoundEffect {
        id: sound_release
        source: "qrc:/sounds/button-released.wav"
        volume: 1.0
    }


    // Gray background
    Rectangle {
        id: grayBackground
        width: parent.width
        height: parent.height
        color: "#222222"
    }

    Image {
        id: background
        //source: "qrc:/images/icp_panel_background.png" // Replace with your image path
        anchors.fill: parent // Make the image cover the entire window
        fillMode: Image.PreserveAspectFit // Ensures the image scales properly

        Rectangle {
            id: button_comm1
            x: window.aButtonsLeft
            y: 18
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: buttonImage
                source: "qrc:/images/comm1.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    buttonImage.source = "qrc:/images/comm1-press.png"
                    client.sendData("SimICPCom1");
                    sound_press.play()
                }
                onReleased: {
                    buttonImage.source = "qrc:/images/comm1.png"
                    sound_release.play();
                    console.log("Button clicked!")
                }
            }
        }

        Rectangle {
            id: button_comm2
            x: window.aButtonsLeft + 85
            y: 18
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_comm2_img
                source: "qrc:/images/comm2.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_comm2_img.source = "qrc:/images/comm2-press.png"
                    client.sendData("SimICPCom2");
                    sound_press.play();
                }
                onReleased: {
                    button_comm2_img.source = "qrc:/images/comm2.png"
                    console.log("Button clicked!");
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_iff
            x: window.aButtonsLeft + 85 * 2
            y: 18
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_iff_img
                source: "qrc:/images/iff.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_iff_img.source = "qrc:/images/iff-press.png"
                    client.sendData("SimICPIFF");
                    sound_press.play()
                }
                onReleased: {
                    button_iff_img.source = "qrc:/images/iff.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_list
            x: window.aButtonsLeft + 85 * 3
            y: 18
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_list_img
                source: "qrc:/images/list.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_list_img.source = "qrc:/images/list-press.png"
                    client.sendData("SimICPLIST");
                    sound_press.play()
                }
                onReleased: {
                    button_list_img.source = "qrc:/images/list.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_a_a
            x: window.aButtonsLeft + 85 * 4
            y: 18
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_a_a_img
                source: "qrc:/images/a-a.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_a_a_img.source = "qrc:/images/a-a-press.png"
                    client.sendData("SimICPAA");
                    sound_press.play()
                }
                onReleased: {
                    button_a_a_img.source = "qrc:/images/a-a.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_a_g
            x: window.aButtonsLeft + 85 * 5
            y: 18
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_a_g_img
                source: "qrc:/images/a-g.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_a_g_img.source = "qrc:/images/a-g-press.png"
                    client.sendData("SimICPAG");
                    sound_press.play()
                }
                onReleased: {
                    button_a_g_img.source = "qrc:/images/a-g.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_1
            x: window.aButtonsLeft
            y: 106
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_1_img
                source: "qrc:/images/icp-1.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_1_img.source = "qrc:/images/icp-1-press.png"
                    client.sendData("SimICPTILS");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_1_img.source = "qrc:/images/icp-1.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_2
            x: window.aButtonsLeft + 85 * 1
            y: 106
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_2_img
                source: "qrc:/images/icp-2.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_2_img.source = "qrc:/images/icp-2-press.png"
                    client.sendData("SimICPALOW");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_2_img.source = "qrc:/images/icp-2.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_3
            x: window.aButtonsLeft + 85 * 2
            y: 106
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_3_img
                source: "qrc:/images/icp-3.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_3_img.source = "qrc:/images/icp-3-press.png"
                    client.sendData("SimICPTHREE");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_3_img.source = "qrc:/images/icp-3.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_rcl
            x: window.aButtonsLeft + 85 * 3 + 20
            y: 106
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_rcl_img
                source: "qrc:/images/icp-rcl.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_rcl_img.source = "qrc:/images/icp-rcl-press.png"
                    client.sendData("SimICPCLEAR");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_rcl_img.source = "qrc:/images/icp-rcl.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_4
            x: window.aButtonsLeft + 85 * 0
            y: 198
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_4_img
                source: "qrc:/images/icp-4.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_4_img.source = "qrc:/images/icp-4-press.png"
                    client.sendData("SimICPStpt");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_4_img.source = "qrc:/images/icp-4.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_5
            x: window.aButtonsLeft + 85 * 1
            y: 198
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_5_img
                source: "qrc:/images/icp-5.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_5_img.source = "qrc:/images/icp-5-press.png"
                    client.sendData("SimICPCrus");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_5_img.source = "qrc:/images/icp-5.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_6
            x: window.aButtonsLeft + 85 * 2
            y: 198
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_6_img
                source: "qrc:/images/icp-6.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_6_img.source = "qrc:/images/icp-6-press.png"
                    client.sendData("SimICPSIX");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_6_img.source = "qrc:/images/icp-6.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_enter
            x: window.aButtonsLeft + 85 * 3 + 20
            y: 198
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_enter_img
                source: "qrc:/images/icp-enter.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_enter_img.source = "qrc:/images/icp-enter-press.png"
                    client.sendData("SimICPEnter");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_enter_img.source = "qrc:/images/icp-enter.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_7
            x: window.aButtonsLeft + 85 * 0
            y: 289
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_7_img
                source: "qrc:/images/icp-7.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_7_img.source = "qrc:/images/icp-7-press.png"
                    client.sendData("SimICPMark");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_7_img.source = "qrc:/images/icp-7.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_8
            x: window.aButtonsLeft + 85 * 1
            y: 289
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_8_img
                source: "qrc:/images/icp-8.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_8_img.source = "qrc:/images/icp-8-press.png"
                    client.sendData("SimICPEIGHT");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_8_img.source = "qrc:/images/icp-8.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_9
            x: window.aButtonsLeft + 85 * 2
            y: 289
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_9_img
                source: "qrc:/images/icp-9.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_9_img.source = "qrc:/images/icp-9-press.png"
                    client.sendData("SimICPNINE");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_9_img.source = "qrc:/images/icp-9.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_icp_0
            x: window.aButtonsLeft + 85 * 3
            y: 289
            width: 64
            height: 64
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_icp_0_img
                source: "qrc:/images/icp-0.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_icp_0_img.source = "qrc:/images/icp-0-press.png"
                    client.sendData("SimICPZERO");
                    sound_press.play()
                }
                onReleased: {
                    button_icp_0_img.source = "qrc:/images/icp-0.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_steer
            x: window.aButtonsLeft + 85 * 4.5
            y: 110
            width: 46
            height: 90
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_steer_img
                source: "qrc:/images/rocker-middle.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                id: button_steer_mouseArea
                anchors.fill: parent
                onPressed: {
                    if (button_steer_mouseArea.containsMouse) {
                        if (button_steer_mouseArea.mouseY < parent.height / 2) {
                            client.sendData("SimICPNext");
                            console.log("Top half pressed!")
                            button_steer_img.source = "qrc:/images/rocker-up.png"
                            sound_press.play()
                        } else {
                            client.sendData("SimICPPrevious");
                            console.log("Bottom half pressed!")
                            button_steer_img.source = "qrc:/images/rocker-down.png"
                            sound_press.play()
                        }
                    }
                }
                onReleased: {
                    button_steer_img.source = "qrc:/images/rocker-middle.png"
                    sound_release.play();
                }
            }
        }


        Rectangle {
            id: button_dobber
            x: window.aButtonsLeft + 85 * 4.1
            y: button_steer.y + button_steer.height + 20
            width: 128 * 1.5
            height: 87.5 * 1.5
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_dobber_img
                source: "qrc:/images/dobber_center.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                id: button_dobber_mouseArea
                anchors.fill: parent
                onPressed: {
                    if (button_dobber_mouseArea.containsMouse) {
                        console.log(button_dobber_mouseArea.mouseX);
                        if (button_dobber_mouseArea.mouseY < parent.height / 3) {
                            client.sendData("SimICPDEDUP");
                            console.log("SimICPDEDUP")
                            button_dobber_img.source = "qrc:/images/dobber_up.png"
                            sound_press.play()
                        } else if (button_dobber_mouseArea.mouseY > parent.height * 2 / 3) {
                            client.sendData("SimICPDEDDOWN");
                            console.log("SimICPDEDDOWN")
                            button_dobber_img.source = "qrc:/images/dobber_down.png"
                            sound_press.play()
                        } else if (button_dobber_mouseArea.mouseX > parent.width * 2 / 3) {
                            client.sendData("SimICPDEDSEQ");
                            console.log("SimICPDEDSEQ")
                            button_dobber_img.source = "qrc:/images/dobber_right.png"
                            sound_press.play()
                        } else if (button_dobber_mouseArea.mouseX < parent.width / 3) {
                            client.sendData("SimICPResetDED");
                            console.log("SimICPResetDED")
                            button_dobber_img.source = "qrc:/images/dobber_left.png"
                            sound_press.play()
                        }
                    }
                }
                onReleased: {
                    button_dobber_img.source = "qrc:/images/dobber_center.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_flir
            x: window.aButtonsLeft + 85 * 7
            y: 214
            width: 46
            height: 90
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_flir_img
                source: "qrc:/images/rocker-middle.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                id: button_flir_mouseArea
                anchors.fill: parent
                onPressed: {
                    if (button_flir_mouseArea.containsMouse) {
                        if (button_flir_mouseArea.mouseY < parent.height / 2) {
                            client.sendData("SimFlirLevelUp");
                            console.log("Top half pressed!")
                            button_flir_img.source = "qrc:/images/rocker-up.png"
                            sound_press.play()
                        } else {
                            client.sendData("SimFlirLevelDown");
                            console.log("Bottom half pressed!")
                            button_flir_img.source = "qrc:/images/rocker-down.png"
                            sound_press.play()
                        }
                    }
                }
                onReleased: {
                    button_flir_img.source = "qrc:/images/rocker-middle.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_wx
            x: window.aButtonsLeft + 85 * 7
            y: 138
            width: 46
            height: 46
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_wx_img
                source: "qrc:/images/icp-wx.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    button_wx_img.source = "qrc:/images/icp-wx-press.png"
                    client.sendData("SimSetWX");
                    sound_press.play()
                }
                onReleased: {
                    button_wx_img.source = "qrc:/images/icp-wx.png"
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_wheel_sym
            x: 0
            y: 0
            width: 40
            height: 160
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_wheel_sym_img
                source: "qrc:/images/wheel.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                id: button_wheel_sym_mouseArea
                anchors.fill: parent
                onPressed: {
                    if (button_wheel_sym_mouseArea.containsMouse) {
                        if (button_wheel_sym_mouseArea.mouseY < parent.height / 2) {
                            client.sendData("SimSymWheelUp");
                            console.log("Top half pressed!")
                            sound_press.play()
                        } else {
                            client.sendData("SimSymWheelDn");
                            console.log("Bottom half pressed!")
                            sound_press.play()
                        }
                    }
                }
            }
        }

        Rectangle {
            id: button_wheel_brt
            x: 0
            y: 200
            width: 40
            height: 160
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_wheel_brt_img
                source: "qrc:/images/wheel.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                id: button_wheel_brt_mouseArea
                anchors.fill: parent
                onPressed: {
                    if (button_wheel_brt_mouseArea.containsMouse) {
                        if (button_wheel_brt_mouseArea.mouseY < parent.height / 2) {
                            client.sendData("SimBrtWheelUp");
                            console.log("Top half pressed!")
                            sound_press.play()
                        } else {
                            client.sendData("SimBrtWheelDn");
                            console.log("Bottom half pressed!")
                            sound_press.play()
                        }
                    }
                }
            }
        }

        Rectangle {
            id: button_ret
            width: 40
            height: 160
            x: parent.width - width - 35
            y: 0
            color: "transparent" // No background color

            // Image for button
            Image {
                id: button_ret_img
                source: "qrc:/images/wheel.png" // Default image
                anchors.fill: parent
            }

            MouseArea {
                id: button_ret_mouseArea
                anchors.fill: parent
                onPressed: {
                    if (button_ret_mouseArea.containsMouse) {
                        if (button_ret_mouseArea.mouseY < parent.height / 2) {
                            client.sendData("SimRetUp");
                            console.log("Top half pressed!")
                            sound_press.play()
                        } else {
                            client.sendData("SimRetDn");
                            console.log("Bottom half pressed!")
                            sound_press.play()
                        }
                    }
                }
            }
        }
    }

    // Button to open the input field
   Button {
        text: "IP"
        x: parent.width - width - 35
        y: parent.height - height
        onClicked: {
            if (!ipInput.visible)
            {
                ipInput.visible = true; // Show the input field when the button is pressed
                ipInput.focus = true;  // Focus on the text field
            }
            else
            {
                settings.ipAddress = ipInput.text;  // Save the IP to settings
                ipInput.visible = false;  // Hide the input field after input
            }
        }
    }

    // Text Field for IP input
    TextField {
        id: ipInput
        width: parent.width - 40
        height: 40
        anchors.centerIn: parent
        visible: false  // Initially hidden
        placeholderText: "Enter IP Address"

        // Handle when the user finishes input
        onAccepted: {
            settings.ipAddress = ipInput.text;  // Save the IP to settings
            ipInput.visible = false;  // Hide the input field after input
        }
    }

    Component.onCompleted: {
        // Check if an IP address is saved in the settings, and use it
        if (settings.ipAddress) {
            console.log("Saved IP Address: " + settings.ipAddress);
        }
    }
}
