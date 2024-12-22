#include "tcpserver.h"
#include <QDebug>
#include <Windows.h>
#include "commands.h"

#include <Windows.h>

#include <Windows.h>

void sendKeyPress(HWND hwnd, int key, bool shift, bool ctrl, bool alt) {
    // Input structure for the modifier keys (Shift, Ctrl, Alt)
    INPUT inputShiftDown = {0}, inputCtrlDown = {0}, inputAltDown = {0};
    INPUT inputShiftUp = {0}, inputCtrlUp = {0}, inputAltUp = {0};
    INPUT inputKeyDown = {0}, inputKeyUp = {0};

    // Ensure modifiers are pressed before the main key (using scan codes)
    if (shift) {
        inputShiftDown.type = INPUT_KEYBOARD;
        inputShiftDown.ki.wScan = 0x2A;  // Scan code for Shift
        inputShiftDown.ki.dwFlags = 0;  // Key down
        inputShiftDown.ki.time = 0;
        inputShiftDown.ki.dwExtraInfo = 0;
        SendInput(1, &inputShiftDown, sizeof(INPUT));
    }

    if (ctrl) {
        inputCtrlDown.type = INPUT_KEYBOARD;
        inputCtrlDown.ki.wScan = 0x1D;  // Scan code for Ctrl
        inputCtrlDown.ki.dwFlags = 0;  // Key down
        inputCtrlDown.ki.time = 0;
        inputCtrlDown.ki.dwExtraInfo = 0;
        SendInput(1, &inputCtrlDown, sizeof(INPUT));
    }

    if (alt) {
        inputAltDown.type = INPUT_KEYBOARD;
        inputAltDown.ki.wScan = 0x38;  // Scan code for Alt
        inputAltDown.ki.dwFlags = 0;  // Key down
        inputAltDown.ki.time = 0;
        inputAltDown.ki.dwExtraInfo = 0;
        SendInput(1, &inputAltDown, sizeof(INPUT));
    }

    // Small delay to ensure modifiers are registered
    Sleep(10); // Optional: Increase if necessary

    // Now send the main key press (keydown) using scan code
    inputKeyDown.type = INPUT_KEYBOARD;
    inputKeyDown.ki.wScan = key;  // Scan code of the key
    inputKeyDown.ki.dwFlags = 0;  // Key down
    inputKeyDown.ki.time = 0;
    inputKeyDown.ki.dwExtraInfo = 0;
    SendInput(1, &inputKeyDown, sizeof(INPUT));

    // Send the main key release (keyup)
    inputKeyUp.type = INPUT_KEYBOARD;
    inputKeyUp.ki.wScan = key;  // Scan code of the key
    inputKeyUp.ki.dwFlags = KEYEVENTF_KEYUP;  // Key up
    inputKeyUp.ki.time = 0;
    inputKeyUp.ki.dwExtraInfo = 0;
    SendInput(1, &inputKeyUp, sizeof(INPUT));

    // Release modifier keys after the main key
    if (alt) {
        inputAltUp.type = INPUT_KEYBOARD;
        inputAltUp.ki.wScan = 0x38;  // Scan code for Alt
        inputAltUp.ki.dwFlags = KEYEVENTF_KEYUP;  // Key up
        inputAltUp.ki.time = 0;
        inputAltUp.ki.dwExtraInfo = 0;
        SendInput(1, &inputAltUp, sizeof(INPUT));
    }

    if (ctrl) {
        inputCtrlUp.type = INPUT_KEYBOARD;
        inputCtrlUp.ki.wScan = 0x1D;  // Scan code for Ctrl
        inputCtrlUp.ki.dwFlags = KEYEVENTF_KEYUP;  // Key up
        inputCtrlUp.ki.time = 0;
        inputCtrlUp.ki.dwExtraInfo = 0;
        SendInput(1, &inputCtrlUp, sizeof(INPUT));
    }

    if (shift) {
        inputShiftUp.type = INPUT_KEYBOARD;
        inputShiftUp.ki.wScan = 0x2A;  // Scan code for Shift
        inputShiftUp.ki.dwFlags = KEYEVENTF_KEYUP;  // Key up
        inputShiftUp.ki.time = 0;
        inputShiftUp.ki.dwExtraInfo = 0;
        SendInput(1, &inputShiftUp, sizeof(INPUT));
    }
}

