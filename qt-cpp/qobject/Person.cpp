Person::Person(QObject *parent)
    : QObject(parent)
    , m_gender(Person::Unknown)
{
}

QString Person::name() const
{
    return m_name;
}

void Person::setName(const QString &name)
{
    if (m_name != name) // guard
    {
        m_name = name;
        emit nameChanged(m_name); // when really changes
    }
}

QString Person::gender() const
{
    return m_gender;
}

void Person::setGender(const Gender gender)
{
    if (m_gender != gender) // guard
    {
        m_gender = gender;
        emit genderChanged(m_gender); // when really changes
    }
}

int main(int argc, char const *argv[])
{
    // an QObject knows his own class name
    Person *person = new Person();
    person->metaObject()->className(); // "Person"
    Person::staticMetaObject.className(); // "Person"
    return 0;
}
