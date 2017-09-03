import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: elementRow
    property bool selected: false
    height: selected ? 300 : 30
    width: 200
    color: "transparent"
    Behavior on height { PropertyAnimation { duration: 200 } }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            anchors.top: parent.top
            id: elementHeader
            Layout.fillWidth: true
            height: 30
            color: index % 2 ? "white" : "lightgreen"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                Item {
                    height: elementHeader.height
                    width: elementHeader.height
                    Text {
                        anchors.centerIn: parent
                        text: eNumber
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                Item {
                    height: elementHeader.height
                    width: elementHeader.height
                    Text {
                        anchors.centerIn: parent
                        text: eSymbol
                    }
                }

                Item {
                    height: elementHeader.height
                    Layout.fillWidth: true
                    Text {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        text: eName
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: elementRow.selected = !elementRow.selected
            }
        }

        Rectangle {
            id: elementBody
            visible: elementRow.selected
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "lightgrey"
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20

                Text {
                    text: qsTr("Period: ") + ePeriod
                }

                Text {
                    text: qsTr("Group: ") + eGroup
                }

                Text {
                    text: qsTr("Atomic Number: ") + eNumber
                }

                Text {
                    text: qsTr("Symbol: ") + eSymbol
                }

                Text {
                    text: qsTr("Name: ") + eName
                }

                Text {
                    text: qsTr("Configuration: ") + eConfig
                }

                Text {
                    text: qsTr("Weight: ") + eWeight
                }

                Text {
                    text: qsTr("Electronegativity: ") + eNeg
                }

                Text {
                    text: qsTr("Melting Point (K): ") + eMelt
                }

                Text {
                    text: qsTr("Boiling Point (K): ") + eBoil
                }

                Text {
                    text: qsTr("Discovered: ") + (eDate == 0 ? "Ancient" : eDate);
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }
}
