import QtQuick 2.9
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.Layouts
import QtQuick.LocalStorage
import "Database.js" as JS

Window {
    color: "#aeb1b2"
    visibility: "Minimized"
    id: window
    visible: true
    width: Screen.width
    height: Screen.height
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
                id:headerIF
            }
            Row{
                id:row
                 Button {
                    width:window.width/3
                    text: "Новый"
                    onClicked: {
                        headerIF.addNewElem()
                        headerIF.clearElem()

                    }
                }
                 Button {
                    width:window.width/3
                    text: "Удалить"
                    onClicked: {

                       headerIF.deleteCurElem()

                    }
                }
                FilterDialogF {id: dialogF; title: "Фильтрация"; anchors.centerIn: row  }
                 Button {
                    width:window.width/3
                    text: "Фильтрация"
                    onClicked: {

                        dialogF.open();
                        dialogF.applied.connect(function() {
                        JS.dbFilterDateTime(dateFieldR.text, timeFieldR.text)

                    });
                    }
                }

            }
            Row{
                id:row2
                 Button {
                    width:window.width/3
                    text: "Показать всё"
                    onClicked: {
                        JS.dbReadAllInfoFlight()

                    }
                }
            }

            ListView {
               id: listView
               width: window.width; height: window.width/3
               clip: true
               model: listModel
               delegate:nameDelegate
               focus: true


            }
            ListModel {
                id: listModel
                Component.onCompleted: JS.dbReadAllInfoFlight()
            }
            Component {
                        id: nameDelegate
                        InfoFlightCard {
                            _color: listView.currentIndex == index ? "#ff7f50" : "#ffe4c4"
                            idName: rowidF.toString()
                            airplaneName: airplaneF
                            fromToName: departureF + "-" + destinationF
                            dateTimeName: timeF + "\n" + dateF
                            price: priceF.toString()
                            width:window.width
                                 MouseArea {
                                    anchors.fill: parent
                                    onClicked: listView.currentIndex = index
                                    }
                        }

            }
        }




        ColumnLayout {
            id: infoRequest
            spacing: 10
            HeaderInfoRequest{
                id:headerIR
            }
            Row{
                id:rowR
                 Button {
                    width:window.width/3
                    text: "Новый"
                    onClicked: {
                        headerIR.addNewElemR()
                        headerIR.clearElem()


                    }
                }
                 Button {
                    width:window.width/3
                    text: "Удалить выбранное"
                    onClicked: {
                        //headerIF.initElemNew()
                       // listView.model.setProperty(listView.currentIndex, "id", 0)
                       headerIR.deleteCurElemR()

                    }
                }

                Button {
                    width:window.width/3
                    text: "Подобрать рейс"
                    onClicked: {
                        //input.initElemNew()
                        JS.dbPickFlight(listViewR.model.get(listViewR.currentIndex).rowidReq)
                       // listView.model.setProperty(listView.currentIndex, "id", 0)
                    }
                }

            }
             Row{
                id:rowR2
                 Button {
                    width:window.width/3
                    text: "Показать всё"
                    onClicked: {
                        JS.dbReadAllInfoReq()

                    }
                }
                DeleteDialogR {id: dialogDel; title: "Удаление"; anchors.centerIn: rowR2  }
                 Button {
                    width:window.width/3
                    text: "Удалить по времени"
                    onClicked: {
                       dialogDel.open();

                    }
                }
                FilterDialogR {id: dialogR; title: "Фильтрация"; anchors.centerIn: rowR2  }
                 Button {
                    id:filterRBtn
                    width:window.width/3
                    text: "Фильтрация"
                    onClicked: {
                        dialogR.open();
                    }
                }


            }

            ListView {
               id: listViewR
               width: window.width; height: window.width/3
               clip: true
               model: listModelR
               delegate:nameDelegateR
               //focus: true


            }
            ListModel {
                id: listModelR
                Component.onCompleted: JS.dbReadAllInfoReq()
            }
            Component {
                        id: nameDelegateR
                        InfoReqCard {
                            _colorR: listViewR.currentIndex == index ? "#ff7f50" : "#ffe4c4"
                            idNameR: rowidReq.toString()
                            nameSurnameR: nameReq + " " + surnameReq
                            fromToNameR: departureReq + "-" + destinationReq
                            dateTimeNameR: timeReq + "\n" + dateReq
                            width:window.width
                                 MouseArea {
                                    anchors.fill: parent
                                    onClicked: listViewR.currentIndex = index
                                    }
                        }

            }


        }
        Item {
            id: activityTab
        }
        Component.onCompleted: {
            JS.dbInit()
            JS.dbInit2()
        }
    }



}



