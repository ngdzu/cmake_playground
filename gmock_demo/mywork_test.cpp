#include "mywork.h"
#include "MyInterface.h"
#include <gtest/gtest.h>
#include <gmock/gmock.h>

using ::testing::_;
using ::testing::Return;

class MyClass : public MyInterface
{
public:
    MOCK_METHOD(void, Method1, (), (override));
    MOCK_METHOD(bool, Method2, (int), (override));
};

TEST(MyWorkTest, basic)
{
    MyClass *myClass = new MyClass;
    MyWork object = MyWork(std::unique_ptr<MyInterface>(myClass));

    EXPECT_CALL(*myClass, Method1()).WillOnce(Return());
    object.doWork1();

    int input = 0;
    bool result = false;
    bool expect = false;

    input = 0;
    expect = false;
    EXPECT_CALL(*myClass, Method2(input)).WillOnce(Return(expect));
    object.doWork2(input);
    EXPECT_EQ(result, expect);


    input = 1;
    expect = true;
    EXPECT_CALL(*myClass, Method2(input)).WillOnce(Return(expect));
    result = object.doWork2(input);
    EXPECT_EQ(result, expect);

    input = 2;
    expect = true;
    EXPECT_CALL(*myClass, Method2(input)).WillOnce(Return(expect));
    result = object.doWork2(input);
    EXPECT_EQ(result, expect);

}