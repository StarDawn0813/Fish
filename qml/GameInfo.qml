pragma Singleton
import QtQuick 2.0
import Felgo 3.0

QtObject {
    id: gameInfo

    property bool back: false
    property var gold: 100000                   //game start gold coins
    property real maxBigFishBloodVolume: 6      //big fish's maximum health
    property real maxMidFishBloodVolume: 4      //mid fish's maximum health
    property real maxSmallFishBloodVolume: 2    //small fish's maximum health
    property real hurt : 1.0                    //bullet damage
    property bool firstTime: false
}
