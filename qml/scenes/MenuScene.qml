import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.0
import "../common"
import "../"

SceneBase {
    id:startwindow

    width: 960
    height: 480

    // hide when opacity = 0
    visible: opacity > 0

    // disable when opacity < 1
    enabled: opacity == 1

    // signal when buttons are clicked
    signal aboutPressed()
    signal settingPressed()
    signal gamePressed()

    property alias ambienceMusic: ambienceMusic

    // play background music
    BackgroundMusic {
        volume: 0.35
        id: ambienceMusic
        // an ogg file is not playable on windows, because the extension is not supported!
        source: "../../assets/snd/menu_scene.mp3"
    }

    // timer plays the background music
    Timer {
        id: timerMusic
        interval: 100; running: true; repeat: true;
        onTriggered: {
            settings.musicEnabled=true
            settings.soundEnabled=true
            ambienceMusic.play()
            running = false
        }
    }


    Timer{//change the backgroundmusic
        id:musicPlay
        interval: 100;repeat: true; running: true
        onTriggered: {
            if(GameInfo.back==true||GameInfo.firstTime==true) {
                //when clicked the backButton change the backgroundmusic
                ambienceMusic.play()
            }
        }
    }

    // background image
    BackgroundImage {
        source: "../../assets/img/ui_background_normal.jpg"
        anchors.fill: startwindow.gameWindowAnchorItem
    }

    Image {
        id: light
        source: "../../assets/img/light.png"
        anchors.top: menuScene.gameWindowAnchorItem.top
    }

    Image {
        id: logo
        scale: 0.9
        source: "../../assets/img/logo.png"
        anchors.horizontalCenter: menuScene.gameWindowAnchorItem.horizontalCenter
        anchors.top: menuScene.gameWindowAnchorItem.top
    }

    //the start button
    Image {
        id: start
        source: "../../assets/img/start_button2.png"
        anchors.horizontalCenter: menuScene.gameWindowAnchorItem.horizontalCenter
        anchors.bottom: menuScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: menuScene.height/5
        Image {
            id: start_text
            source: "../../assets/img/start.png"
            anchors.centerIn: parent
        }

        MouseArea{
            anchors.fill: parent
            //switch background image
            onClicked: {
                start.source = "../../assets/img/start_button1.png"
                ambienceMusic.stop()
                GameInfo.firstTime = false
                gamePressed()
            }
            onPressed: {
                start.source = "../../assets/img/start_button1.png"
            }
            onReleased: {
                start.source = "../../assets/img/start_button2.png"
            }
        }
    }
    //automatically change back to the original picture
    Timer{
        interval: 700; running: true; repeat: true
        onTriggered: {
            start.source = "../../assets/img/start_button2.png"
            aboutbg.source = "../../assets/img/bg2.png"
        }
    }

    Image {
        id: aboutbg
        source: "../../assets/img/bg2.png"
        anchors.left: menuScene.gameWindowAnchorItem.left
        anchors.leftMargin: 35
        anchors.bottom: menuScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: menuScene.height/2.5
        Image {
            id: about
            source: "../../assets/img/about.png"
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                aboutbg.source = "../../assets/img/bg1.png"
                aboutPressed()
            }
            onPressed: {
                aboutbg.source = "../../assets/img/bg1.png"
            }
            onReleased: {
                aboutbg.source = "../../assets/img/bg2.png"
            }
        }
    }
}
