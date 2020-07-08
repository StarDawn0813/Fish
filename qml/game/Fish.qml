import QtQuick 2.0
import Felgo 3.0
import "../"

EntityBase {
    id: fishBase

    property alias fishSwim: fishSwim
    property alias fishCollider: fishCollider

    entityId: "fishBase"
    entityType: "fishBase"
    z: -1

    TexturePackerAnimatedSprite {
        id: fishSwim
        interpolate: false
        anchors.centerIn: fishCollider
    }

    BoxCollider {
        id:fishCollider
        bullet: true
        categories: Box.Category1
        collidesWith: Box.Category2 | Box.Category3 | Box.Category4
        anchors.centerIn: parent
        linearDamping: 0.25
        linearVelocity:Qt.point(Math.random()*250, (Math.random()-0.5)*400) //random swimming point coordinates
        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target;
            var otherEntityId = collidedEntity.entityId;

            if(otherEntityId.substring(0,4)==="wall") //automatically destroyed when swimming to the border
                fishBase.destroy();
        }
    }
}
