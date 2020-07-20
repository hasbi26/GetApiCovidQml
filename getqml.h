#ifndef GETQML_H
#define GETQML_H

#include <QObject>
#include <QDateTime>
#include <QDate>
#include <QSslSocket>
#include <QTimer>
#include <QSqlQuery>
#include <QSqlError>
#include <QtSql>

class getQml : public QObject
{
    Q_OBJECT
public:
    explicit getQml(QObject *parent = nullptr);

    Q_INVOKABLE QString setdata1(QString r);
    Q_INVOKABLE QString setpikobar(QString p);
    QString Provinsi = "Jawa Barat" ;
    QDateTime now = QDateTime::currentDateTime().addDays(-1);
    QString Tanggal = now.date().toString("yyyy-MM-dd");
    QString Positif;
    QString sembuh;
    QString kematian;
    QString odp;
    QString odpProses;
    QString odpSelesai;
    QString pdp;
    QString pdpProses;
    QString pdpSelesai;
    QString PositifKemarin;
    QString sembuhKemarin;
    QString meninggalKemarin;



    QSqlDatabase db = QSqlDatabase();




    Q_INVOKABLE QString getKematian(){
        return kematian;
    };

    Q_INVOKABLE QString getKesembuhan(){
        return sembuh;
    };
    Q_INVOKABLE QString getPositif(){
        return Positif;
    };
    Q_INVOKABLE QString getodp(){
        return odp;
    };
    Q_INVOKABLE QString getodProses(){
        return odpProses;
    };
    Q_INVOKABLE QString getodpSelesai(){
        return odpSelesai;
    };
    Q_INVOKABLE QString getpdp(){
        return pdp;
    };
    Q_INVOKABLE QString getpdpProses(){
        return pdpProses;
    };
    Q_INVOKABLE QString getpdpSelesai(){
        return pdpSelesai;
    };
    Q_INVOKABLE QString getPositifKemarin(){
        return PositifKemarin;
    };
    Q_INVOKABLE QString getSembuhKemarin(){
        return sembuhKemarin;
    };
    Q_INVOKABLE QString getmeninggalKemarin(){
        return meninggalKemarin;
    };



signals:
  void NotifSignal(QString);

private:
  QString myTest;
  QString pikobar;

  int timing;
  QTimer *timer;
  QString stat;

private slots:
    void timerSlot();

};

#endif // GETQML_H
