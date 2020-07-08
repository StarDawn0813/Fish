import QtQuick 2.0
import Felgo 3.0

// base component for all scenes in the game
Scene {
  id: sceneBase
  // this is important, as it serves as the reference size for the mass of the physics objects, because the mass of a body depends on the width of its images
  width: 960
  height: 480

  opacity: 0
  // NOTE: in qt5, an opaque element is not invisible by default and would handle the mouse and keyboard input!
  // thus to disable also keyboard focus and mouse handling and make an item invisible, set visible and enabled property depending on opacity
  visible: opacity === 0 ? false : true
  enabled: visible

  Behavior on opacity { NumberAnimation{duration: 250} }
}

