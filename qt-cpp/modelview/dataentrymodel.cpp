#include "dataentrymodel.h"

DataEntryModel::DataEntryModel(QObject *parent)
    : QAbstractListModel(parent)
{
    // inicializar os dados (QList<QString>) com uma lista de nomes de cor
    m_data = QColor::colorNames();
}

DataEntryModel::~DataEntryModel()
{
}

int DataEntryModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);

    // retorna a quantidade de dados
    return m_data.count();
}

QVariant DataEntryModel::data(const QModelIndex &index, int role) const
{
    // o index retorna a informação da linha e coluna requisitada
    // vamos ignorar a linha e utilizar apenas a linha (row)
    int row = index.row();

    // verificar os limites da linha
    if (row < 0 || row >= m_data.count()) {
        return QVariant();
    }

    // Um "model" pode retornar dado para diferentes "roles".
    // O "role" padrão é o "display role".
    // Isso pode ser acessado no código QML como "model.display"
    if (role ==  Qt::DisplayRole) {
        return m_data.value(row);
    }

    // A view pediu por outro dado, apenas retorne um QVariant vazio
    return QVariant();
}
