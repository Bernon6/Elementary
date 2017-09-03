import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: panel
    width: 250
    color: "#3c3c3c"

    Behavior on x { NumberAnimation { duration: 100 } }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Item {
            Layout.fillWidth: true
            height: 30

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Item {
                    id: closeButton
                    Layout.fillHeight: true
                    width: 30

                    Text {
                        anchors.centerIn: parent
                        text: "X"
                        color: "white"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: gridViewPanel.selectedElementNumber = ""
                    }
                }

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#5c5c5c"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                Text {
                    text: qsTr("Period: ")
                    color: "white"
                }

                Text {
                    text: qsTr("Group: ")
                    color: "white"
                }

                Text {
                    text: qsTr("Atomic Number: ")
                    color: "white"
                }

                Text {
                    text: qsTr("Symbol: ")
                    color: "white"
                }

                Text {
                    text: qsTr("Name: ")
                    color: "white"
                }

                Text {
                    text: qsTr("Configuration: ")
                    color: "white"
                }

                Text {
                    text: qsTr("Weight: ")
                    color: "white"
                }

                Text {
                    text: qsTr("Electronegativity: ")
                    color: "white"
                }

                Text {
                    text: qsTr("Melting Point (K): ")
                    color: "white"
                }

                Text {
                    text: qsTr("Boiling Point (K): ")
                    color: "white"
                }

                Text {
                    text: qsTr("Discovered: ")
                    color: "white"
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }
}
