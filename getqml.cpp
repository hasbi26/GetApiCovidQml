#include "getqml.h"
#include <QDebug>
#include <QByteArray>
#include <QFile>
#include <QJsonObject>
#include <QJsonDocument>
#include <QRegularExpression>


getQml::getQml(QObject *parent) : QObject(parent)
{
    qDebug()<<"before"<<myTest;
    qDebug()<<"tanggal"<< Tanggal;
    qDebug() << "Device supports OpenSSL: " << QSslSocket::supportsSsl();

    qDebug()<<"timing = "<<timing;
       QPluginLoader loader;
       loader.setFileName("/home/hasbi/qtdesignstudio-1.2.0-community/qt5_design_studio_reduced_version/plugins/sqldrivers/libqsqlmysql.so");
    qDebug() << "PluginLoader worked =" << loader.load();
       qDebug() << "Plugin Loader error=" << loader.errorString();

    {
        db.addDatabase("QMYSQL");
        db.setHostName("localhost.localdomain");
        db.setDatabaseName("Covid");
        db.setUserName("root");
        db.setPassword("P@ssw0rd");
    }


    timer = new (QTimer);
    timer->start(1000);
    connect(timer,SIGNAL(timeout()),this, SLOT(timerSlot()));
    timing = 0;

}


QString getQml::setdata1(QString r)
{
    myTest = r;
    //qDebug()<<"hasil get "<<myTest;
    QStringList list;
    list << myTest.split("Jawa Barat");
    QString value = list.last().split("geometry").at(0);
    kematian = list.last().split("geometry").at(0).split(",").at(3).split(":").at(1).split("}").at(0);
    Positif = list.last().split("geometry").at(0).split(",").at(1).split(":").at(1);
    sembuh = list.last().split("geometry").at(0).split(",").at(2).split(":").at(1);

    //    qDebug ()<<"Data Positif = "<< Positif;
    //    qDebug ()<<"Data Sembuh = "<< sembuh;
    //    qDebug ()<<"Data Kematian = "<< kematian;


    return 0;
}

QString getQml::setpikobar(QString p)
{
    pikobar = p;
    QStringList list;
    // qDebug()<<"pikobar"<<pikobar;
    list << pikobar.split(Tanggal);
    QString value = list.last();
   // qDebug()<< "value pikobar "<< value;
    odp = list.last().split(":").at(3).split(",").at(0);
    qDebug()<<"odp = "<<odp;
    odpProses = list.last().split(":").at(4).split(",").at(0);
    qDebug()<<"odp proses = "<<odpProses;
    odpSelesai = list.last().split(":").at(5).split(",").at(0);
    qDebug()<<"odp Selesai = "<<odpSelesai;
    pdp = list.last().split(":").at(6).split(",").at(0);
    qDebug()<<"pdp = "<<pdp;
    pdpProses = list.last().split(":").at(7).split(",").at(0);
    qDebug()<<"pdp proses = "<<pdpProses;
    pdpSelesai = list.last().split(":").at(8).split(",").at(0);
    qDebug()<<"pdp selesai = "<<pdpSelesai;
    PositifKemarin = list.last().split(":").at(9).split(",").at(0);
    qDebug()<<"positif Kemarin = "<<PositifKemarin;
    sembuhKemarin = list.last().split(":").at(10).split(",").at(0);
    qDebug()<<"sembuh Kemarin = "<<sembuhKemarin;
    meninggalKemarin = list.last().split(":").at(11).split(",").at(0).split("}").at(0);
    qDebug()<<"meninggal Kemarin = "<<meninggalKemarin;
    return 0;
}

void getQml::timerSlot()
{
    if( !db.open() )
    {
        qDebug()<<"disconected"<<db.lastError();

        //  ui->Notif->setText("Disconect to Database");
        stat = "not connected";

    }
    else {
        qDebug()<<"connected";
        stat = "connected";
        //ui->Notif->setText("Database Connected");
        //  fungsi();
            }
    qDebug()<<"time = "<<timing;
    //emit timerCostumSignal(timing);
    emit NotifSignal(odp);
    timing++;
}



