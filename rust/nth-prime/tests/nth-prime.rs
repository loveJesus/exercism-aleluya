use nth_prime as np;

#[test]
fn test_first_prime() {
    assert_eq!(np::nth(0), 2);
}

#[test]
fn test_second_prime() {
    assert_eq!(np::nth(1), 3);
}

#[test]
fn test_sixth_prime() {
    assert_eq!(np::nth(99), 541);
}

#[test]

fn test_big_prime() {
    println!("HALLELUJAH");
    assert_eq!(np::nth(10_000), 104_743);
}
