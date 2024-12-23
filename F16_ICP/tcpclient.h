#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QTimer>
#include <QSettings>

class TcpClient : public QObject {
    Q_OBJECT

public:
    explicit TcpClient(QSettings *settings, QObject *parent = nullptr);
    void connectToServer();

public slots:
    void sendData(const QString &message);

private slots:
    void onConnected();
    void onReadyRead();
    void onDisconnected();
    void onErrorOccurred(QAbstractSocket::SocketError socketError);
    void onKeepAliveTimeout();

private:
    QTcpSocket *socket;
    QTimer *keepAliveTimer;
    QString serverHost;
    quint16 serverPort;
    QSettings *appSettings;
};

#endif // TCPCLIENT_H
