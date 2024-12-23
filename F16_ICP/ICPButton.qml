// ICPButton.qml
import QtQuick 2.15

Item {
    id: buttonComponent
    property string defaultImage: ""   // Default image path
    property string pressedImage: ""   // Image path when pressed
    property string dataToSend: ""     // Data to send when button is pressed

    Rectangle {
        width: 64
        height: 64
        color: "transparent" // No background color

        Image {
            id: buttonImage
            source: buttonComponent.defaultImage // Default image
            anchors.fill: parent
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                buttonImage.source = buttonComponent.pressedImage // Change image on press
                client.sendData(buttonComponent.dataToSend) // Send data
                sound_press.play()
            }
            onReleased: {
                buttonImage.source = buttonComponent.defaultImage // Revert image on release
                sound_release.play();
            }
        }
    }
}
