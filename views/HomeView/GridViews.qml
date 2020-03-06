import QtQuick 2.0
import QtGraphicalEffects 1.0
import "../../items/homepage"

Item {
//    implicitHeight: 0.25*rootwindow.height
//    implicitWidth: rootwindow.width
    Rectangle {
        id:gridrec
        width: gridviews.width
        height: gridviews.height
        Component {
            id: booksortDelegate
            Item {
                id: wrapper
                width: grid.cellWidth
                height: grid.cellHeight
                //鼠标点击选中
                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        console.log(index)
                        wrapper.GridView.view.currentIndex = index
                        load_page(index)
                    }
                }

                Image {
                    id:sourceimage
                    source: portrait
                    //设置图片大小
                    sourceSize: Qt.size(parent.width-20, parent.height-20)
                    smooth: true
                    visible: false
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Rectangle {
                    id: mask
                    width: 1/3*parent.width
                    height: 1/2*parent.height
                    radius: width/2
                    color:"red"
                    visible: false
                }

                OpacityMask {
                    anchors.fill: sourceimage
                    source: sourceimage
                    maskSource: mask
                }

                Text {
                    text: name
                    anchors.top: sourceimage.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: wrapper.GridView.isCurrentItem ? "grey" : "black"
                }
             }
         }

         GridView {
             id: grid
             clip: true
             interactive: false //禁止滑动
             anchors.fill: parent
             cellWidth: 1/3*gridrec.width
             cellHeight: 1/2*gridrec.height

             model: GridBook {}
             delegate: booksortDelegate
             highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
             focus: true
         }
     }
}
