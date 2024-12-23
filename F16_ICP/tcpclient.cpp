#include "tcpclient.h"
#include <QDebug>

TcpClient::TcpClient(QSettings *settings, QObject *parent)
    : QObject(parent),
    socket(new QTcpSocket(this)),
    keepAliveTimer(new QTimer(this)) {

    appSettings = settings;

    // Connect signals for socket events
    connect(socket, &QTcpSocket::connected, this, &TcpClient::onConnected);
    connect(socket, &QTcpSocket::readyRead, this, &TcpClient::onReadyRead);
    connect(socket, &QTcpSocket::disconnected, this, &TcpClient::onDisconnected);
    connect(socket, &QTcpSocket::errorOccurred, this, &TcpClient::onErrorOccurred);

    // Configure the keep-alive timer
    connect(keepAliveTimer, &QTimer::timeout, this, &TcpClient::onKeepAliveTimeout);
    keepAliveTimer->start(5000); // Check connection every 5 seconds
}

void TcpClient::connectToServer() {
    serverHost = appSettings->value("ipAddress", "127.0.0.1").toString();
    serverPort = appSettings->value("port", 12744).toInt();

    qDebug() << "Attempting to connect to server:" << serverHost << ":" << serverPort;
    socket->connectToHost(serverHost, serverPort);

    if (!socket->waitForConnected(2500)) {
        qDebug() << "Error connecting to server:" << socket->errorString();
    }
}

void TcpClient::sendData(const QString &message) {
    if (socket->state() == QAbstractSocket::ConnectedState) {
        qDebug() << "Sending data:" << message;
        socket->write(message.toUtf8());
    } else {
        qDebug() << "Not connected to server.";
        connectToServer();
    }
}

void TcpClient::onConnected() {
    qDebug() << "Connected to server!";
}

void TcpClient::onReadyRead() {
    QByteArray data = socket->readAll();
    qDebug() << "Data received:" << data;
}

void TcpClient::onDisconnected() {
    qDebug() << "Disconnected from server. Will attempt to reconnect...";
}

void TcpClient::onErrorOccurred(QAbstractSocket::SocketError socketError) {
    Q_UNUSED(socketError)
    qDebug() << "Socket error:" << socket->errorString();
}

void TcpClient::onKeepAliveTimeout() {
    if (socket->state() == QAbstractSocket::ConnectedState) {
        // Send a keep-alive message to the server
        qDebug() << "Sending keep-alive message to server.";
        socket->write("KEEP_ALIVE");
    } else {
        // Reconnect if not connected
        qDebug() << "Socket is not connected. Attempting to reconnect...";
        socket->abort(); // Ensure any existing connection is closed
        connectToServer();
    }
}
