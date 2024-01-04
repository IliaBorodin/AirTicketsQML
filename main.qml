import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    color: "#aeb1b2"
    visibility: "Minimized"
    id: window
    visible: true
    width: Screen.width / 2
    height: Screen.height / 1.8
    title: qsTr("Рейсы и заявки")
    TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("Рейсы")
        }
        TabButton {
            text: qsTr("Заявки")
        }
    }
    StackLayout {
        width: parent.width
        anchors.top: bar.bottom
        currentIndex: bar.currentIndex
        ColumnLayout {
            id: infoFlight
            spacing: 10
            HeaderInfoFlight{

            }
            Row{
                 Button {
                    width:window.width/3
                    text: "New"
                    onClicked: {
                        //input.initElemNew()

                       // listView.model.setProperty(listView.currentIndex, "id", 0)
                    }
                }
                 Button {
                    width:window.width/3
                    text: "Delete"
                    onClicked: {
                        //input.initElemNew()

                       // listView.model.setProperty(listView.currentIndex, "id", 0)
                    }
                }
                 Button {
                    width:window.width/3
                    text: "Filter"
                    onClicked: {
                        //input.initElemNew()

                       // listView.model.setProperty(listView.currentIndex, "id", 0)
                    }
                }

            }



      }
      ColumnLayout {
            id: infoRequest

      }
  }

}


