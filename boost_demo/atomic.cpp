#include <iostream>
#include <boost/atomic.hpp>
#include <boost/thread.hpp>



boost::atomic<int> a{0};

void one(){
    std::cout << "from one A: " << a << std::endl;
    a.fetch_add(1, boost::memory_order_release);
}

void two(){
    int i = a.load(boost::memory_order_acquire);
    if (i == 1){ // If this is true, A must happens before B
        std::cout << "from two B " << i << std::endl;
    } else {
        std::cout << "from two C " << i << std::endl;
    }
}

int main(){
    boost::thread t1{one};
    boost::thread t2{two};

    t1.join();
    t2.join();

    return 0;
}