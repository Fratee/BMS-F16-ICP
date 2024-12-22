#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QTimer>

class TcpClient : public QObject {
    Q_OBJECT

public:
    explicit TcpClient(QObject *parent = nullptr);
    void connectToServer(const QString &host, quint16 port);

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
};

#endif // TCPCLIENT_H
