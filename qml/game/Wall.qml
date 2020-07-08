import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: wall
    entityId: "wall"
    entityType: "wall"

    Rectangle {
        id: wallbody
        color: "red"
    }

    BoxCollider {
        id: boxCollider
        anchors.fill: wall
        bodyType: Body.Static
        categories: Box.Category4
        collidesWith: Box.Category2 | Box.Category3
    }
}
