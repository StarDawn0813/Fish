import Felgo 3.0
import QtQuick 2.0
import "../"
import "../../"

Fish {
    id: midFish2

    property real midFishLife : GameInfo.maxMidFishBloodVolume - (Math.random()+0.15) *2

    width: 135
    height: 47

    fishSwim.source: "../../../assets/fish_picture/mid_fish2.json"
    fishSwim.frameNames: ["1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png","9.png"]

    fishSwim.frameRate: 9

    fishCollider.width: midFish2.width
    fishCollider.height: midFish2.height

    fishCollider.fixture.onBeginContact: {
        var collidedEntity = other.getBody().target;
        var otherEntityId = collidedEntity.entityId;
        if(otherEntityId.substring(0,3)==="net"){
            midFishLife = midFishLife - GameInfo.hurt
            if(midFishLife <= 0)  {
                GameInfo.gold += 2000;
                midFish2.destroy();
            }
        }
    }

}
