// ICPWheel.qml
import QtQuick 2.15

Item {
    id: scrollWheelComponent
    property string defaultImage: ""      // Default image path
    property string pressedImage: ""      // Image path when pressed
    property string upData: ""            // Data to send for "Up" scroll
    property string downData: ""          // Data to send for "Down" scroll

    property double wheelY: 0.0          // Y position for scrolling
    property bool setScrollStart: false  // Flag to start scrolling

    Rectangle {
        width: 40
        height: 160
        color: "transparent" // No background color

        Image {
            id: buttonImage
            source: scrollWheelComponent.defaultImage
            anchors.fill: parent
        }

        MouseArea {
            id: buttonMouseArea
            anchors.fill: parent
            onPressed: {
                scrollWheelComponent.setScrollStart = true
            }

            onWheel: (wheel) => {
                var dir = wheel.angleDelta.y / 120;
                if (dir > 0) {
                    client.sendData(scrollWheelComponent.upData);
                    sound_scroll.play()
                } else {
                    client.sendData(scrollWheelComponent.downData);
                    sound_scroll.play()
                }
            }

            onMouseYChanged: {
                if (scrollWheelComponent.setScrollStart) {
                    scrollWheelComponent.wheelY = mouseY;
                    scrollWheelComponent.setScrollStart = false;
                }

                var delta = scrollWheelComponent.wheelY - mouseY;
                if (Math.abs(delta) > height / 6.0) {
                    if (delta > 0) {
                        client.sendData(scrollWheelComponent.upData);
                        sound_scroll.play()
                    } else {
                        client.sendData(scrollWheelComponent.downData);
                        sound_scroll.play()
                    }
                    scrollWheelComponent.wheelY = mouseY;
                }
            }
        }
    }
}
