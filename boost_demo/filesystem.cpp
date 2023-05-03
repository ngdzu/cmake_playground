#include <iostream>
#include <boost/filesystem.hpp>
using namespace boost::filesystem;
using namespace std;
int main(int argc, char *argv[])
{
	path p = "../testdata/test1.dat";

	// Current directory is build/
	boost::filesystem::path full_path(boost::filesystem::current_path());

	cout << full_path << std::endl;

	if (exists(p)) // does path p actually exist?
	{
		if (is_regular_file(p)) // is path p a regular file?
			cout << p << " size is " << file_size(p) << '\n';

		else if (is_directory(p)) // is path p a directory?
			cout << p << " is a directory\n";

		else
			cout << p << " exists, but is not a regular file or directory\n";
	}
	else
		cout << p << " does not exist\n";
	return 0;
}