import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.13


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    function request(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(myxhr)
        { return function() {
                if(myxhr.readyState === 4) { callback(myxhr); }
            }
        })(xhr);

        xhr.open("GET", url);
        xhr.send();
    }

    Text {
        id: element
        x: 28
        y: 31
        text: qsTr("REKAP DATA GLOBAL COVID JABAR ")
        font.bold: true
        font.pixelSize: 25
    }

    Text {
        id: element1
        x: 28
        y: 88
        text: qsTr("Kasus Positif :")
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: element2
        x: 28
        y: 129
        text: qsTr("Kasus Sembuh :")
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: element3
        x: 28
        y: 166
        text: qsTr("Kasus Kematian :")
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: textPositif
        x: 173
        y: 88
        width: 37
        height: 25
        text: ""
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: textSembuh
        x: 189
        y: 124
        color: "#51d50c"
        text: ""
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: textKematian
        x: 205
        y: 166
        color: "#a70202"
        text: ""
        font.bold: true
        font.pixelSize: 18
        onTextChanged: value.getKematian()

    }


    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textKematian.text = value.getKematian()

    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textSembuh.text = value.getKesembuhan()
    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textPositif.text = value.getPositif()
    }

    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: request("https://services5.arcgis.com/VS6HdKS0VfIhv8Ct/arcgis/rest/services/COVID19_Indonesia_per_Provinsi/FeatureServer/0/query?where=Provinsi%20%3D%20'JAWA%20BARAT'&outFields=*&outSR=4326&f=json", function (o)
            {
                if (o.status === 200)
                {
                    //console.log(o.responseText);

                    value.setdata1(o.responseText)

                }
                else
                {
                    console.log("Some error has occurred");
                }
            });
    }

    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: request("https://covid19-public.digitalservice.id/api/v1/rekapitulasi/jabar/harian?level=sumedang", function (z)
            {
                if (z.status === 200)
                {

                    value.setpikobar(z.responseText)
                    //console.log(o.responseText);

                   // console.log(value.getKematian())

                    //value.setdata1(o.responseText)

                }
                else
                {
                    console.log("Some error has occurred");
                }
            });
    }

    Text {
        id: element4
        x: 28
        y: 224
        text: qsTr("Rekap Harian Data Covid Jabar Kemarin")
        font.bold: true
        font.pixelSize: 25
    }

    Text {
        id: element5
        x: 28
        y: 280
        text: qsTr("Kasus Positif :")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: element6
        x: 28
        y: 310
        text: qsTr("Kasus Sembuh :")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: element7
        x: 28
        y: 340
        text: qsTr("Kasus Kematian :")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: element8
        x: 28
        y: 369
        text: qsTr("Kasus ODP :")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: element9
        x: 28
        y: 395
        text: qsTr("Kasus ODP Proses :")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: element10
        x: 29
        y: 425
        text: qsTr("Kasus ODP Selesai :")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: element11
        x: 280
        y: 279
        text: qsTr("Kasus PDP :")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: element12
        x: 280
        y: 310
        text: qsTr("Kasus PDP Proses :")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: element13
        x: 281
        y: 344
        text: qsTr("Kasus PDP Selesai :")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: textPositifK
        x: 155
        y: 280
        text: qsTr("-")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: textSembuhK
        x: 164
        y: 310
        color: "#19b34b"
        text: qsTr("-")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: textKematianK
        x: 174
        y: 340
        color: "#cb0e0e"
        text: qsTr("-")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: textOdpK
        x: 142
        y: 370
        color: "#cb0e0e"
        text: qsTr("-")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: textOdpProses
        x: 194
        y: 395
        text: qsTr("-")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: textOdpSelesai
        x: 194
        y: 425
        color: "#19b34b"
        text: qsTr("-")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: textPDPK
        x: 389
        y: 279
        color: "#cb0e0e"
        text: qsTr("-")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: textPDPProses
        x: 451
        y: 310
        text: qsTr("-")
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: textPDPSelesai
        x: 446
        y: 344
        color: "#19b34b"
        text: qsTr("-")
        font.pixelSize: 18
        font.bold: true
    }

    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textPositifK.text = value.getPositifKemarin()
    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textSembuhK.text = value.getSembuhKemarin()
    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textKematianK.text = value.getmeninggalKemarin()
    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textOdpK.text = value.getodp()
    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textOdpProses.text = value.getodProses()
    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textOdpSelesai.text = value.getodpSelesai()
    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textPDPK.text = value.getpdp()
    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textPDPProses.text = value.getpdpProses()
    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textPDPSelesai.text = value.getpdpSelesai()
    }


}











