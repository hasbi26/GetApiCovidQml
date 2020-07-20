#include "sql.h"

sql::sql(QObject *parent) : QObject(parent)
{
//    conectore = new connector;
//    connect(conectore,SIGNAL(NotifSignal(QString)),this,SLOT(notifSlot(QString)));

    getqml = new getQml;
    connect(getqml,SIGNAL(NotifSignal(QString)),this,SLOT(notifSlot()));

}

void sql::notifSlot(QString value)
{
qDebug()<<"hasil = " << value;
}



