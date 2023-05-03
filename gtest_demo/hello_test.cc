#include <gtest/gtest.h>
#include "hello.hpp"


// Demonstrate some basic assertions.
TEST(HelloTest, BasicAssertions) {
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
  // Expect equality.
  EXPECT_EQ(7 * 6, 42);
}

TEST(HelloTest, Test_getHello)
{
    EXPECT_EQ(std::string("Hello"), getHello());
    EXPECT_NE(std::string("hello"), getHello());
}

// Returns true if m and n have no common divisors except 1.
bool MutuallyPrime(int a, int b)
{
    for (;;)
    {
      if (!(a %= b))
        return b == 1;
      if (!(b %= a))
        return a == 1;
    }
}

TEST(test_expect_pred, mutally_prime)
{
    const int a = 3;
    const int b = 4;
    const int c = 10;

    EXPECT_PRED2(MutuallyPrime, a, b); // Succeeds
    EXPECT_PRED2(MutuallyPrime, b, c); // Fails
}

bool IsPositive(int n){
    return n > 0;
}

bool IsPositive(double n){
    return n > 0;
}

TEST(test_expect_pred, function_override)
{
    EXPECT_PRED1(static_cast<bool (*)(int)>(IsPositive), 5);
    EXPECT_PRED1(static_cast<bool (*)(double)>(IsPositive), 3.14);
}


template <typename T>
bool IsNegative(T x) {
  return x < 0;
}

TEST(test_expect_pred, function_template)
{
  EXPECT_PRED1(IsNegative<int>, -5); // Must specify type for IsNegative
}

testing::AssertionResult IsEven(int n) {
  if ((n % 2) == 0)
    return testing::AssertionSuccess();
  else
    return testing::AssertionFailure() << n << " is odd";
}

TEST(test_AssertionResult, custom_failure_message)
{
  //  Value of: IsEven(5)
  //   Actual: false (5 is odd)
  //  Expected: true
  EXPECT_TRUE(IsEven(5)); // fail with custom message
}
