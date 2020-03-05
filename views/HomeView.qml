import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import "../items/homepage"
import "./HomeView"

Rectangle {
//顶部搜索栏
//**************************************
    SearchBar {
        id:searchBar
        height: 0.07*rootwindow.height
        width: rootwindow.width
        z:2

        //搜索事件响应
        onDoSearch: {
            if (searchText.length > 0){
                console.log(searchText)
            }
        }
    }
//***************************************
    Rectangle{
        id:homecontent
        width: rootwindow.width
        height: flow.height+50
        anchors.top: searchBar.bottom
        Flickable {
            id: contents
            anchors.fill: parent
            contentHeight: flow.height
            contentWidth: rootwindow.width

            Column{
                id: flow
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 16
                //轮播
                //***************************************
                Rectangle{
                    width: rootwindow.width/2
                    height: cirCleView.height

                    CircleView {
                        id: cirCleView
                        anchors.margins: 5
                        model: ListModel {
                            ListElement { picUrl: 'qrc:/Images/homepage/switchimg/PHP.jpg' }
                            ListElement { picUrl: 'qrc:/Images/homepage/switchimg/C++.jpg' }
                            ListElement { picUrl: 'qrc:/Images/homepage/switchimg/deeplearning.png' }
                            ListElement { picUrl: 'qrc:/Images/homepage/switchimg/python.jpg' }
                            ListElement { picUrl: 'qrc:/Images/homepage/switchimg/cocos2d.jpg' }
                            ListElement { picUrl: 'qrc:/Images/homepage/switchimg/android.jpg' }
                        }

                        delegate: Item {
                            width: 1/2*cirCleView.width
                            height: cirCleView.height
                            Image {
                                width: 1/2*cirCleView.width
                                height: cirCleView.height
                                anchors.fill: parent
                                anchors.bottom: parent.bottom
                                source: picUrl
                            }
                            MouseArea {
                                anchors.fill: parent
                                //轮播图点击后切换页面处理
                                onClicked: {
                                    console.log("处理图片"+picUrl)
                                }
                            }
                        }

                        onDraggingChanged: {
                            if (dragging)
                                timer.stop()
                            else
                                timer.start()
                        }
                    }

                    PageIndicator {
                        anchors.bottom: cirCleView.bottom
                        anchors.horizontalCenter: cirCleView.horizontalCenter
                        count: cirCleView.count
                        currentIndex: cirCleView.currentIndex
                    }

                    Timer {
                        id: timer
                        running: true
                        repeat: true
                        //轮播切换速度
                        interval: 2000
                        onTriggered: cirCleView.currentIndex = (cirCleView.currentIndex + 1) % cirCleView.count
                    }
                }
                //******************************************

                //网格排列
                //******************************************
                Rectangle{
                    width: rootwindow.width/2
                    height: gridviews.height

                    GridViews{
                        id:gridviews
                        width: rootwindow.width
                        height: 0.25*rootwindow.height
                    }
                }
                //******************************************

                //猜你喜欢
                //******************************************
                Rectangle{
                    id:aaa
                    width: rootwindow.width/2
                    height: videoview.height

                    VideoView{
                        id:videoview
                        width: rootwindow.width
                        height: 0.3*rootwindow.height
                    }
                }
                //******************************************
            }
        }
    }
}
