import Felgo 3.0
import QtQuick 2.0
import "../"
import "../../"

Fish {
    id: midFish1

    property real midFishLife : GameInfo.maxMidFishBloodVolume - (Math.random()+0.15) *2

    width: 110
    height: 110

    fishSwim.source: "../../../assets/fish_picture/mid_fish1.json"
    fishSwim.frameNames: ["0.png", "1.png","2.png","3.png","4.png","5.png","6.png","7.png" ]

    fishSwim.frameRate: 8
    fishSwim.rotation: 90

    fishCollider.width: midFish1.height
    fishCollider.height: midFish1.width

    fishCollider.fixture.onBeginContact: {
        var collidedEntity = other.getBody().target;
        var otherEntityId = collidedEntity.entityId;
        if(otherEntityId.substring(0,3)==="net"){
            midFishLife = midFishLife - GameInfo.hurt
            if(midFishLife <= 0)  {
                GameInfo.gold+=1000;
                midFish1.destroy();
            }
        }
    }
}
