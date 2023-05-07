#include "mywork.h"
#include "MyInterface.h"

MyWork::MyWork(std::unique_ptr<MyInterface> object)
: m_object(std::move(object))
{
}

void MyWork::doWork1()
{
    m_object->Method1();
}

bool MyWork::doWork2(int input)
{
    return m_object->Method2(input);
}
