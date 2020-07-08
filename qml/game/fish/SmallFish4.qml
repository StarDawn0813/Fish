import Felgo 3.0
import QtQuick 2.0
import "../"
import "../../"

Fish {
    id: smallFish4

    property real smallFishLife : GameInfo.maxSmallFishBloodVolume - Math.random() - 0.7

    width: 26
    height: 54

    fishSwim.source: "../../../assets/fish_picture/small_fish4.json"
    fishSwim.frameNames: ["0.png", "1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png"]

    fishSwim.frameRate: 8
    fishSwim.rotation: 90

    fishCollider.width: smallFish4.height
    fishCollider.height: smallFish4.width

    fishCollider.fixture.onBeginContact: {
        var collidedEntity = other.getBody().target;
        var otherEntityId = collidedEntity.entityId;
        if(otherEntityId.substring(0,3)==="net"){
            smallFishLife = smallFishLife - GameInfo.hurt
            if(smallFishLife <= 0)  {
                GameInfo.gold+=400;
                smallFish4.destroy();
            }
        }
    }
}

