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
        RowLayout {
            anchors.fill: parent

            Item {
                Layout.fillWidth: true
            }

            ToolButton {
                text: "Flip"
                onClicked: mainWindow.landscapeMode = !mainWindow.landscapeMode
            }
        }
    }

    function showGridView() {
        return width > height + 100
    }

    Item {
        id: listViewPanel
        anchors.fill: parent
        visible: !showGridView()

        ListView {
            id: listView
            anchors.fill: parent
            model: ElementListModel {}
            focus: true
            spacing: 1
            boundsBehavior: Flickable.StopAtBounds
            delegate: EListDelegate {
                width: parent.width
            }
        }
    }

    Item {
        id: gridViewPanel
        anchors.fill: parent
        anchors.margins: 5
        visible: showGridView()

        property string selectedElementNumber: ""
        signal selectedItemChanged(string elementNumber)
        onSelectedItemChanged: {
            selectedElementNumber = elementNumber;
        }

        EGridModel {
            id: elementGridModel
        }

        ColumnLayout {
            id: gridViewLayout
            anchors.fill: parent
            spacing: 5

            GridView {
                id: gridView
                property string selectedElementNumber: ""
                onSelectedElementNumberChanged: {
                    gridViewPanel.selectedElementNumber = elementNumber;
                }

                Layout.fillHeight: true
                Layout.fillWidth: true
                cellWidth: width / 18
                cellHeight: cellWidth
                model: elementGridModel
                boundsBehavior: Flickable.StopAtBounds
                delegate: EGridDelegate {
                    Component.onCompleted: {
                        clicked.connect(gridViewPanel.selectedItemChanged)
                    }
                }
            }
        }

        EGridViewDetailPanel {
            id: detailPanel
        }
    }
}
