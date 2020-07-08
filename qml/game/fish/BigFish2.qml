import Felgo 3.0
import QtQuick 2.0
import "../"
import "../../"

Fish {
    id: bigFish2

    property real bigFishLife : GameInfo.maxBigFishBloodVolume - (Math.random()+0.15) *2

    width: 140
    height: 300

    fishSwim.source: "../../../assets/fish_picture/big_fish2.json"
    fishSwim.frameNames: ["0.png", "1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png","9.png","10.png","11.png" ]

    fishSwim.frameRate: 12
    fishSwim.rotation: 90

    fishCollider.width: bigFish2.height
    fishCollider.height: bigFish2.width

    fishCollider.fixture.onBeginContact: {
        var collidedEntity = other.getBody().target;
        var otherEntityId = collidedEntity.entityId;
        if(otherEntityId.substring(0,3)==="net"){
            bigFishLife = bigFishLife - GameInfo.hurt
            if(bigFishLife <= 0)  {
                GameInfo.gold += 10000;
                bigFish2.destroy();
            }
        }
    }
}
