import QtQuick
import QtQuick.Controls
import QtMultimedia
import QtCore

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

        Rectangle {
            id: button_comm1
            x: window.aButtonsLeft
            y: window.aButtonsTop
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
                }
            }
        }

        Rectangle {
            id: button_comm2
            x: window.aButtonsLeft + 85
            y: window.aButtonsTop
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
                    sound_release.play();
                }
            }
        }

        Rectangle {
            id: button_iff
            x: window.aButtonsLeft + 85 * 2
            y: window.aButtonsTop
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
            y: window.aButtonsTop
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
            y: window.aButtonsTop
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
            y: window.aButtonsTop
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
            property double simSymY: 0.0
            property bool simSymSetScrollStart: false

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
                    parent.simSymSetScrollStart = true
                }
                onWheel: (wheel)=> {
                    var dir = wheel.angleDelta.y / 120;
                    if (dir > 0) {
                        client.sendData("SimSymWheelUp");
                        sound_scroll.play()
                    } else {
                        client.sendData("SimSymWheelDn");
                        sound_scroll.play()
                    }
                }
                onMouseYChanged: {
                    if (parent.simSymSetScrollStart)
                    {
                        parent.simSymY = mouseY;
                        parent.simSymSetScrollStart = false
                    }

                    var delta = parent.simSymY - mouseY;
                    if (Math.abs(delta) > height / 6.0)
                    {
                        if (delta > 0) {
                            client.sendData("SimSymWheelUp");
                            sound_scroll.play()
                        } else {
                            client.sendData("SimSymWheelDn");
                            sound_scroll.play()
                        }
                        parent.simSymY = mouseY;
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
            property double simBrtY: 0.0
            property bool simBrtSetScrollStart: false

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
                    parent.simBrtSetScrollStart = true
                }
                onWheel: (wheel)=> {
                    var dir = wheel.angleDelta.y / 120;
                    if (dir > 0) {
                        client.sendData("SimBrtWheelUp");
                        sound_scroll.play()
                    } else {
                        client.sendData("SimBrtWheelDn");
                        sound_scroll.play()
                    }
                }
                onMouseYChanged: {
                    if (parent.simBrtSetScrollStart)
                    {
                        parent.simBrtY = mouseY;
                        parent.simBrtSetScrollStart = false
                    }

                    var delta = parent.simBrtY - mouseY;
                    if (Math.abs(delta) > height / 6.0)
                    {
                        if (delta > 0) {
                            client.sendData("SimBrtWheelUp");
                            sound_scroll.play()
                        } else {
                            client.sendData("SimBrtWheelDn");
                            sound_scroll.play()
                        }
                        parent.simBrtY = mouseY;
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
            property double simRetY: 0.0
            property bool simRetSetScrollStart: false

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
                    parent.simRetSetScrollStart = true
                }
                onWheel: (wheel)=> {
                    var dir = wheel.angleDelta.y / 120;
                    if (dir > 0) {
                        client.sendData("SimRetUp");
                        sound_scroll.play()
                    } else {
                        client.sendData("SimRetDn");
                        sound_scroll.play()
                    }
                }
                onMouseYChanged: {
                    if (parent.simRetSetScrollStart)
                    {
                        parent.simRetY = mouseY;
                        parent.simRetSetScrollStart = false
                    }

                    var delta = parent.simRetY - mouseY;
                    if (Math.abs(delta) > height / 6.0)
                    {
                        if (delta > 0) {
                            client.sendData("SimRetUp");
                            sound_scroll.play()
                        } else {
                            client.sendData("SimRetDn");
                            sound_scroll.play()
                        }
                        parent.simRetY = mouseY;
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
