import QtQuick 2.0
import Felgo 3.0
import ".."
import "../scenes"

Rectangle{
    id: fireArea
    anchors.fill: parent

    property var fort
    property var fireheight
    property var firewidth

    MouseArea {

        z: -1
        id: fireTouchControls
        anchors.fill: parent

        // becomes true when  starts
        property bool pressBool: false

        // stores the last time a bullet was shot
        property var lastTime: 0

        // shoot a bullet in the direction of the fort
        onClicked: {
            pressBool = true
            GameInfo.gold -= 50;
            upDateCannon(mouseX, mouseY) //update gun angle

            // calculate the time difference between the current time and the last fired bullet
            var currentTime = new Date().getTime()
            var timeDiff = currentTime - lastTime + 200

            // if enough time has passed, create a new bullet
            if (pressBool && timeDiff > fort.minTimeDistanceBullet) {
                firing.play()
                lastTime = currentTime

                // animate the head when a bullet is fired
                fort.fortbody.playing = true

                // pick a bullet speed depending on the current powerup
                var speed = 600

                // calculate a bullet movement vector with the rotation and the speed
                var xDirection =  Math.sin(fort.fortcannon.rotation * Math.PI / 180.0) * speed
                var yDirection = - Math.cos(fort.fortcannon.rotation * Math.PI / 180.0) * speed

                // calculate the bullet spawn point: start at the center of the fort translate it outside of the body towards the final direction
                var startX= fort.x + fort.width / 2
                var startY= fort.y + fort.height / 2
                // create and remove bullet entities at runtime
                entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../game/Shells.qml"), {
                                                                    "start" : Qt.point(startX, startY),
                                                                    "velocity" : Qt.point(xDirection, yDirection),
                                                                    "rotation" : fort.fortcannon.rotation});
            }
            // signal that the button is no longer pressed
            pressBool= false

        }
    }

    //cannonball launch sound effect
    SoundEffect{
        id:firing
        source:"../../assets/snd/cannon.wav"
    }

    //calculate the rotation angle of the battery
    function upDateCannon(clickX, clickY){
        var x = clickX
        var y = clickY
        x = x - (gameScene.width / 2 ) //x coordinate with fort as origin
        y = (y - (280 + gameScene.height / 2)) * (-1)//y coordinate with fort as origin
        var angle = calcAngle(x, y)
        fort.fortcannon.rotation = angle
    }

    // calculate the angle between a zero point and a second one
    function calcAngle(touchX, touchY) {
        return 180 / Math.PI * Math.atan2(touchX, touchY)
    }
}
