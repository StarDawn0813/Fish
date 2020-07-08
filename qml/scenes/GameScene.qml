import Felgo 3.0
import QtQuick 2.0
import "../common"
import "../game"
import "../"

SceneBase {
    id:gameScene

    property var originX: 0
    property var originY: 0
    property alias createFish: createFish
    property alias timerMusic1: timerMusic1
    property alias money: money

    PhysicsWorld{
        id:physicsWorld
        gravity.x:Math.random()*1.5
        //debugDrawVisible: true
    }

    BackgroundMusic {//play the backgroundmusic when in the GameScene
        volume: 0.35
        id: backgroundMusic
        source: "../../assets/snd/music.ogg"
        autoPlay: false
    }
    Timer {// timer plays the backgroundmusic in the GameScene
        id: timerMusic1
        interval: 100; running: false; repeat: true;
        onTriggered: {
            backgroundMusic.play()
            running = false
        }
    }

    Text {//display the gold frame,the origin gold is 100000
        z:3
        id: money
        y:508
        x:138
        font.letterSpacing: 4
        font.pixelSize: 38
        width: 10
        height: 10
        text: GameInfo.gold

    }

    BackgroundImage {
        id: image
        source: "../../assets/img/gamebg"
        anchors.fill: gameScene.gameWindowAnchorItem
        z:-50
    }

    Image {
        id: cloumn
        source: "../../assets/img/ui_box_02.png"
        anchors.left: gameWindowAnchorItem.left
        anchors.right: gameWindowAnchorItem.right
        anchors.bottom: gameWindowAnchorItem.bottom

    }

    //the music button
    MusicButton{
        id:button1

        z:3
        width: 70
        height: 46

        label.source:"../../assets/img/Button_push2.png"
        anchors.top: image.top
        anchors.topMargin: 40
        anchors.right: image.right
        anchors.rightMargin: 10
        onReleased: {
            label.source=active?"../../assets/img/Button_push2.png":"../../assets/img/Button_push1.png"
            settings.musicEnabled=active ? true : false
            active = !active
        }
        onPressed: {
            label.source=active?"../../assets/img/Button_press1.png":"../../assets/img/Button_press2.png"
        }
    }

    MusicButton{
        id:button2

        z:3
        width: 70
        height: 46

        label.source:"../../assets/img/Button_push3.png"
        anchors.top: image.top
        anchors.topMargin: 40
        anchors.right: button1.left
        anchors.rightMargin: 10
        onReleased: {
            label.source=active?"../../assets/img/Button_push3.png":"../../assets/img/Button_push4.png"
            settings.soundEnabled=active?true:false
            active=!active

        }
        onPressed: {
            label.source=active?"../../assets/img/Button_press4.png":"../../assets/img/Button_press3.png"
        }
    }

    MenuButton{
        id: backButton
        z: 3
        onClicked: {
            GameInfo.firstTime = true
            backgroundMusic.stop()
            backButtonPressed()
        }
        scale: 0.7
        anchors.top: image.top
        anchors.topMargin: 40
        anchors.left: image.left
        anchors.leftMargin: 30
    }

    Fort{
        z: 2
        id: fort
        entityType: "fort"
        anchors.verticalCenter: cloumn.verticalCenter
        originX: gameScene.width / 2 - 20
        originY: 270 + gameScene.height / 2
        //        anchors.centerIn: cloumn
    }

    Shot {
        z: 2
        id: shot
        fort: fort
        anchors.fill: gameWindowAnchorItem
        color: "transparent"
        fireheight: screenHeight
        firewidth: screenWidth
    }

    Timer{
        id: createFish
        interval: 200
        running: false
        repeat: true

        onTriggered: {
            selectfish()
        }
    }

    Wall {
        id: wallRight
        width: 20
        height: gameWindow.height * 3
        x: gameWindow.width + 300
        anchors.verticalCenter: gameWindow.verticalCenter
    }

    Wall {
        id: wallTop
        width: gameWindow.width * 3
        height: 20
        y: -200
        anchors.horizontalCenter: gameWindow.horizontalCenter
    }

    Wall {
        id: wallBottom
        width: gameWindow.width * 3
        height: 20
        y: gameWindow.height + 300
        anchors.horizontalCenter: gameWindow.horizontalCenter
    }

    //create different fish according to time
    function selectfish() {
        var newEntityProperties={
            x:-100,
            y:Math.random() * gameScene.height
        }
        var ran = Math.random()
        if(ran < 0.18)
            entityManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("../game/fish/SmallFish1.qml"),
                        newEntityProperties);
        else if(ran < 0.36)
            entityManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("../game/fish/SmallFish2.qml"),
                        newEntityProperties);
        else if(ran < 0.54)
            entityManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("../game/fish/SmallFish3.qml"),
                        newEntityProperties);
        else if(ran < 0.72)
            entityManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("../game/fish/SmallFish4.qml"),
                        newEntityProperties);
        else if(ran < 0.9)
            entityManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("../game/fish/SmallFish5.qml"),
                        newEntityProperties);
        else if(ran < 0.94)
            entityManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("../game/fish/MidFish1.qml"),
                        newEntityProperties);
        else if(ran < 0.98)
            entityManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("../game/fish/MidFish2.qml"),
                        newEntityProperties);
        else if(ran < 0.99)
            entityManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("../game/fish/BigFish1.qml"),
                        newEntityProperties);
        else if(ran < 1)
            entityManager.createEntityFromUrlWithProperties(
                        Qt.resolvedUrl("../game/fish/BigFish2.qml"),
                        newEntityProperties);
    }
}
