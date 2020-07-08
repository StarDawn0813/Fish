import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: fort
    entityType: "fort"
    entityId: "fort"
    x: originX
    y: originY

    //property alias plingSound: plingSound
    property double originX
    property double originY
    property alias fortcannon: fortcannon
    property alias fortbody: fortbody
    property int stdTimeDistanceBetweenBullets: 500 // standard time distance between two bullets
    property int minTimeDistanceBullet: stdTimeDistanceBetweenBullets // interval between two bullets

    Rectangle{
        id:fortcannon
        width: 40
        height: 50
        transformOrigin: Item.Center
        AnimatedImage {
          id: fortbody
          source: "../../assets/img/fort.gif"
          anchors.centerIn: parent
          playing: false
        }
    }


}
