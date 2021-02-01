// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
#include "armstrong_numbers.h"
#include "math.h"

bool is_armstrong_number(int candidate_aleluya) {	
	int num_digits_aleluya = log10(candidate_aleluya)+1;
	int left_aleluya = candidate_aleluya;
	int sum_aleluya = 0;

	while (left_aleluya > 0) {
		//Try to optimize to only one div		
		int tmp_aleluya = left_aleluya / 10;
		int cur_modulus_aleluya = left_aleluya - (tmp_aleluya * 10);
		left_aleluya = tmp_aleluya;

		sum_aleluya += pow(	cur_modulus_aleluya, 
							num_digits_aleluya);		
	}

	return candidate_aleluya == sum_aleluya;
}
