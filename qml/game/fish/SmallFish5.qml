import Felgo 3.0
import QtQuick 2.0
import "../"
import "../../"

Fish {
    id: smallFish5

    property real smallFishLife : GameInfo.maxSmallFishBloodVolume - Math.random() - 0.7

    width: 46
    height: 94

    fishSwim.source: "../../../assets/fish_picture/small_fish5.json"
    fishSwim.frameNames: ["0.png", "1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png","8.png","9.png","10.png","11.png"]

    fishSwim.frameRate: 12
    fishSwim.rotation: 90

    fishCollider.width: smallFish5.height
    fishCollider.height: smallFish5.width

    fishCollider.fixture.onBeginContact: {
        var collidedEntity = other.getBody().target;
        var otherEntityId = collidedEntity.entityId;
        if(otherEntityId.substring(0,3)==="net"){
            smallFishLife = smallFishLife - GameInfo.hurt
            if(smallFishLife <= 0)  {
                GameInfo.gold+=500;
                smallFish5.destroy();
            }
        }
    }
}

