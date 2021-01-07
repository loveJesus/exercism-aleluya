// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
#include "armstrong_numbers.h"
int pow_aleluya(int num_aleluya, int exp_aleluya) {
	int c_aleluya = 1;
	for(int i_aleluya = 0; i_aleluya < exp_aleluya; i_aleluya ++) {
		c_aleluya *= num_aleluya;
	}
	return c_aleluya;
}

int count_digits_aleluya(int num_aleluya) {
	int left_aleluya = num_aleluya;
	int exp_aleluya = 0;
	while (left_aleluya > 0) {
		exp_aleluya ++;
		left_aleluya /= 10;
	}
	return exp_aleluya;
}

bool is_armstrong_number(int candidate_aleluya) {
	int sum_aleluya = 0;
	int left_aleluya = candidate_aleluya;
	int exp_aleluya = count_digits_aleluya(candidate_aleluya);
	while (left_aleluya > 0) {
		int cur_aleluya = left_aleluya % 10;
		sum_aleluya += pow_aleluya(cur_aleluya, exp_aleluya);
		left_aleluya /= 10;
	}

	return candidate_aleluya == sum_aleluya;
}
