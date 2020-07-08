import Felgo 3.0
import QtQuick 2.0
import "../qml/scenes"
import "../qml/common"

GameWindow {
    id: gameWindow

    // create and remove entities at runtime
    EntityManager{
        id:entityManager
        entityContainer: gameScene
    }

    //create the game start interface
    MenuScene{
        id: menuScene

        onGamePressed: gameWindow.state = "game"
        onAboutPressed: gameWindow.state = "about"

        // the menu scene is our start scene, so if back is pressed there we ask the user if he wants to quit the application
        onBackButtonPressed: {
            nativeUtils.displayMessageBox("Really quit the game?", "", 2);
        }
        // listen to the return value of the MessageBox
        Connections {
            target: nativeUtils
            onMessageBoxFinished: {
                // only quit, if the activeScene is menuScene - the messageBox might also get opened from other scenes in your code
                if(accepted && gameWindow.activeScene === menuScene)
                    Qt.quit()
            }
        }
    }


    GameScene {
        id: gameScene
        onBackButtonPressed: gameWindow.state = "menu"
    }

    AboutScene {
        id: aboutScene
        onBackButtonPressed: {
            gameWindow.show()
        }
    }

    state: "menu"
    activeScene: menuScene

    // state machine, takes care reversing the PropertyChanges when changing the state like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: menuScene}
        },
        State {
            name: "about"
            PropertyChanges {target: aboutScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: aboutScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1; createFish.running: true; timerMusic1.running: true}
            PropertyChanges {target: gameWindow; activeScene: gameScene}
        }
    ]
    function show() {
        gameWindow.state = "menu"
    }
}
