#include <iostream>

using namespace std;

int main()
{
	const int kb = 1024;
	const int mb = kb*kb;
	cout << "NBody.GPU" << endl << "=============" << endl << endl;
	//cout < "CUDA Version:\tv" << CUDART_VERSION << endl;
	

	int devCount;
	cudaGetDeviceCount(&devCount);
	cout << "CUDA Devices: " << endl << endl;
	for (int i = 0; i < devCount; i++) 
	{
		cudaDeviceProp props;
		cudaGetDeviceProperties(&props, i);
		cout << i << ": " << props.name << ": " << props.major << "." << props.minor << endl;
        cout << "  Global memory:   " << props.totalGlobalMem / mb << "mb" << endl;
        cout << "  Shared memory:   " << props.sharedMemPerBlock / kb << "kb" << endl;
        cout << "  Constant memory: " << props.totalConstMem / kb << "kb" << endl;
        cout << "  Block registers: " << props.regsPerBlock << endl << endl;

        cout << "  Warp size:         " << props.warpSize << endl;
        cout << "  Threads per block: " << props.maxThreadsPerBlock << endl;
        cout << "  Max block dimensions: [ " << props.maxThreadsDim[0] << ", " << props.maxThreadsDim[1]  << ", " << props.maxThreadsDim[2] << " ]" << endl;
        cout << "  Max grid dimensions:  [ " << props.maxGridSize[0] << ", " << props.maxGridSize[1]  << ", " << props.maxGridSize[2] << " ]" << endl;
	}

	return 0;
}
