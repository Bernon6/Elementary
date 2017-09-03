import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1024
    height: 768
    title: qsTr("Elementary")
    color: "#7c7c7c"
    property bool landscapeMode: true

    onLandscapeModeChanged: {
        if(landscapeMode) {
            width = 1024;
            height = 768;
        }
        else {
            width = 300;
            height = 600;
        }
    }

    header: ToolBar {
        id: toolBar
        background: Rectangle {
            implicitHeight: 40
            color: "#3c3c3c"
            Rectangle {
                width: parent.width
                height: 1
                color: "#5c5c5c"
                anchors.bottom: parent.bottom
            }
        }

        RowLayout {
            anchors.fill: parent

            Item {
                Layout.fillWidth: true
            }

            ToolButton {
                onClicked: mainWindow.landscapeMode = !mainWindow.landscapeMode
                Image {
                    anchors.fill: parent
                    anchors.margins: 10
                    source: "rotate-option.svg"
                }
            }
        }
    }

    function showGridView() {
        return width > height + 100
    }

    EListViewPanel {
        id: listViewPanel
        anchors.fill: parent
        visible: !showGridView()
    }

    EGridViewPanel {
        id: gridViewPanel
        anchors.fill: parent
        visible: showGridView()
    }
}
