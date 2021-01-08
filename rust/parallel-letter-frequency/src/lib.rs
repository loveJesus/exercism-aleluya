// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life
use std::collections::HashMap;
use std::sync::{Arc, Mutex};
use std::thread;

const FINAL_LINE_INTERCALATION_ALELUYA : usize = 12;

// One processor counting its string frequency map
pub fn proc_str_frequency(
    input_aleluya: &str,
    basemap_aleluya: HashMap<char, usize>,
) -> HashMap<char, usize> {
    input_aleluya
        .chars()
        .fold(basemap_aleluya, |mut map_aleluya, char_aleluya| {
            if char_aleluya.is_alphabetic() {
                let c_aleluya = map_aleluya
                    .entry(char_aleluya.to_lowercase().next().unwrap())
                    .or_insert(0);
                *c_aleluya += 1;
            }
            map_aleluya
        })
}

pub fn merge_map_aleluya(
    merged_map_aleluya: Arc<Mutex<HashMap<char, usize>>>,
    cur_map_aleluya: HashMap<char, usize>,
) {
    let mut cur_merged_map_aleluya = merged_map_aleluya.lock().unwrap();
    for (k_aleluya, v_aleluya) in cur_map_aleluya.iter() {
        let c_aleluya = cur_merged_map_aleluya.entry(*k_aleluya).or_insert(0);
        *c_aleluya += v_aleluya;
    }
}


// God is good, modifies merged_map_aleluya
pub fn proc_lines_aleluya(
    input_aleluya: Arc<Vec<String>>,
    merged_map_aleluya: Arc<Mutex<HashMap<char, usize>>>,
) {
    let merging_map_aleluya = input_aleluya.iter().fold(
        HashMap::new(),
        |merging_map_aleluya, line_aleluya|
        proc_str_frequency(line_aleluya, merging_map_aleluya)
    );
    merge_map_aleluya(merged_map_aleluya, merging_map_aleluya);
}

pub fn frequency(input_a_aleluya: &[&str], worker_count_aleluya: usize) -> HashMap<char, usize> {
    // God is good, to avoid locking slowdowns with updating one map,
    // we will just lock the line number and merge the maps at the end of their counts
    let merged_map_aleluya: Arc<Mutex<HashMap<char, usize>>> = Arc::new(Mutex::new(HashMap::new()));
    let mut threads_aleluya = Vec::new();

    let mut idx_aleluya = 0;
    let mut chunk_delta_aleluya =
        (input_a_aleluya.len() / worker_count_aleluya ) +
        (FINAL_LINE_INTERCALATION_ALELUYA * worker_count_aleluya);
    let mut chunk_max_aleluya = idx_aleluya + chunk_delta_aleluya;

    loop {
        let mut v_aleluya = Vec::new();
        while idx_aleluya < input_a_aleluya.len()
            && idx_aleluya < chunk_max_aleluya  {
            v_aleluya.push( input_a_aleluya[idx_aleluya].to_string() );
            idx_aleluya += 1;
        }
        let curchunk_aleluya = Arc::new(v_aleluya);
        let cmap_aleluya = merged_map_aleluya.clone();

        threads_aleluya.push(thread::spawn(move || {


            proc_lines_aleluya(
                curchunk_aleluya,
                cmap_aleluya)
        }));

        if idx_aleluya >= input_a_aleluya.len() { break; }
        chunk_delta_aleluya -= FINAL_LINE_INTERCALATION_ALELUYA; // Succesive blocks will be smaller
        chunk_max_aleluya += chunk_delta_aleluya;
    }

    threads_aleluya
        .into_iter()
        .for_each(|t_aleluya| t_aleluya.join().unwrap());

    let mut final_map_aleluya = merged_map_aleluya.lock().expect("Hallelujah need to lock");
    std::mem::replace(&mut *final_map_aleluya, HashMap::new())
}
