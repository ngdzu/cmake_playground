#include <memory>
class MyInterface;

class MyWork
{
public:
    explicit MyWork(std::unique_ptr<MyInterface> object);
    void doWork1();
    bool doWork2(int input);

private:
    std::unique_ptr<MyInterface> m_object;
};