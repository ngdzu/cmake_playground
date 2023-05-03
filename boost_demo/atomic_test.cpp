#include <gtest/gtest.h>

#include <boost/thread.hpp>
#include <boost/atomic.hpp>

using boost::atomic;

TEST(atomic_test, constructor_test){
    atomic<int> a{0};
    a++;
    EXPECT_EQ(1, a);
    a++;
    EXPECT_EQ(2, a);
}

