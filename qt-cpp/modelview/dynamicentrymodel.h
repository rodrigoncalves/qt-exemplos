#ifndef DYNAMICENTRYMODEL_H
#define DYNAMICENTRYMODEL_H

#include <QtCore>
#include <QtGui>

class DynamicEntryModel : public QAbstractListModel
{
    Q_OBJECT
    // cria um get para a propriedade count que retorna
    // a quantidade de elementos
    Q_PROPERTY(int count READ count NOTIFY countChanged)
public:
    explicit DynamicEntryModel(QObject *parent = 0);
    ~DynamicEntryModel();

    enum RoleNames {
        NameRole = Qt::UserRole,
        HueRole = Qt::UserRole+2,
        SaturationRole = Qt::UserRole+3,
        BrightnessRole = Qt::UserRole+4
    };

    // insere uma cor no index (0 no início, count-1 no final)
    Q_INVOKABLE void insert(int index, const QString &colorValue);
    // usa insert para inserir uma cor ao final da lista
    Q_INVOKABLE void append(const QString &colorValue);
    // remove uma cor a partir de um index
    Q_INVOKABLE void remove(int index);
    // limpa todos os dados (reset)
    Q_INVOKABLE void clear();

    // faz um get a partir de um index
    Q_INVOKABLE QColor get(int index);

public: // interface QAbstractListModel
    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    int count() const;

signals:
    void countChanged(int arg);

protected: // interface QAbstractListModel
    virtual QHash<int, QByteArray> roleNames() const;

private:
    QList<QColor> m_data;
    QHash<int, QByteArray> m_roleNames;
    int m_count;
};

#endif // DYNAMICENTRYMODEL_H
