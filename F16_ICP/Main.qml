import QtQuick
import QtQuick.Controls
import QtMultimedia
import QtCore
import "qrc:/qt/qml/F16_ICP"

Window {
    id: window
    width: 800
    height: 400
    visible: true
    title: qsTr("F16 ICP")

    // Use Settings to persist the IP across app starts
    Settings {
        id: settings
        property string ipAddress: "192.168.1.1" // Default IP or read from settings file
        property int port: 12744 // Default IP or read from settings file
    }

    visibility: Window.FullScreen

    property var aButtonsLeft: 60
    property var aButtonsTop: 15

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

    SoundEffect {
        id: sound_scroll
        source: "qrc:/sounds/scroll.wav"
        volume: 2.0
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

        ICPButton {
            id: button_comm1
            defaultImage: "qrc:/images/comm1.png"
            pressedImage: "qrc:/images/comm1-press.png"
            dataToSend: "SimICPCom1"
            x: window.aButtonsLeft
            y: window.aButtonsTop
        }

        ICPButton {
            id: button_comm2
            defaultImage: "qrc:/images/comm2.png"
            pressedImage: "qrc:/images/comm2-press.png"
            dataToSend: "SimICPCom2"
            x: window.aButtonsLeft + 85
            y: window.aButtonsTop
        }

        ICPButton {
            id: button_iff
            defaultImage: "qrc:/images/iff.png"
            pressedImage: "qrc:/images/iff-press.png"
            dataToSend: "SimICPIFF"
            x: window.aButtonsLeft + 85 * 2
            y: window.aButtonsTop
        }

        ICPButton {
            id: button_list
            defaultImage: "qrc:/images/list.png"
            pressedImage: "qrc:/images/list-press.png"
            dataToSend: "SimICPLIST"
            x: window.aButtonsLeft + 85 * 3
            y: window.aButtonsTop
        }

        ICPButton {
            id: button_a_a
            defaultImage: "qrc:/images/a-a.png"
            pressedImage: "qrc:/images/a-a-press.png"
            dataToSend: "SimICPAA"
            x: window.aButtonsLeft + 85 * 4
            y: window.aButtonsTop
        }

        ICPButton {
            id: button_a_g
            defaultImage: "qrc:/images/a-g.png"
            pressedImage: "qrc:/images/a-g-press.png"
            dataToSend: "SimICPAG"
            x: window.aButtonsLeft + 85 * 5
            y: window.aButtonsTop
        }

        ICPButton {
            id: button_icp_1
            defaultImage: "qrc:/images/icp-1.png"
            pressedImage: "qrc:/images/icp-1-press.png"
            dataToSend: "SimICPTILS"
            x: window.aButtonsLeft
            y: 106
        }

        ICPButton {
            id: button_icp_2
            defaultImage: "qrc:/images/icp-2.png"
            pressedImage: "qrc:/images/icp-2-press.png"
            dataToSend: "SimICPALOW"
            x: window.aButtonsLeft + 85 * 1
            y: 106
        }

        ICPButton {
            id: button_icp_3
            defaultImage: "qrc:/images/icp-3.png"
            pressedImage: "qrc:/images/icp-3-press.png"
            dataToSend: "SimICPTHREE"
            x: window.aButtonsLeft + 85 * 2
            y: 106
        }

        ICPButton {
            id: button_icp_rcl
            defaultImage: "qrc:/images/icp-rcl.png"
            pressedImage: "qrc:/images/icp-rcl-press.png"
            dataToSend: "SimICPCLEAR"
            x: window.aButtonsLeft + 85 * 3 + 20
            y: 106
        }

        ICPButton {
            id: button_icp_4
            defaultImage: "qrc:/images/icp-4.png"
            pressedImage: "qrc:/images/icp-4-press.png"
            dataToSend: "SimICPStpt"
            x: window.aButtonsLeft + 85 * 0
            y: 198
        }

        ICPButton {
            id: button_icp_5
            defaultImage: "qrc:/images/icp-5.png"
            pressedImage: "qrc:/images/icp-5-press.png"
            dataToSend: "SimICPCrus"
            x: window.aButtonsLeft + 85 * 1
            y: 198
        }

        ICPButton {
            id: button_icp_6
            defaultImage: "qrc:/images/icp-6.png"
            pressedImage: "qrc:/images/icp-6-press.png"
            dataToSend: "SimICPSIX"
            x: window.aButtonsLeft + 85 * 2
            y: 198
        }

        ICPButton {
            id: button_icp_enter
            defaultImage: "qrc:/images/icp-enter.png"
            pressedImage: "qrc:/images/icp-enter-press.png"
            dataToSend: "SimICPEnter"
            x: window.aButtonsLeft + 85 * 3 + 20
            y: 198
        }

        ICPButton {
            id: button_icp_7
            defaultImage: "qrc:/images/icp-7.png"
            pressedImage: "qrc:/images/icp-7-press.png"
            dataToSend: "SimICPMark"
            x: window.aButtonsLeft + 85 * 0
            y: 289
        }

        ICPButton {
            id: button_icp_8
            defaultImage: "qrc:/images/icp-8.png"
            pressedImage: "qrc:/images/icp-8-press.png"
            dataToSend: "SimICPEIGHT"
            x: window.aButtonsLeft + 85 * 1
            y: 289
        }

        ICPButton {
            id: button_icp_9
            defaultImage: "qrc:/images/icp-9.png"
            pressedImage: "qrc:/images/icp-9-press.png"
            dataToSend: "SimICPNINE"
            x: window.aButtonsLeft + 85 * 2
            y: 289
        }

        ICPButton {
            id: button_icp_0
            defaultImage: "qrc:/images/icp-0.png"
            pressedImage: "qrc:/images/icp-0-press.png"
            dataToSend: "SimICPZERO"
            x: window.aButtonsLeft + 85 * 3
            y: 289
        }

        ICPButton {
            id: button_wx
            defaultImage: "qrc:/images/icp-wx.png"
            pressedImage: "qrc:/images/icp-wx-press.png"
            dataToSend: "SimSetWX"
            x: window.aButtonsLeft + 85 * 7
            y: 110
        }

        Rectangle  {
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
                            button_steer_img.source = "qrc:/images/rocker-up.png"
                            sound_press.play()
                        } else {
                            client.sendData("SimICPPrevious");
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
                        if (button_dobber_mouseArea.mouseY < parent.height / 3) {
                            client.sendData("SimICPDEDUP");
                            button_dobber_img.source = "qrc:/images/dobber_up.png"
                            sound_press.play()
                        } else if (button_dobber_mouseArea.mouseY > parent.height * 2 / 3) {
                            client.sendData("SimICPDEDDOWN");
                            button_dobber_img.source = "qrc:/images/dobber_down.png"
                            sound_press.play()
                        } else if (button_dobber_mouseArea.mouseX > parent.width * 2 / 3) {
                            client.sendData("SimICPDEDSEQ");
                            button_dobber_img.source = "qrc:/images/dobber_right.png"
                            sound_press.play()
                        } else if (button_dobber_mouseArea.mouseX < parent.width / 3) {
                            client.sendData("SimICPResetDED");
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
                            button_flir_img.source = "qrc:/images/rocker-up.png"
                            sound_press.play()
                        } else {
                            client.sendData("SimFlirLevelDown");
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

        ICPWheel {
            id: button_wheel_sym
            defaultImage: "qrc:/images/wheel.png"
            pressedImage: "qrc:/images/wheel.png"  // Same image for press/release, or change as needed
            upData: "SimSymWheelUp"
            downData: "SimSymWheelDn"
            x: 0
            y: 0
        }

        ICPWheel {
            id: button_wheel_brt
            defaultImage: "qrc:/images/wheel.png"
            pressedImage: "qrc:/images/wheel.png"
            upData: "SimBrtWheelUp"
            downData: "SimBrtWheelDn"
            x: 0
            y: parent.parent.height - 160
        }

        ICPWheel {
            id: button_ret
            defaultImage: "qrc:/images/wheel.png"
            pressedImage: "qrc:/images/wheel.png"
            upData: "SimRetUp"
            downData: "SimRetDn"
            x: parent.parent.width - 40 - 35
            y: 0
        }
    }

    // Button to open the input field
    Button {
        text: "IP"
        x: parent.width - width - 35
        y: parent.height - height
        onClicked: {
            if (!settingsRect.visible)
            {
                settingsRect.visible = true; // Show the input field when the button is pressed
                ipInput.text = settings.ipAddress + ":" + settings.port.toString()
            }
            else
            {
                settings.ipAddress = ipInput.text;  // Save the IP to settings
                settingsRect.visible = false;  // Hide the input field after input
            }
        }
    }

    Rectangle {
        id: settingsRect
        width: parent.width
        height: parent.height
        color: "#AAAAAA"
        visible: false

        // Text Field for IP input
        TextField {
            id: ipInput
            width: parent.width - 120
            height: 40
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 10
            placeholderText: "IP_ADDRESS:12345"

            // Handle when the user finishes input
            onAccepted: {
                settings.ipAddress = ipInput.text.split(":")[0].trim();
                settings.port = ipInput.text.split(":")[1].trim();
                console.log("IP Address updated to: " + settings.ipAddress + " port " + settings.port.toString());
                settingsRect.visible = false;
            }
        }

        // Button to open the input field
        Button {
            text: "CLOSE"
            x: parent.width - width - 70
            y: parent.height - height
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 40
            onClicked: {
                settings.ipAddress = ipInput.text.split(":")[0].trim();
                settings.port = ipInput.text.split(":")[1].trim();
                console.log("IP Address updated to: " + settings.ipAddress + " port " + settings.port.toString());
                settingsRect.visible = false;
            }
        }
   }

}
