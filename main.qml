import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtPositioning 5.12

ApplicationWindow {
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Position Source")

    Text {
        id: posText
        anchors.centerIn: parent
        text: qsTr("Dummy Dummy")
        font.pixelSize: parent.width < parent.height ? parent.width * 0.05 : parent.height * 0.05
        font.family: "Open Sans Regular"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    PositionSource {
        id: pos
        preferredPositioningMethods: PositionSource.SatellitePositioningMethods
        updateInterval: 1000
        active: true
        onPositionChanged: {
                posText.text = "Latitude: " + String(pos.position.coordinate.latitude) + "\nLongitude: " + String(pos.position.coordinate.longitude) + "\nSpeed (m/s): " + String((pos.position.speed))
        }
    }
}
