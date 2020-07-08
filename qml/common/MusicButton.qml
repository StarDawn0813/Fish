import QtQuick 2.0

Rectangle {
    id:musicbutton
    color: "transparent"
    property bool active: false
    property alias label: label
    signal released
    signal pressed

    Image {
      id: label
      anchors.fill: parent
    }
    MouseArea {
      id: mouseArea
      anchors.fill: parent
      hoverEnabled: true
      onPressed: musicbutton.pressed()
      onReleased: musicbutton.released()
    }
}
