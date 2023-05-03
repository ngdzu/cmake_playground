#include <boost/thread.hpp>
#include <iostream>

struct Runnable {
    void operator()(){
        std::cout << "run from separate thread" << std::endl;
    }
};

int main() {
    boost::thread some_thread{Runnable()};

    some_thread.join();
    return 0;
}