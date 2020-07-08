import Felgo 3.0
import QtQuick 2.0
import "../common"

SceneBase {
    id:aboutScene

    //scene background
    BackgroundImage {
        id: image
        source: "../../assets/img/ui_background_normal.jpg"
        anchors.fill: aboutScene.gameWindowAnchorItem
        z: -2
    }
    Text {
        id: about
        color: "white"
        font.pixelSize: 24
        text: qsTr("   author: 第14组\n雷炜 赵俊杰 易礼康\n")
        anchors.horizontalCenter: parent.horizontalCenter
    }



    //return button
    MenuButton{
        onClicked: backButtonPressed()
        anchors.top: image.top
        anchors.topMargin: 40
        anchors.left: image.left
        anchors.leftMargin: 30
    }

}
