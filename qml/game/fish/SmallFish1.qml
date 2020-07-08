import Felgo 3.0
import QtQuick 2.0
import "../"
import "../../"
Fish {
    id: smallFish1

    property real smallFishLife : GameInfo.maxSmallFishBloodVolume - Math.random() - 0.7

    width: 30
    height: 40

    fishSwim.source: "../../../assets/fish_picture/small_fish1.json"
    fishSwim.frameNames: ["fish001.png", "fish002.png", "fish003.png", "fish004.png", "fish005.png", "fish006.png", "fish007.png", "fish008.png", "fish009.png", "fish010.png", "fish011.png", "fish012.png", "fish013.png", "fish014.png", "fish015.png", "fish016.png", "fish017.png", "fish018.png"]

    fishSwim.frameRate: 18
    fishSwim.rotation: 180

    fishCollider.width: smallFish1.height
    fishCollider.height: smallFish1.width

    fishCollider.fixture.onBeginContact: {
        var collidedEntity = other.getBody().target;
        var otherEntityId = collidedEntity.entityId;
        if(otherEntityId.substring(0,3)==="net"){
            smallFishLife = smallFishLife - GameInfo.hurt
            if(smallFishLife <= 0)  {
                GameInfo.gold+=100;
                smallFish1.destroy();
            }

        }
    }
}
