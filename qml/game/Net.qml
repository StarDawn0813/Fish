import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: net
    entityId: "net"
    entityType: "net"

    property alias netTimer: netTimer

    Image {
        id: netbody
        anchors.centerIn: parent
        source: "../../assets/img/net.png"
        scale: 1.1
    }

    onEntityCreated: netTimer.running = true

    // show the image for a small period of time and remove it

    BoxCollider{
        id:netCollider
        categories: Box.Category3
        collidesWith: Box.Category1
        height: netbody.height
        anchors.fill: netbody
        width: netbody.width
    }

    Timer {
        id: netTimer
        interval: 400
        running: false
        repeat: false

        onTriggered:{
            net.destroy();
        }
    }
}
