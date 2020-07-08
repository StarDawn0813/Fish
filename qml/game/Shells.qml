import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: shells
    z: -1
    entityId: "shells"
    entityType: "shells"
    x: start.x - 10
    y: start.y
    width: 30
    height: 66

    // make the start and velocity vectors accessible from outside
    property point start
    property point velocity


    Image {
        id: shellsImage
        source: "../../assets/img/shells.png"
        anchors.centerIn: parent
        scale: 0.9
    }

    BoxCollider {
        id: boxCollider
        width: shells.width
        height: shells.height
        anchors.fill:shellsImage

        collisionTestingOnlyMode: true
        categories: Box.Category2
        collidesWith: Box.Category1
        body.bullet: true
        body.fixedRotation: false // if set to true the physics engine will NOT apply rotation to it

        // handle the collision
        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target;
            var otherEntityId = collidedEntity.entityId;
            var otherEntityParent = collidedEntity.parent;
            if(otherEntityId.substring(0,4)==="wall")
                shells.destroy();


            // show a splat image for a certain amount of time after removing the bullet
            entityManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("Net.qml"), {
                            "z": 1,
                            "x": shells.x,
                            "y": shells.y

                        }
                        );

            shells.destroy()
        }
    }



    // animate the bullet along its x-axis
    MovementAnimation {
        target: shells
        property: "x"
        velocity: shells.velocity.x
        running: true
    }

    // animate the bullet along its y-axis
    MovementAnimation {
        target: shells
        property: "y"
        velocity: shells.velocity.y
        running: true
        onStopped: {
            shells.destroy()
        }
    }
}
