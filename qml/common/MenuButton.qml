import QtQuick 2.0

Rectangle{
    id: backButton
    signal clicked

    //back button
    Image {
        id: back
        source: "../../assets/img/back.png"
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: backButton.clicked()
            onPressed: backButton.opacity = 0.7
            onReleased: backButton.opacity = 1
        }
    }
}