int getCommandCode(QString command)
{
    if (command == SimICPCom1) return 0x3B;
    if (command == SimICPCom2) return 0x3C;
    if (command == SimICPIFF) return 0x3D;
    if (command == SimICPLIST) return 0x3E;
    if (command == SimICPAA) return 0x3F;
    if (command == SimICPAG) return 0x40;
    if (command == SimICPNav) return 0x0E;
    if (command == SimICPTILS) return 0x4F;
    if (command == SimICPALOW) return 0x50;
    if (command == SimICPTHREE) return 0x51;
    if (command == SimICPStpt) return 0x4B;
    if (command == SimICPCrus) return 0x4C;
    if (command == SimICPSIX) return 0x4D;
    if (command == SimICPMark) return 0x47;
    if (command == SimICPEIGHT) return 0x48;
    if (command == SimICPNINE) return 0x49;
    if (command == SimICPZERO) return 0x52;
    if (command == SimICPCLEAR) return 0x53;
    if (command == SimICPEnter) return 0x9C;
    if (command == SimICPNext) return 0x4E;
    if (command == SimICPPrevious) return 0x4A;
    if (command == SimICPDEDUP) return 0xC8;
    if (command == SimICPDEDDOWN) return 0xD0;
    if (command == SimICPDEDSEQ) return 0xCD;
    if (command == SimICPResetDED) return 0xCB;
    if (command == SimDriftCO) return 0xB5;
    if (command == SimWarnReset) return 0x1C;
    if (command == SimSetWX) return 0xB5;
    if (command == SimFlirLevelUp) return 0xC9;
    if (command == SimFlirLevelDown) return 0xD2;
    if (command == SimSymWheelUp) return 0x4E;
    if (command == SimSymWheelDn) return 0x4A;
    if (command == SimHUDPower) return 0x9C;
    if (command == SimBrtWheelUp) return 0x4E;
    if (command == SimBrtWheelDn) return 0x4A;
    if (command == SimRetUp) return 0x4E;
    if (command == SimRetDn) return 0x4A;
    return 0;
}

bool getShift(QString command)
{
    if (command == SimWarnReset) return true;
    if (command == SimSetWX) return true;
    if (command == SimFlirLevelUp) return true;
    if (command == SimFlirLevelDown) return true;
    if (command == SimSymWheelUp) return true;
    if (command == SimSymWheelDn) return true;
    if (command == SimHUDPower) return true;
    if (command == SimBrtWheelUp) return true;
    if (command == SimBrtWheelDn) return true;
    return false;
}

bool getCtrl(QString command)
{
    if (command == SimSymWheelUp) return true;
    if (command == SimSymWheelDn) return true;
    if (command == SimHUDPower) return true;
    if (command == SimRetUp) return true;
    if (command == SimRetDn) return true;
    return false;
}

bool getAlt(QString command)
{
    if (command == SimBrtWheelUp) return true;
    if (command == SimBrtWheelDn) return true;
    if (command == SimRetUp) return true;
    if (command == SimRetDn) return true;
    return false;
}

TcpServer::TcpServer(QObject *parent) : QObject(parent), server(new QTcpServer(this)) {
    connect(server, &QTcpServer::newConnection, this, &TcpServer::onNewConnection);
}

bool TcpServer::startServer(quint16 port) {
    if (!server->listen(QHostAddress::Any, port)) {
        qDebug() << "Server could not start: " << server->errorString();
        return false;
    }

    qDebug() << "Server started on port:" << port;
    return true;
}

void TcpServer::onNewConnection() {
    while (server->hasPendingConnections()) {
        QTcpSocket *client = server->nextPendingConnection();
        clients.append(client);

        qDebug() << "New client connected from:" << client->peerAddress().toString();

        // Connect signals for the client socket
        connect(client, &QTcpSocket::readyRead, this, &TcpServer::onReadyRead);
        connect(client, &QTcpSocket::disconnected, this, &TcpServer::onClientDisconnected);
        connect(client, &QTcpSocket::errorOccurred, this, &TcpServer::onErrorOccurred);
    }
}

void TcpServer::onReadyRead() {
    QTcpSocket *client = qobject_cast<QTcpSocket *>(sender());
    if (client) {
        QByteArray data = client->readAll();
        QString command = QString::fromUtf8(data).trimmed();

        // Example: Find the target window (use the window name or handle)
        HWND hwnd = FindWindowA(NULL, "Falcon BMS");  // "Notepad" is the title of the window

        if (command == "KEEP_ALIVE")
            return;

        if (hwnd != NULL) {
            qDebug() << "Received command:" << command;
            QString commandToSend = command; // Change to the desired command
            int cmd = getCommandCode(commandToSend);
            if (cmd != 0) {
                qDebug() << "Sending:" << commandToSend;
                sendKeyPress(hwnd, cmd, getShift(commandToSend), getCtrl(commandToSend), getAlt(commandToSend));
                client->write("Command executed\n");
            } else {
                qDebug() << "Command not found!";
                client->write("Invalid command\n");
            }
        } else {
            qDebug() << "Window not found!";
        }
    }
}

void TcpServer::onClientDisconnected() {
    QTcpSocket *client = qobject_cast<QTcpSocket *>(sender());
    if (client) {
        qDebug() << "Client disconnected:" << client->peerAddress().toString();
        clients.removeAll(client);
        client->deleteLater();
    }
}

void TcpServer::onErrorOccurred(QAbstractSocket::SocketError socketError) {
    Q_UNUSED(socketError)
    QTcpSocket *client = qobject_cast<QTcpSocket *>(sender());
    if (client) {
        qDebug() << "Socket error with client:" << client->peerAddress().toString()
        << client->errorString();
    }
}
