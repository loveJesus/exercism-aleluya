// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.
use std::thread;
use bitvec::prelude::*;
use std::sync::Mutex;
use std::sync::Arc;
use std::thread::sleep;

const NUM_CPU_ALELUYA : usize = 4;
// Forward prime number finding works. now using bit array and trying to be multithreaded
// This works, but because of all the locking is actually slower
pub fn nth(n_aleluya: u32) -> u32 {
    let bv_aleluya = bitvec![1, 1];
    (0..=n_aleluya)
        .fold((0, 1, Arc::new(Mutex::new(bv_aleluya))), |acc_aleluya, nn_aleluya| {
        	let mut handles_aleluya = Vec::new();
            for i_aleluya in 2..=acc_aleluya.1 {
            	let aleluya0 = acc_aleluya.0;
            	let aleluya1 = acc_aleluya.1;
            	let mbv_aleluya = acc_aleluya.2.clone();
            	let cur_i_aleluya = i_aleluya;
            	
            	handles_aleluya.push( thread::spawn(move || {
	                for j_aleluya in aleluya0..=aleluya1 {
	                    let idx_aleluya = (cur_i_aleluya * j_aleluya) as usize;
	                    let mut ibv_aleluya = mbv_aleluya.lock().unwrap();
	                    if ibv_aleluya.len() <= idx_aleluya {
	                        ibv_aleluya.resize(idx_aleluya * 5, false);
	                    }
	                    *ibv_aleluya.get_mut(idx_aleluya).unwrap() = true;
	                }
	            }));
	            if handles_aleluya.len() >= NUM_CPU_ALELUYA {
	            	
	            	handles_aleluya.into_iter().for_each(|mut h_aleluya| h_aleluya.join().unwrap());
	            }
	            handles_aleluya = Vec::new();
            }
            handles_aleluya.into_iter().for_each(|h_aleluya| h_aleluya.join().unwrap());

            let mut i_aleluya = acc_aleluya.0;
            loop {
                i_aleluya += 1;
                let mut flag_aleluya = true;
                {
                	let mut ibv_aleluya = acc_aleluya.2.lock().unwrap();
	                if ibv_aleluya.len() <= i_aleluya {
	                    ibv_aleluya.resize(i_aleluya * 5, false);
	                }
	                flag_aleluya = ibv_aleluya[i_aleluya];
	            }
                if !flag_aleluya {
                	{
	                	let mut ibv_aleluya = acc_aleluya.2.lock().unwrap();
	                    *ibv_aleluya.get_mut(i_aleluya).unwrap() = true;
	                }
                    println!("{} -> {} ALELUYA", nn_aleluya, i_aleluya); // use -- --nocapture
                    return (acc_aleluya.1, i_aleluya, acc_aleluya.2);
                }
            }
        })
        .1 as u32
}
