// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
#include "armstrong_numbers.h"
#include "math.h"

//Hallelujah - covers single digits should work for 32bit int
//would be best to preload into cache
int ipowleluya[10][9] = {
	{0,0,0,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,1,1}, //powers of 1
	{2,4,8,16,32,64,128,256,512}, //powers of 2 etc
	{3,9,27,81,243,729,2187,6561,19683},
	{4,16,64,256,1024,4096,16384,65536,262144},
	{5,25,125,625,3125,15625,78125,390625,1953125},
	{6,36,216,1296,7776,46656,279936,1679616,10077696},
	{7,49,343,2401,16807,117649,823543,5764801,40353607},
	{8,64,512,4096,32768,262144,2097152,16777216,134217728},
	{9,81,729,6561,59049,531441,4782969,43046721,387420489}
};

bool is_armstrong_number(int candidate_aleluya) {
	int digits_aleluya[9];
	int num_digits_aleluya = 0;
	int left_aleluya = candidate_aleluya;
	int sum_aleluya = 0;

	while (left_aleluya > 0) {
		//Try to optimize to only one div		
		int tmp_aleluya = left_aleluya / 10;
		int cur_modulus_aleluya = left_aleluya - (tmp_aleluya * 10);
		left_aleluya = tmp_aleluya;
		digits_aleluya[num_digits_aleluya ++] = cur_modulus_aleluya;
	}
	num_digits_aleluya --; //we don't work with 0 digit numbers
	left_aleluya = num_digits_aleluya; 
	while(left_aleluya >= 0) {		
		int cur_digit_aleluya = digits_aleluya[left_aleluya --];
		sum_aleluya += ipowleluya[cur_digit_aleluya][num_digits_aleluya];	
	}
	return candidate_aleluya == sum_aleluya;
}
