
class MyInterface
{
public:
    virtual ~MyInterface() = default;
    virtual void Method1() = 0;
    virtual bool Method2(int) = 0;
};
